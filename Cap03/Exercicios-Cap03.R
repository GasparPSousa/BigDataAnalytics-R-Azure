# Lista de Exercícios - Capítulo 3

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap03")

# Para saber qual diretório estou trabalhando
getwd()


# Exercício 1 - Pesquise pela função que permite listar todos os arquivo no diretório de trabalho
list.files()

# Exercício 2 - Crie um dataframe a partir de 3 vetores: um de caracteres, um lógico e um de números
vetor1 = c("a", "b", "c", "d", "e")
vetor2 = c(T, F, T, T, F)
vetor3 = c(1, 2, 3, 4, 5)

dt_new = data.frame(vetor1, vetor2, vetor3)
dt_new


# Exercício 3 - Considere o vetor abaixo. 
# Crie um loop que verifique se há números maiores que 10 e imprima o número e uma mensagem no console.

# Criando um Vetor
vec1 <- c(12, 3, 4, 19, 34)
vec1

i = 1
while(i <= length(vec1)) {
  if(vec1[i] > 10) {
    print(vec1[i])
    print("Este número é maior que 10")
    i = i + 1
  } else  {
    print(vec1[i])
    print("Este número é menor que 10")
    i = i + 1
    } 
}

# Exercício 4 - Conisdere a lista abaixo. Crie um loop que imprima no console cada elemento da lista
lst2 <- list(2, 3, 5, 7, 11, 13)
lst2

for (i in 1:length(lst2))
  print(lst2[[i]])

# Exercício 5 - Considere as duas matrizes abaixo. 
# Faça uma multiplicação element-wise e multiplicação normal entre as materizes
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1
mat2 <- t(mat1)
mat2

# Multiplicação element-wise
mat3 <- mat1 * mat2
mat3

# Multiplicação de matrizes
mat4 <- mat1 %*% mat2
mat4


# Exercício 6 - Crie um vetor, matriz, lista e dataframe e faça a nomeação de cada um dos objetos

vec1 <- c(12, 3, 4, 19, 34)
vec1
names(vec1) <- c("Col1", "Col2", "Col3", "Col4", "Col5")
vec1


mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1
dimnames(mat1) = (list(c("Obs1", "Obs2", "Obs3", "Obs4", "Obs5"), c("Var", "Var2", "Var3", "Var4", "Var5")))
mat1


list1 <- list(2, 3, c(1, 2, 3), 4, 5)
list1
names(list1) <- c("dim1", "dim2", "dim3", "dim4", "dim5")
list1


df1 <- data.frame(c("A", "B", "C"), c(4.5, 3.5, 2.9), c(F, T, F))
colnames(df1) <- c('caracteres', 'float', 'lógico')
rownames(df1) <- c('obs1', 'obs2', 'obs3')
df1

# Exercício 7 - Considere a matriz abaixo. Atribua valores NA de forma aletória para 50 elementos da matriz
# Dica: use a função sample()
mat2 <- matrix(1:90, 10)
mat2

mat2[sample(1:50, 10)] = NA
mat2


# Exercício 8 - Para a matriz abaixo, calcule a soma por linha e por coluna
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1

rowSums(mat1)
colSums(mat1)

# Exercício 9 - Para o vetor abaixo, ordene os valores em ordem crescente
a <- c(100, 10, 10000, 1000)
a

order(a)
a[order(a)]


# # Exercício 10 - Imprima no console todos os elementos da matriz abaixo que forem maiores que 15
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1

for(i in mat1) {
  if(i > 15) {
    print(i)
  }
}


# Sair
q()
