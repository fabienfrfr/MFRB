import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# --- Paramètres ---
N_firms = 10
T = 100
beta = 1.0
mutation_rate = 0.05
runs_per_setting = 10
gammas = np.linspace(1.0, 3.0, 3)  # Simplifié à 3 valeurs
ks = np.linspace(0.2, 1.0, 3)  # Simplifié à 3 valeurs
alpha = 0.7  # Propension à consommer
phi = 0.5  # Impact de la demande sur les profits


# --- Fonction de profit avec demande ---
def profit(a_i, a_j, gamma, beta, k, all_a, alpha, phi):
    D = alpha * np.mean(1 - all_a)  # Demande = alpha × moyenne des employés humains
    return (
        gamma * a_i * (1 - a_j)
        + beta * a_i
        - k * a_i**2
        + (gamma + beta + k) * (2 * D - 1)
    )


# --- Simulation ---
def simulate(gamma, k):
    automation_levels = np.random.rand(N_firms) / 10
    history = []
    for t in range(T):
        new_levels = automation_levels.copy()
        profits = np.array(
            [
                profit(
                    a_i,
                    np.mean(np.delete(automation_levels, i)),
                    gamma,
                    beta,
                    k,
                    automation_levels,
                    alpha,
                    phi,
                )
                for i, a_i in enumerate(automation_levels)
            ]
        )
        for i in range(N_firms):
            j = np.random.choice(np.delete(np.arange(N_firms), i))
            pi_i = profits[i]
            pi_j = profits[j]
            p_adopt = 1 / (1 + np.exp(-(pi_j - pi_i)))
            if np.random.rand() < p_adopt:
                new_levels[i] = automation_levels[j]
            if np.random.rand() < mutation_rate:
                new_levels[i] = np.clip(
                    automation_levels[i] + np.random.normal(scale=0.1), 0, 1
                )
        automation_levels[:] = new_levels
        history.append(np.mean(automation_levels))
    return history


# --- Collecte des résultats ---
records = []
for gamma in gammas:
    for k in ks:
        all_runs = []
        print(f"Simulation pour γ={gamma:.2f}, k={k:.2f}...")
        for run in range(runs_per_setting):
            history = simulate(gamma, k)
            all_runs.append(history)
            for t, avg_auto in enumerate(history):
                records.append(
                    {
                        "gamma": gamma,
                        "k": k,
                        "round": t,
                        "run": run,
                        "avg_automation": avg_auto,
                    }
                )

# --- Analyse des résultats ---
df = pd.DataFrame(records)
stats = (
    df.groupby(["gamma", "k", "round"])["avg_automation"]
    .agg(["mean", "std"])
    .reset_index()
)

# --- Heatmap des niveaux finaux ---
final_stats = stats[stats["round"] == T - 1]
pivot_heatmap = final_stats.pivot(index="k", columns="gamma", values="mean")
plt.figure(figsize=(8, 6))
sns.heatmap(pivot_heatmap, annot=True, fmt=".2f", cmap="viridis")
plt.title(f"Niveau final d'automatisation (moyenne sur {runs_per_setting} runs)")
plt.xlabel(r"$\gamma$ (Avantage compétitif)")
plt.ylabel(r"$k$ (Coût d'automatisation)")
plt.tight_layout()
plt.savefig("final_automation_heatmap.pdf")
plt.close()

# --- Dynamique avec bandes d'erreur ---
plt.figure(figsize=(10, 6))
for (gamma, k), group in stats.groupby(["gamma", "k"]):
    plt.plot(group["round"], group["mean"], label=f"γ={gamma:.2f}, k={k:.2f}")
    plt.fill_between(
        group["round"],
        group["mean"] - group["std"] / 2,
        group["mean"] + group["std"] / 2,
        alpha=0.2,
    )
plt.xlabel("Round")
plt.ylabel("Niveau moyen d'automatisation")
plt.title(f"Dynamique d'automatisation (moyenne ± écart-type)")
plt.legend(loc="center left", bbox_to_anchor=(1, 0.5), fontsize="small")
plt.tight_layout()
plt.savefig("automation_dynamics_stddev.pdf")
plt.close()

print("Simulations terminées. Graphiques enregistrés.")
