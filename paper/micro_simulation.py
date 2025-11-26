import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# --- Parameters ---
N_firms = 10
T = 1000
beta = 1.0
mutation_rate = 0.05
runs_per_setting = 10
gammas = np.array([0.5, 1, 2, 3])  # Competitive advantage
ks = np.linspace(0.2, 2.0, 4)  # Cost of automation


# --- Corrected Profit Function (without problematic demand term) ---
def profit(a_i, a_j, gamma, beta, k):
    return gamma * a_i * (1 - a_j) + beta * a_i - k * a_i**2


# --- Simulation ---
def simulate(gamma, k):
    automation_levels = np.random.rand(N_firms) / 10
    history = []
    for t in range(T):
        new_levels = automation_levels.copy()
        profits = np.zeros(N_firms)
        for i in range(N_firms):
            a_j = np.mean(np.delete(automation_levels, i))
            profits[i] = profit(automation_levels[i], a_j, gamma, beta, k)

        # Update automation levels via imitation and mutation
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
        automation_levels = new_levels
        history.append(np.mean(automation_levels))
    return history


# --- Collect results ---
records = []
for gamma in gammas:
    for k in ks:
        all_runs = []
        print(f"Simulating for γ={gamma:.2f}, k={k:.2f}...")
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

# --- Analyze results ---
df = pd.DataFrame(records)
stats = (
    df.groupby(["gamma", "k", "round"])["avg_automation"]
    .agg(["mean", "std"])
    .reset_index()
)

# --- Final automation levels (for heatmap) ---
final_stats = stats[stats["round"] == T - 1]
pivot_heatmap = final_stats.pivot(index="k", columns="gamma", values="mean")

# --- Print heatmap values ---
print("\nFinal Automation Levels (Heatmap Values):")
print(pivot_heatmap.to_string(float_format="%.3f"))

# --- Plot heatmap and dynamics on the same figure ---
fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(16, 6))

# Heatmap
sns.heatmap(
    pivot_heatmap,
    annot=True,
    fmt=".2f",
    cmap="viridis",
    ax=ax1,
    xticklabels=[f"γ={g:.1f}" for g in gammas],
    yticklabels=[f"k={k:.1f}" for k in ks],
)
ax1.set_title(f"Final Automation Level (mean over {runs_per_setting} runs)")
ax1.set_xlabel(r"$\gamma$ (Competitive Advantage)")
ax1.set_ylabel(r"$k$ (Cost of Automation)")

# Dynamics
for (gamma, k), group in stats.groupby(["gamma", "k"]):
    ax2.plot(group["round"], group["mean"], label=f"γ={gamma:.2f}, k={k:.2f}")
    ax2.fill_between(
        group["round"],
        group["mean"] - group["std"] / 2,
        group["mean"] + group["std"] / 2,
        alpha=0.2,
    )
ax2.set_xlabel("Round")
ax2.set_ylabel("Average Automation Level")
ax2.set_title(f"Automation Dynamics (mean ± standard deviation)")
ax2.legend(loc="center left", bbox_to_anchor=(1, 0.5), fontsize="small")

plt.tight_layout()
plt.savefig("combined_automation_results.pdf")
plt.close()

print(
    "\nSimulations completed. Combined plot saved as 'combined_automation_results.pdf'."
)
