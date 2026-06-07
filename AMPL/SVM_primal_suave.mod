# Problema primal suavizado de clasificación con SVMs #

param nobs; # Número de observaciones
param dim integer >= 1; # Dimensión
param C > 0; # Parámetro de penalización 

param data{i in 1..nobs, d in 1..dim}; # Coordenadas de cada observación
param y{i in 1..nobs}; # Etiqueta +1 o -1 en cada observación

var w{d in 1..dim}; # Vector normal al hiperplano
var xi{i in 1..nobs} >= 0; # Holguras
var b;

minimize normasuav: (1/2)*sum{d in 1..dim} w[d]^2 + C*sum{i in 1..nobs}xi[i];
subject to clases{i in 1..nobs}:
	y[i]*(b+sum{d in 1..dim}(w[d]*data[i,d])) - 1 + xi[i] >= 0;
