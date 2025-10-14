import numpy as np
import matplotlib.pyplot as plt

T = 50
N = 1_000_000
alpha = 0.3
beta = 0.7
A = 1.0
K = 1.0

# Propension à consommer moyenne pondérée
c_employed = 0.9
c_unemployed = 0.5


# Redistribution exogène (ex: UBI ou MBI), variation ΔR(t)
def redistribution(t):
    if t < 10:
        return 0.0
    else:
        return 0.3


# Initialisation variables
u = 0.0
unemployment_history = []
output_history = []
consumption_history = []
Y = A * (K**alpha) * (N**beta)  # PIB initial sans chômage

for t in range(T):
    u = min(1.0, u + 0.02)  # taux de chômage croissant

    # Production effective selon chômage
    Y = A * (K**alpha) * (((1 - u) * N) ** beta)

    # Redistribution à ce temps
    R = redistribution(t)

    # Revenu total (salariés + chômeurs + redistribution)
    Y_employed = Y * (1 - u)
    Y_unemployed = Y * u
    total_income = Y_employed + Y_unemployed + N * R

    # Propension marginale moyenne à consommer pondérée par emploi
    c = c_employed * (1 - u) + c_unemployed * u

    # Calcul consommation agrégée avec multiplicateur keynésien
    # Consommation de base + effet multiplicateur sur redistribution
    C_base = c * (Y_employed + Y_unemployed)
    delta_R = N * R
    multiplier = 1 / (1 - c)
    C = C_base + multiplier * delta_R

    unemployment_history.append(u)
    output_history.append(Y)
    consumption_history.append(C)

plt.figure(figsize=(12, 8))
plt.plot(unemployment_history, label="Unemployment Rate (u)")
plt.plot(output_history, label="Output (Y)")
plt.plot(consumption_history, label="Consumption (C) with Keynesian Multiplier")
plt.xlabel("Time (Periods)")
plt.ylabel("Value")
plt.title("Macro Simulation with Keynesian Multiplier and Redistribution")
plt.legend()
plt.grid(True)
plt.show()
