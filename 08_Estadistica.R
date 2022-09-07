#Análisis Estadístico de Datos

#Matriz de Correlación
pairs(orangeec[,2:10])
pairs(orangeec)

#Correlación de datos especificos
new_data <- subset(orangeec, select=c(2,3:5, 8, 10))
pairs(new_data)

#Correlacion con Subseting de NO deseadas
pairs(orangeec[,-c(1, 4:6, 9)])

#Uso de Filter
orangeec
top_orange <- filter(orangeec, Creat.Ind...GDP > 3.0)
top_orange
pairs(top_orange[, 2:10])

#Filtrar Strings con la biblioteca stringr
mexico <- orangeec %>%
  filter(str_detect(Country, "Mexico"))
mexico

#Comparando correlacion visual con numérica
cor(orangeec[,2:10])
cor(new_data)

#Trabajando la corelación con los missing values
cor(orangeec[,2:6], use = "complete.obs")
cor(orangeec[,5:10], use = "complete.obs")

#Resumen Estadístico
summary(orangeec)

#Desviación Estándar
desviacion <- sd(orangeec$GDP.PC)
media <- mean(orangeec$GDP.PC)
#Coeficiente de Variación (S/x)*100
#Coeficiente por encima de 25% = datos muy desviados
#Coeficiente por debajo de 25% = datos normalizados
(desviacion / media) *100

#Eliminando NA's para cálculos
mean(orangeec$Creat.Ind...GDP)
mean(orangeec$Creat.Ind...GDP, na.rm = TRUE)