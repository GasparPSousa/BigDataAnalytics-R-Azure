# Matrizes, Operações com Matrizes e Matrizes Nomeadas


# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaços no nome

setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap02")

# Para saber qual o diretório estou trabalhando:
getwd()


# Criando Matrizes

# Número de Linhas

matrix(c(1, 2, 3, 4, 5, 6), nrow = 2)
matrix(c(1, 2, 3, 4, 5, 6), nrow = 3)
matrix(c(1, 2, 3, 4, 5, 6), nrow = 6)

## Em R, por padrão, as matrizes são preenchidas por colunas, de cima para baixo. 

# Número de Colunas

matrix(c(1, 2, 3, 4, 5, 6), ncol = 2)


# Help
?matrix

# Matrizes precisam ter um número de elementos que seja MÚLTIPLOS do número de linhas

matrix(c(1, 2, 3, 4, 5), ncol = 2) ## Gera erro!

matrix(c(1, 2, 3, 4, 5, 6), ncol = 2) 


# Criando matrizes a partir de vetores e preenchendo a partir das linhas

meus_dados = c(1:10)
meus_dados


matrix(meus_dados, nrow = 5, ncol = 2)

matrix(data = meus_dados, nrow = 5, ncol = 2, byrow = T)

## Em R, por padrão, as matrizes são preenchidas por colunas(btrow = FALSE), de cima para baixo. 
## Se quiser preencher as matrizes por linhas, usar byrow = TRUE

# Fatiando(Slice) a Matriz
mat <- matrix(c(2, 3, 4, 5), nrow = 2)
mat

mat[1, 2]
mat[2, 2]
mat[1, 3] 

mat[,2] # Todas as Linhas da 2º coluna
mat[1,] # Todas as colunas da 1º linha
mat[2,] # Todas as colunas da 2º linha
mat[,1] # Todas as linhas da 1º coluna


# Criando uma matriz diagonal
matriz = 1:3
diag(matriz)


# Extraindo vetor de uma matriz diagonal
vetor = diag(matriz)
diag(vetor)



# Transposta da matriz
W <- matrix(c(2, 4, 8, 12), nrow = 2, ncol = 2)
W

t(W)
U <- t(W)
U

# Obtendo uma matriz inversa
solve(W)


# Multiplicação de Matrizes
mat1 <- matrix(c(2, 3, 4, 5), nrow = 2)
mat1

mat2 <- matrix(c(6, 7, 8, 9), nrow = 2)
mat2

mat1 * mat2
mat1 / mat2
mat1 + mat2
mat1 - mat2





# Multiplicando Matriz com Vetor
x  = c(1:4)
x

y <- matrix(c(2,3,4,5), nrow = 2)
y

x * y




# Nomeando a Matriz
mat3 <- matrix(c("Terra", "Marte", "Saturno", "Netuno"), nrow = 2)
mat3

dimnames(mat3) = (list(c("Linha1", "Linha2"), c("Coluna1", "Coluna2")))
mat3




# Identificando linhas e colunas no momento de criação da Matriz
matrix(c(1,2,3,4), nrow = 2, ncol = 2, dimnames = list(c("Linha 1", "Linha 2"), c("Coluna 1", "Coluna 2")))



# Combinando Matrizes

mat4 <- matrix(c(2,3,4,5), nrow = 2)
mat4

mat5 <- matrix(c(6,7,8,9), nrow = 2)
mat5

cbind(mat4, mat5)
rbind(mat4, mat5)

## bind signica ligar...
## cbind, ligação por col
## rbind, ligação por row 


# Transformando a matriz em um vetor

c(mat4)


# Sair
q()