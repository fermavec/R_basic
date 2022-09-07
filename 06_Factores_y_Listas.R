#Creando un Factor
nivel_curso <- c("Básico", "Intermedio", "Avanzado")
nivel_curso


#Vistazo al Dataset
head(orangeec)
tail(orangeec)
#Instalando la libreria dplyr podemos usar la siguiente función
glimpse(orangeec)


#Listas
vector_a <- 1:8
matriz_a <- matrix(1:9, ncol = 3)
df_a <- orangeec[1:4, ]

vector_a
matriz_a
df_a

mi_lista <- list(vector_a, matriz_a,df_a)
mi_lista