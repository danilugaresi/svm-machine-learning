# Problema dual suavizado de clasificación con SVMs #

param nobs; # Número de observaciones
param dim integer >= 1; # Dimensión
param C > 0; # Parámetro de penalización 

param data{i in 1..nobs, d in 1..dim}; # Coordenadas de cada observación
param y{i in 1..nobs}; # Etiqueta +1 o -1 en cada observación

var u{i in 1..nobs} >=0, <= C; # Incluimos al definir las variables duales la restricción 0 <= alpha <= C directamente

maximize objetivo: sum{i in 1..nobs} u[i]- 
(1/2)*sum{i in 1..nobs,j in 1..nobs} y[i]*y[j]*u[i]*u[j]*(sum{d in 1..dim} data[i,d]*data[j,d]);

subject to fuerzas: sum{i in 1..nobs} y[i]*u[i]=0;