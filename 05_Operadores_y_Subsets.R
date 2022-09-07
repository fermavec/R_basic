#Operadores de busqueda y comparación
orangeec

orangeec[orangeec$GDP.PC>=15000, ]
#Subsets
inflacion_subset <- subset(orangeec, Inflation > 5.0 & Unemployment >= 5.0)
inflacion_subset

#Subset desde variable en especifico
inflacion_subset <- subset(orangeec, Inflation > 5.0 & Unemployment >= 5.0,
                           select = Creat.Ind...GDP)
inflacion_subset

#Cambiando nombre de columna (Debes instalar plyr)
rename(orangeec, c("Creat.Ind...GDP" = "AporteEcNj"))