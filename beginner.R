# Calculadora en la consola de comandos
3+3
6/6

# Concepto de variable en la consola de comandos
# -> es un contenedor de información en la memoria del ordenador
variable1 = 3
variable1

msg = 'hola mundo' # las cadenas de caracteres van entre comillas
msg

# Matrices
matrix(c(1,1,1,1), nrow = 2)
A = matrix(c(1,1,1,1), nrow = 2)
B = matrix(c(3,5,8,7), nrow = 2)
A*B

# Script
A = matrix(c(1,1,1,1), nrow = 2)
B = matrix(c(3,5,8,7), nrow = 2)
print('El producto de A por B es: ')
print(A*B)

# Algoritmo
# Un algoritmo informático es un conjunto de instrucciones definidas, 
# ordenadas y acotadas para resolver un problema o realizar una tarea.

# Ej. Resolución de la división (elemento a elemento) de dos vectores
vect1 = c(6,6,6)
vect2 = c(2,2,2)
vect.division = vect1 / vect2
print(vect.division)

# Función
# elementos entrada (inputs) -> argumentos
# elemento de salida

vector.division <- function(v1, v2){
  vect.division = v1 / v2
  return (vect.division)
}

vector.division(vect1, vect2)
vector.division(vect2, vect1)

# Condicional
vect3 = c(9,9)
length(vect3)
vector.division(vect3, vect1)

if (length(vect1) != length(vect3)){
  print('ERROR')
} else {
  print(vector.division(vect3, vect1))
}

vector.division <- function(v1, v2){
  if (length(v1) != length(v2)){
    print('ERROR')
  } else {
    vect.division = v1 / v2
    return (vect.division)
  }
}

vector.division(vect1, vect2)
vector.division(vect1, vect3)

# R está lleno de funciones predefinidas
length(vect1)
plot(vect1, vect2)
vect4 = c(1,2,3)
vect5 = c(9,8,7.6)
plot(vect5, vect4)
plot(vect5, vect4, pch = 17) # aquí hablamos de los argumentos

# librerías
library(lattice)
xyplot(vect5 ~ vect4, grid = TRUE)
