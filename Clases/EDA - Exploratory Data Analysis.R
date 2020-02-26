#Visualización de datos

#Box Plot
"/*
¿Qué es?
El máximo interés del box-plot es visualizar la distribución de una variable numérica de la manera más simplificada posible.
Sólo utiliza los valores de los cuartiles, los extremos (el mínimo y el máximo) y valores raros o outliers.

  Numeros claves para el Box Plot:
  
  Máximo
    Medio {
      -Tercer cuartil
      -Mediana
      -Primer cuartil
    }
  Mínimo
  
*/"



#EDA Scatter plot mtcars
"/*
  Un diagrama de dispersión o gráfica de dispersión o gráfico de dispersión es un tipo de diagrama matemático que utiliza las coordenadas cartesianas -
  para mostrar los valores de dos variables para un conjunto de datos
*/
"
#Siempre va primero el eje Y y luego el eje X

plot(mtcars$mpg ~ mtcars$cyl, 
     xlab = 'Cilindros', ylab = 'Millas por galón', main="Relación cilindros y millas por galón")

plot(mtcars$mpg ~ mtcars$hp, 
     xlab = 'Caballos de fuerza', ylab = 'Millas por galón', main="Relación caballos de fuerza y millas por galón")



#EDA orangeec

plot(orangeec$Unemployment ~ orangeec$`Education invest % GDP`,
     xlab = "Inversión Educación (%PIB)", ylab = "Desempleo",
     main="Relación inversión en educación y desempleo")


plot(orangeec$`Education invest % GDP`~ orangeec$`Creat Ind % GDP`,
     xlab = "Inversión Educación (%PIB)", ylab = "Desempleo",
     main="Relación inversión en educación y desempleo")


plot(orangeec$`GDP PC` ~ orangeec$`Creat Ind % GDP`,
     xlab = "Aporte economia naranja al PIB", ylab = "PIB per cápita",
     main="Relación economía naranja y pib per cápita")




"/*
Un histograma es un gráfico de barras vertical que representa la distribución de frecuencias de un conjunto de datos.
*/"
qplot(mtcars$hp, 
      geom = "histogram",
      xlab = "Caballos de fuerza",
      main="Carros segn caballos de fuerza")


ggplot(mtcars, aes(x=hp)) + geom_histogram(binwidth = 30) + 
  labs(x="Caballos de fuerza", y="Cantidad de carros", 
       title="Caballos de fuerza en carros seleccionados") +
  theme(legend.position = "none") + theme(panel.background = element_blank(), panel.grid.major = element_blank(),
                                          panel.grid.minor = element_blank())



#Reto histogram orangeec

#Caballos de fuerza en carros seleccionados
ggplot() + geom_histogram(data=mtcars,
                          aes(x=hp), fill="blue", color="red",
                          binwidth = 20)+
  labs(x="Caballos de fuerza", y="Cantidad de carros",
       title="Caballos de fuerza en carros seleccionados") + 
  xlim(c(90,280))+
  theme(legend.position = "none")+
  theme(panel.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())



#PIB per cápita en paises latam"
ggplot() + geom_histogram(data=orangeec,
                          aes(x=orangeec$`GDP PC`), fill="blue", color="red",
                          binwidth = 2000)+
  labs(x="Pib per capita", y="Cantidad de paises",
       title="PIB per cápita en paises latam") +
  theme(legend.position = "none")+
  theme(panel.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())


#Contribucion economica economia naranja al PIB
ggplot() + geom_histogram(data=orangeec,
                          aes(x=orangeec$`Creat Ind % GDP`), fill="blue", color="red",
                          binwidth = 1)+
  labs(x="Aporte economía naranja al PIB(%)", y="Cantidad de paises",
       title="Contribucion economica economia naranja al PIB") +
  theme(legend.position = "none")+
  theme(panel.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())



#Contribucion economica economia naranja al PIB
ggplot() + geom_histogram(data=orangeec,
                          aes(x=orangeec$`Internet penetration % population`), fill="red", color="yellow",
                          binwidth = 5)+
  labs(x="Penetración internet (%) población", y="Cantidad de paises",
       title="Penetración de internet en países latam") +
  theme(legend.position = "none")+
  theme(panel.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())





#BOXPLOT

#Caballos de fuerza en carros mtcars"
boxplot(mtcars$hp,
        ylab="Caballos de fuerza",
        main="Caballos de fuerza en carros mtcars")

#Caballos de fuerza según cilindros en mtcars
ggplot(mtcars, aes(x=as.factor(cyl), y=hp, fill=cyl))+ geom_boxplot() +
  labs(x="Cilindros", y="Caballos de fuerza", title = "Caballos de fuerza según cilindros en mtcars")

#Millas por galón según tipo de caja
ggplot(mtcars, aes(x=am, y=mpg, fill=am))+
  geom_boxplot() + labs(x="Tipo de caja", y="Millas por galón", title = "Millas por galón según tipo de caja")

#cambiando tipo de caja de booleano a algo logico
mtcars$am <- factor(mtcars$am, levels = c(TRUE, FALSE), labels= c("Manual", "Automatico"))

head(mtcars)



#Clasificacion de paises según PIB per cápita

#Buscando el promedio 'mean'
economy <- mean(orangeec$`GDP PC`)
economy

#Agregando una nueva variable al dataset
orangeec <- orangeec %>% 
  mutate(strong_economy = ifelse(`GDP PC` < economy, "Por debajo del promedio PIB per cápita",
                                 "Sobre promedio PIB per cápita"))


#Aporte economía naranja al pib per capita por tipo de país
ggplot(orangeec, aes(x=strong_economy, y=`Creat Ind % GDP`,
                     fill=strong_economy))+
  geom_boxplot(alpha=0.4)+
  labs(x="Tipo de país", y="Aporte economia naranja al pib",
       title="Aporte economía naranja al pib per capita por tipo de país")

#Aporte economía naranja al pib per capita por tipo de país
ggplot(orangeec, aes(x=strong_economy, y=`Internet penetration % population`,
                     fill=strong_economy))+
  geom_boxplot(alpha=0.4)+
  labs(x="Tipo de país", y="Penetración de internet (%)",
       title="Penetración de internet en latam con alto y bajo pib per capita")




#Scatter plot || Gráfica de disperción

#Relación caballos de fuerza y millas por galón
ggplot(mtcars, aes(hp, mpg))+
  geom_point()+
  labs(x="Caballos de fuerza", y="Millas por galón", title = "Relación caballos de fuerza y millas por galón")


#Relación peso-potencia
ggplot(mtcars, aes(wt, hp))+
  geom_point()+
  labs(x="Peso", y="Potencia", title = "Relación peso-potencia")


#Caballos-velocidad según cilindraje y peso
ggplot(mtcars, aes(hp, qsec))+
  geom_point(aes(color=wt, size=cyl))+
    labs(x="Caballos de fuerza", y="Tiempo en 1/4 de milla", title = "Caballos-velocidad según cilindraje y peso")



#Internet y aporte economía naranja según economía y crecimiento PIB
ggplot(orangeec, aes(`Internet penetration % population`, `Creat Ind % GDP`))+
  geom_point(aes(color=factor(strong_economy), size=`GDP Growth %`))+
  labs(x="Penetración internet", y="Aporte economía naranja al PIB", 
       title = "Internet y aporte economía naranja según economía y crecimiento PIB")



#instalar package ploty
#
my_graph <- ggplot(orangeec, aes(`Internet penetration % population`, `Creat Ind % GDP`, label=row.names(orangeec) ) ) +
  geom_point()

my_graph






