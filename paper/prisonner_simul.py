import numpy as np
import matplotlib.pyplot as plt

# Parameters
gamma = 2.0   # Competitive advantage
beta = 1.0    # Baseline profit gain
k = 0.5       # Cost of automation
N = 50        # Number of firms
T = 50        # Number of iterations
mutation_rate = 0.05  # Probability of strategy change

# Payoff matrix for Prisoner's Dilemma (T > R > P > S)
T = 5  # Temptation to defect
R = 3  # Reward for mutual cooperation
P = 1  # Punishment for mutual defection
S = 0  # Sucker's payoff

# Initialize strategies: 0 = cooperate (retain labor), 1 = defect (automate)
strategies = np.random.choice([0, 1], size=N, p=[0.5, 0.5])
automation_levels = np.linspace(0, 1, N)  # Initial automation levels

# Track automation over time
automation_history = []

for t in range(T):
    # Calculate payoffs for each firm
    payoffs = np.zeros(N)
    for i in range(N):
        for j in range(N):
            if i != j:
                if strategies[i] == 0 and strategies[j] == 0:
                    payoffs[i] += R
                elif strategies[i] == 0 and strategies[j] == 1:
                    payoffs[i] += S
                elif strategies[i] == 1 and strategies[j] == 0:
                    payoffs[i] += T
                else:
                    payoffs[i] += P

    # Update automation levels based on profit function
    for i in range(N):
        # Profit function: Π_A = γ*a_A*(1 - a_B) + β*a_A - k*a_A^2
        # Here, a_B is the average automation of other firms
        a_B = np.mean([automation_levels[j] for j in range(N) if j != i])
        profit = gamma * automation_levels[i] * (1 - a_B) + beta * automation_levels[i] - k * automation_levels[i]**2

        # Firms adjust automation based on relative profit
        if payoffs[i] < np.mean(payoffs):
            automation_levels[i] = min(1.0, automation_levels[i] + 0.1)  # Increase automation
        else:
            automation_levels[i] = max(0.0, automation_levels[i] - 0.05)  # Decrease automation

        # Random mutation (strategy change)
        if np.random.random() < mutation_rate:
            strategies[i] = 1 - strategies[i]

    automation_history.append(np.mean(automation_levels))

# Plot results
plt.figure(figsize=(10, 6))
plt.plot(range(T), automation_history, label='Average Automation Level', color='red')
plt.axhline(y=1.0, color='gray', linestyle='--', label='Full Automation')
plt.xlabel('Iteration')
plt.ylabel('Automation Level')
plt.title('Iterated Prisoner\'s Dilemma: AGI Adoption Dynamics')
plt.legend()
plt.grid(True)
plt.show()
