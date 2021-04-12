# Operadores Básicos, Relacionais e Lógico em R.


# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaços no nome

setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap02")

# Para saber qual o diretório estou trabalhando:
getwd()


# Criando Variáveis
var1 = 100
var1

mode(var1)
help(mode)

sqrt(var1)




# Podemos atribuir o valor de uma variável a outra variável
var2 = var1
var2

mode(var2)
typeof(var2)
help(typeof)



# Uma variável pode ser uma lista de elementos
var3 = c("primeiro", "segundo", "terceiro")
var3
mode(var3)
typeof(var3)

# Uma variável pode ser uma função
var4 = function(x) {x + 3}
var4
mode(var4)
typeof(var4)



# Podemos também mudar o modo do dado. 
var5 = as.character(var1)
var5
mode(var5)
typeof(var5)




# Atribuindo valores a objetos(R é uma linguagem orientada a objeto, logo cada objeto tem atributos e métodos)
x <- c(1, 2, 3)
x
mode(x)
typeof(x)

x1 = c(1, 2, 3)
x1
mode(x1)
typeof(x1)

c(1, 2, 3) -> y
y

assign("x", c(6.3, 4, -2))
x



# Verificando o valor em uma posição específica
## Diferentemente de outras linguagens, R começa com índice 1 e não em 0.
x[1] 



# Verificar objetos
ls()
objects()



# Remover objetos
rm(x)
x



# Sair
q()