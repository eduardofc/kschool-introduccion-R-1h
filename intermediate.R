# fuentes de datos

data = read.csv('https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/datasets/airquality.csv')
# data = read.csv(file = 'airquality.csv', sep = '\t')

# oracle o bbdd
# apirest
# datalake
# imagenes, texto, mapas, etc.

# análisis de datos
data
head(data)
dim(data)
str(data)

# tipos de datos: characteres, numericos
# dentro de los char, están los categoricos y los de texto libre
# dentro de los numéricos, están los booleans, integers, float

str(data)

data$Month = factor(data$Month)
str(data)
levels(data$Month)

# manipulacion del dataframe
library(dplyr)
data %>% filter(Month == 'ago')

# Consultas sofisticadas con dplyr
data %>% select(Month) %>% 
      group_by(Month) %>% 
      summarize(count_month = n())

data %>% select(Month, Temp) %>% 
  group_by(Month) %>% 
  summarize(
    mean_temp = mean(Temp),
    count_month = n())

# Manipulacion estadística
summary(data)


# Algunos gráficos simples
plot(data$Ozone, data$Wind)

plot(data$Ozone, data$Wind, 
     col = 'blue', 
     pch = 17, 
     xlab = 'ozone', ylab = 'wind')

plot(data$Ozone, data$Wind, 
     col = data$Month, 
     pch = 17, 
     xlab = 'ozone', ylab = 'wind')

legend("topright", 
       legend = levels(data$Month), 
       pch = 17,
       col = 1:5)

# cuadro de mando
library(ggplot2)

p1 <- ggplot(data) + geom_point(aes(Ozone, Wind))
p2 <- ggplot(data) + geom_boxplot(aes(Month, Ozone, group = Month))
p3 <- ggplot(data) + geom_smooth(aes(Ozone, Wind)) 
p4 <- ggplot(data) + geom_bar(aes(Month)) 

library(patchwork)
(p1 | p2) / (p3 | p4)

# cuadro de mando
library(GGally)

data(tips, package = "reshape")
ggpairs(
  tips[, c(1, 3, 4, 2)],
  upper = list(continuous = "density", combo = "box_no_facet"),
  lower = list(continuous = "points", combo = "dot_no_facet")
)


