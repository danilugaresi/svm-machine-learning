# Support Vector Machines y Clasificación Supervisada
Proyecto académico desarrollado en el marco del Máster en Técnicas Estadísticas de la Universidade de Santiago de Compostela.
## Descripción
Este proyecto estudia las Máquinas de Vectores de Soporte (Support Vector Machines, SVMs) desde las perspectivas de la optimización matemática y el aprendizaje automático.

Partiendo de la formulación clásica linealmente separable, se derivan y analizan las versiones de margen suave (soft-margin) y tipo núcleo (kernel) mediante sus correspondientes problemas duales de optimización.

Posteriormente, la metodología se aplica a un problema real de clasificación utilizando datos del Instituto Nacional de Estadística (INE), cuyo objetivo es identificar hogares en riesgo de pobreza a partir de indicadores socioeconómicos.
## Contents
* Introducción
* SVMs lineales
* C-SVMs (SVMs de margen suave)
* Formulaciones duales
* Métodos kernel
* Kernels polinómicos y gaussianos
* Interpretación de los vectores de soporte
* Aplicación a datos reales
* Conclusiones
* Referencias
## Tools
- R: preprocesamiento de datos, análisis estadístico y preparación del conjunto de datos del INE para su utilización en AMPL.
- AMPL: formulación y resolución de los modelos de optimización asociados a las C-SVMs y a las SVMs con kernels.
- Python: visualización de ejemplos mediante NumPy y Matplotlib.
## Estructura del repositorio
```text
.
├── report.pdf
├── AMPL/
├── Python/
├── R/
├── Figures/
└── README.md
```

