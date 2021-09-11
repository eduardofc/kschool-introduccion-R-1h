# Series temporales ###################################################

births <- scan("http://robjhyndman.com/tsdldata/data/nybirths.dat")
births

births <- ts(births, frequency = 12, start = c(1946, 1))
births

plot.ts(births)

# y(t) = Level + Trend + Seasonality + Noise
births.composition = decompose(births)
plot(births.composition)

hist(births.composition$random, col = 'blue', breaks = 20)

# Prediccion de series temporales
library(forecast)

hw <- HoltWinters(births)
plot(hw)

pred <- predict(hw, 24, 
                prediction.interval = TRUE, 
                level=0.95) 

plot(hw, pred)

# Modelos estadísticos ##############################################

iris
data = iris
head(data)

data %>% group_by(Species) %>%
          summarize(
            n_filas = n()
          )
dim(data)

table(data$Species)
barplot(table(data$Species))

x = data$Sepal.Length
mean(x)
median(x)
quantile(x)

y = data$Petal.Width
mean(y)
median(y)
quantile(y)

cor(x,y)

# regresion lineal
regres <- lm(y~x)
regres

plot(x,y, col = 'blue', pch=19, xlab = "X", ylab = "Y")
abline(regres, col="red", lwd=2)

summary(regres)

x1 = data$Sepal.Length
x2 = data$Sepal.Width
x3 = data$Petal.Length
  
y = data$Petal.Width
regres <- lm(y ~ x1 + x2 + x3)
summary(regres)

# Machine Learning ###################################################

library(mlbench)

data(PimaIndiansDiabetes)
data = PimaIndiansDiabetes
str(data)


library(caret)

trainIndex <- createDataPartition(data$diabetes, p=0.80, list=FALSE)
dataTrain <- data[ trainIndex,]
dataTest <- data[-trainIndex,]

dim(dataTrain)
dim(dataTest)

library(klaR)

nb.fit <- NaiveBayes(diabetes ~ ., data=dataTrain)
predictions <- predict(nb.fit, dataTest[,1:8])
confusionMatrix(predictions$class, dataTest$diabetes)




