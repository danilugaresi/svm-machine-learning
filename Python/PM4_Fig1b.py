import matplotlib.pyplot as plt
import numpy as np

np.random.seed(1223)

n_p = 15
n_n = 15

x_p = np.random.randn(n_p,2) + np.array([1,1])
x_n = np.random.randn(n_n,2) + np.array([-1,-1])

# Para que se mezclen un poco
x_p[0] = np.array([-0.1, 0.0])
x_n[0] = np.array([0.1, -0.1])

fig2, ax2 = plt.subplots(figsize=(7,5))
ax2.scatter(x_p[:,0], x_p[:,1], label="Clase 1", color="tab:blue")
ax2.scatter(x_n[:,0], x_n[:,1], label="Clase 2", color="tab:orange")

# Ejemplo de posible clasificador no lineal (no es el real)
slopes = [-2.75]
xs = np.array([-3, 3])

for slope in slopes:
    ys = slope * xs
    ax2.plot(xs, ys, linestyle="-", label=f"Clasificador lineal",color="black")

ax2.legend()
ax2.set_title("Separador no perfectamente lineal", fontsize=14)
ax2.grid(True)

plt.show()