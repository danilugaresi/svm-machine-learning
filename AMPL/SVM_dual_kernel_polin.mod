# Problema dual suavizado con kernel polinómico de clasificación con SVMs #

param nobs; # Número total de observaciones
param dim integer >= 1; # Dimensión en la que vamos a trabajar
param C > 0; # Parámetro de penalización

param data{i in 1..nobs, d in 1..dim}; # Coordenadas de los datos
param y{i in 1..nobs}; # Etiquetas +1 y -1

param grado integer >= 1 default 2; # El grado del kernel polinómico, si no se indica toma grado 2 por defecto
param desp default 1; # El desplazamiento c del kernel polinómico, por defecto 1
param K{i in 1..nobs, j in 1..nobs} := ( desp + sum{k in 1..dim} data[i,k]*data[j,k] )^grado; # Calculamos cada K(x^i,x^j)

var u{i in 1..nobs} >=0, <=C; # Variables duales 

maximize objetivo: sum{i in 1..nobs} u[i]- 
(1/2)*sum{i in 1..nobs,j in 1..nobs} y[i]*y[j]*u[i]*u[j]*K[i,j];

subject to fuerzas: sum{i in 1..nobs} y[i]*u[i]=0;