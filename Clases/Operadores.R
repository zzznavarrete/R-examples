#OPERADORES

#Buscando los autos del dataset mcars que tengan MENOS de 6 cilindros
mtcars[mtcars$cyl <=6, ]

#Buscando a los países que tengan un PIB per cápita de 15000 USD o más
orangeec[orangeec$`GDP PC`>=15000,]

#Países que menos aportan al pIB
orangeec[orangeec$`Creat Ind % GDP`<=2,]

#Penetración de internet mayor al 80% e Inversión en educación mayor o igual a 4.5 del PIB
neworange <- subset(orangeec, orangeec$`Internet penetration % population` > 10 & orangeec$`Education invest % GDP` >= 4.5 )
neworange 

#Lo mismo de arriba pero ahora solo le asignamos el valor de 1 columna
neworangeec <- subset(orangeec, orangeec$`Internet penetration % population` > 10 & orangeec$`Education invest % GDP` >= 4.5,
                      select = `Creat Ind % GDP`)
neworangeec

#Renombrando las columnas con la librerya plyr
rename(orangeec, c(Country="Pais"))


#Ejercicio
Nivel_Curso <- c("Básico", "Intermerdio", "Avanzado")
Nivel_Curso

#Primeros 6 registros
head(mtcars)
#Últimos 6 registros
tail(mtcars)

#Viendo de otra manera los datos con la libreria dplyr
glimpse(orangeec)


#Haciendo un vector
my_vector <- 1:8 #signfica que será del 1 al 8
my_matrix <- matrix(1:9, ncol=3)
my_dataFrame <- mtcars[1:4,]

my_vector; my_matrix; my_dataFrame

my_list <- list(my_vector, my_matrix, my_dataFrame)

my_list








