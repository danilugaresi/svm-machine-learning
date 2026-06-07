import matplotlib.pyplot as plt
import numpy as np

np.random.seed(12232)

r = 1.0

n_in = 15
n_out = 15

theta_in = 2*np.pi*np.random.rand(n_in)
rad_in = r * np.sqrt(np.random.rand(n_in))
x_in = np.column_stack((rad_in*np.cos(theta_in), rad_in*np.sin(theta_in)))

theta_out = 2*np.pi*np.random.rand(n_out)
rad_out = r + 0.5*np.random.rand(n_out)
x_out = np.column_stack((rad_out*np.cos(theta_out), rad_out*np.sin(theta_out)))

fig1, ax1 = plt.subplots(figsize=(6,6))
ax1.scatter(x_in[:,0], x_in[:,1], label="Clase 1 (interior)", color="tab:blue")
ax1.scatter(x_out[:,0], x_out[:,1], label="Clase 2 (exterior)", color="tab:orange")

# Ejemplo de posible clasificador lineal
t = np.linspace(0, 2*np.pi, 200)
ax1.plot(r*np.cos(t), r*np.sin(t), color="black", linewidth=2, label="Separador circular")

ax1.set_aspect('equal')
ax1.set_title("Separador no lineal", fontsize=14)
ax1.legend()
ax1.grid(True)

plt.show()