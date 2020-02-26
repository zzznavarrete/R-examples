

#Cruce de información - Forma 1
pairs(mtcars[,2:6])


#Forma 2 - Asignando una variable
newdata <- subset(mtcars, select = c(2,7:8,11,12))
newdata
pairs(newdata )


#Forma 3 - Indicando las columnas que NO quiero ver
pairs(mtcars[, -c(1,3,4,5,6,9,10)])


#Forma 4 - Millas por galón mayor o igual a 30
eficientes <- filter(mtcars, mpg >=30)
eficientes


#
pairs(eficientes[,2:6])


#Filtrando por palabras clave
merc <- mtcars %>% filter(str_detect(model,"Merc"))
merc
#
pairs(merc[,2:6])

#Cruce de información pero en números 
cor(merc[,2:6])
cor(newdata)

#

#Protegiéndonos de los peligros del promedio.
"EJ: Si tengo 2 grupos de estudiantes de 5 alumnos cada grupo, y las calificaciones corresponden a:

Grupo 1: [6,7,8,7,6] <- Promedio: 6.8
Grupo 2: [10,10,10,2,2] <- Promedio: 6.8

Si el promedio es el mismo, ¿Son ambos grupos iguales? : NO
para evitar eso utilizamos.

**DESVIACIÓN ESTÁNDAR**
¿Qué es?
R:La desviación estándar es la medida de dispersión más común, que indica qué tan dispersos están los datos 
con respecto a la media. Mientras mayor sea la desviación estándar, mayor será la dispersión de los datos.

Desviación estándar
Grupo 1: 0.74833
Grupo 2: 3.9192


*Herramientas: COEFICIENTE DE VARIACIÓN
Formula que nos indica hasta que punto están desviados los datos del promedio
y hasta que punto el promedio NO representa todos los datos y si tomar una desición basada 
en el promedio podría ser negativo.

Formula:

*S = desviación |  X = promedio 

          (S/X) * 100 =  
          
**Resultado óptimo: Hasta 25%

"


#Desviacióne estándar de mtcars MPG
desv_est <- sd(mtcars$mpg)

#Promedio de mtcars MPG
prom <- mean(mtcars$mpg)

#formula
coeficiente_variacion <- (desv_est/prom) * 100

" El coeficiente es de 29.99 lo que pasa el óptimo de máximo 25, indicador de que 
  no existe necesariamente una correlación en el promeido ya que hay elementos muy por encima y muy por debajo del promedio.
"coeficiente_variacion




#Evaluando otro ejemplo
desv_internet <- sd(orangeec$`Internet penetration % population`)
prom_internet <- mean(orangeec$`Internet penetration % population`)

coef_var_internet <- (desv_internet/prom_internet)*100
"Se pasó un poco (25,24%) en este caso, podemos concluir que para este caso sería mejor apoyarnos tanto en los cuartiles,
 como en las medianas"
coef_var_internet




#Removiendo datos NA
prom_creative_ind <- mean(orangeec$`Creat Ind % GDP`, na.rm = TRUE)
desv_creative_ind <-sd(orangeec$`Creat Ind % GDP`, na.rm = TRUE)
coef_creative_ind <- (desv_creative_ind/prom_creative_ind)*100

#Está muy por encima del valor óptimo. Por lo tanto sería más oportuno apoyarnos en medianas y cuartiles. 
coef_creative_ind




#Ajustando datos para mejorar visualizaciones, agregando columnas según parámetros establecidos por nosotros
eficientes_prom <- mean(mtcars$mpg)
mtcars <- mtcars %>% 
  mutate(Mas_eficientes=ifelse(mpg<eficientes_prom, 
                               "Bajo promedio", "En o sobre promedio"))


mas_veloces <- mtcars[mtcars$qsec < 16,]
mtcars <- mtcars %>% mutate(velicidad_cuarto_milla = ifelse(qsec < 16, "Menos de 16 seg", "Más de 16 seg"))

mtcars <- mtcars %>% mutate(peso_kilos=(wt/2)*1000)

mtcars <- mtcars %>% mutate(categoria_peso = ifelse(peso_kilos <= 1500, "Livianos", "Pesados"))



#Economía naranja
orangeec <- orangeec %>% mutate(crecimiento_GPD = ifelse(orangeec$`GDP Growth %` >= 2.5, "2.5% o más", "Menos 2.5%"))



#Scatter plot - Ploty library

test_mas_pesados <- mtcars %>%  arrange(desc(peso_kilos))
mas_pesados <- head(test_mas_pesados)

ggplot(mas_pesados, aes(x=hp, y=mpg))+
  geom_point()+
  facet_wrap(~model)



ggplot(mtcars, aes(x=cyl, y=mpg, size = categoria_peso))+
  geom_point()
  
ggplot(orangeec, aes(x=`Education invest % GDP`, y=`Creat Ind % GDP`, size = strong_economy))+
  geom_point()



#R Markdown - Package 'rmarkdown' y 'knitr'






















