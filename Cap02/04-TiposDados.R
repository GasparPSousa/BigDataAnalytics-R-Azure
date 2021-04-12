# Tipos Básicos de Dados em R.


# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaços no nome

setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap02")

# Para saber qual o diretório estou trabalhando:
getwd()


# Numeric - Todos os números criados em R são do modo numeric

# São armazenados como números decimais (double)
num1 <- 7
num1

class(num1)
mode(num1)
typeof(num1)

# Embora 7 seja um número inteiro, por default em R, os números são armazenados como double

num2 = 16.82
num2

class(num2)
mode(num2)
typeof(num2)





# Integer - Se quiser trabalhar com tipo inteiro, tem que converter(16.82 vira 16L)
# Convertemos tipos numeric para integer
is.integer(num1)
is.integer(num2)
y = as.integer(num2)

class(y)
mode(y)
typeof(y)

as.integer('3.17') # Convertendo uma string em inteiro, aqui consegue, pois dentro da string tem um número
as.integer("Joe")  # Aqui não dá para converter, vira um NA
as.integer('Joe')  # Aqui não dá para converter, vira um NA
as.integer(TRUE)   # True vira 1 e False vira 0
as.integer(FALSE)  # TRUE e FALSO são booleanos
as.integer('TRUE') # Aqui não dá para converter, vira um NA, pois nesse caso é uma string.


# Character (uma string, um texto)
char1 = 'A'
char1

class(char1)
mode(char1)
typeof(char1)

char2 = 'Cientista'
char2

class(char2)
mode(char2)
typeof(char2)


char3 = c("Data", "Science", "Academy")
char3

class(char3)
mode(char3)
typeof(char3)


# Complex
compl = 2.5 + 4i
compl

class(compl)
mode(compl)
typeof(compl)


sqrt(-1)
sqrt(-1 + 0i)
sqrt(as.complex(-1))




# Logic
x = 1; y = 2
z = x > y
z

class(z)


u = TRUE; v = FALSE
class(u)
u & v
u | v
!u


# Operações com 0
5 / 0  # O interpretador considera inf para evitar erro.
0 / 5



# Erro
'Joe' / 5




# Sair
q()