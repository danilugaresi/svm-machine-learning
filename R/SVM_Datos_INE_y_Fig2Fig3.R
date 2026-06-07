# Script de R utilizado para obtener los datos de la ECV de 2024 del INE para 
# la clasificación lineal. También están los ggplot que sacan la Figura 2 del
# trabajo

load("ECV_Th_2024.RData")
dat <- df_micro

m = 20 # Número de datos
datos = data.frame("Pobreza" = dat$vhPobreza, "Renta" = dat$HY020, "Gastos" = dat$HH070)
head(datos)
# Escalado
datos$Renta = datos$Renta/10000
datos$Gastos = datos$Gastos/100
attach(datos)
# detach(datos)
# Dado que tenemos demasiados datos, nos quedamos con 20 en riesgo y 20 en no riesgo
en_riesgo     = subset(datos, Pobreza == 1)
no_en_riesgo  = subset(datos, Pobreza == 0)
semilla = 03122025
set.seed(semilla)
ejemplo <- rbind(en_riesgo[sample(nrow(en_riesgo),m),],no_en_riesgo[sample(nrow(no_en_riesgo),m),])
ejemplo$Pobreza[ejemplo$Pobreza == 0] = -1

nobs = as.integer(length(ejemplo$Renta))
dim = 2
classif = as.numeric(ejemplo$Pobreza)

datosR <- "SVM_ECV.dat"
sink(datosR)

cat("## Datos INE ECV 2024 -- con semilla=",semilla,"\n\n",sep="")

cat("param nobs:=",nobs,";\n",sep="")
cat("param dim:=",dim,";\n",sep="")
cat("param C:=",0.1,";\n",sep="")
cat("# param C:=",1,";\n",sep="")
cat("# param C:=",10,";\n",sep="")
cat("# param C:=",100,";\n",sep="")
cat("param data:",paste(1:dim,sep=" "),":=",sep=" ")

for (i in 1:nobs){
  cat("\n",i,as.numeric(ejemplo[i,2:3]))
}
cat(";\n")
cat("param y:=")
for (i in 1:nobs){
  cat(" ",i,classif[i])
}
cat(";\n")

sink()

# Plot según el grupo
library(ggplot2)

ejemplo$Pobreza = factor(ejemplo$Pobreza,levels = c(-1, 1),labels = c("No riesgo", "En riesgo"))

# Figura 2a
ggplot(ejemplo, aes(x = Renta, y = Gastos, color = Pobreza)) +
  geom_point(size = 3) +
  theme_minimal(base_size = 14) +
  labs(
    title = "Riesgo de pobreza",
    x = "Renta (escalada)",
    y = "Gastos (escalados)",
    color = "Grupo"
  ) +
  theme(plot.title = element_text(hjust = 0.5))

# Plot del hiperplano suavizado
w1 = -1.5695
w2 =  0.1372
b  =  2.7541

# Gastos = -(w1/w2)*Renta - b/w2

pendiente  = -(w1/w2)
intercepto = -(b/w2)

# Figura 2b
ggplot(ejemplo, aes(x = Renta, y = Gastos, color = Pobreza)) +
  geom_point(size = 3) +
  geom_abline(slope = pendiente, intercept = intercepto, 
              color = "black", size = 1.2) +
  theme_minimal(base_size = 14) +
  labs(
    title = "Hiperplano C-SVM",
    x = "Renta (escalada)",
    y = "Gastos (escalados)",
    color = "Grupo"
  ) +
  theme(plot.title = element_text(hjust = 0.5))
