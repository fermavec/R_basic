#Creando Vectores
tiempo_platzi <- c(90, 120, 90, 120, 0)
tiempo_henry <- c(420, 420, 420, 420, 420)

#Sumando Vectores
tiempo_total <- tiempo_platzi + tiempo_henry

tiempo_total

dias_aprendizaje <- c("Lunes", "Martes", "Miercoles", "Jueves", "Viernes")
dias_aprendizaje

categorias <- c("Tiempo Platzi", "Tiempo Henry")
categorias

#Creando Matrices con vectores definidos
matriz_tiempo <- matrix(c(tiempo_platzi, tiempo_henry), 
                   nrow = 2, byrow = TRUE)
matriz_tiempo

#Asignando nombres a filas y columnas de la matriz
colnames(matriz_tiempo) <- dias_aprendizaje
rownames(matriz_tiempo) <- categorias
matriz_tiempo

#Sumando columnas de la matriz
colSums(matriz_tiempo)

#Agregando una fila a la matriz
matriz_tiempo <- rbind(matriz_tiempo, Total = colSums(matriz_tiempo))
matriz_tiempo

#Agregando una columna a la matriz
matriz_tiempo <- cbind(matriz_tiempo, Sabado = c(60, 0))
matriz_tiempo

#Ubicar un Elemento dentro de la matriz [filas, columnas]
matriz_tiempo[2,5]

numeros <- c(1,2,3,4,5)
sum(numeros)