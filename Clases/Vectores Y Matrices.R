#¡ATENCIÓN! Se recomienda hacer el curso de algebra lineal

#Vectores numéricos
tiempo_platzi <- c (25,5, 10, 15,10)
tiempo_lecturas <- c(30,10,5,10,15)
#Suma de vectores
tiempo_aprendizaje <- tiempo_platzi + tiempo_lecturas
tiempo_aprendizaje

#Vector con carácteres, la c es por 'Contenedor'
dias_aprendizaje <- c("Lunes", "Martes", "Miércoles", "Jueves", "Viernes")
dias_aprendizaje

#Vector booleano
dias_mas_20min <- c(TRUE, FALSE, FALSE, TRUE, TRUE)
dias_mas_20min

#Tiempo total para el estudio en platzi
total_tiempo_platzi <- sum(tiempo_platzi)
total_tiempo_platzi

total_tiempo_lecturas <- sum(tiempo_lecturas)
total_tiempo_lecturas

total_tiempo_adicional <- total_tiempo_platzi + total_tiempo_lecturas
total_tiempo_adicional


#MATRICES
tiempo_matrix <- matrix(c(tiempo_platzi, tiempo_lecturas), nrow = 2, byrow = TRUE)

dias <- c("Lunes", "Martes", "Miércoles", "Jueves", "Viernes")
tiempo <- c("tiempo platzi", "tiempo lecturas")

#Asignandole las columnas a la matriz
colnames(tiempo_matrix) <- dias
#Asignandole las filas a la matriz
rownames(tiempo_matrix) <- tiempo

#Matriz sin agrupar
tiempo_matrix
#Matriz agrupada
colSums(tiempo_matrix)

#Agregando una nueva fila a la matriz
final_matrix <- rbind(tiempo_matrix, c(10,15,30,5,0))
final_matrix


#Tiempo dedicado por dia
colSums(final_matrix)

#Agregando una columna a la matriz
# fila 1, columna 5.
final_matrix[1,5]

#RETO: Agregar una columna nueva, sábado
  #Agregando el día sábado
dias_sabado <- c(dias, "Sábado")
final_matrix <- cbind(final_matrix, c(20,10,30))
colnames(final_matrix) <- dias_sabado
  #Agregando el row --podcast--
tiempo_extendido <- c(tiempo, "tiempo podcast")
rownames(final_matrix) <- tiempo_extendido

#imprimiento la matriz
final_matrix







