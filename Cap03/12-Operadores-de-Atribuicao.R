# Operadores d Atribuição

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap03")

# Para saber qual diretório estou trabalhando
getwd()


vec1 = 1:4
vec2 <- 1:4

class(vec1)
class(vec2)

typeof(vec1)
typeof(vec2)

# Os símbolos de atribuição ( =  or <- ) funcionam de maneira parecidas em quase todas as situações.
# A diferença encontra-se quando usa-se o símbolo de atribuição DENTRO de uma FUNÇÃO!

mean(x = 1:10) # O sinal = atribui o valor para x e depois DESCARTA x
x               # Ele atribui valor, utiliza a função e depois x deixa de existir.
                # Essa operação em x existe apenas em TEMPO DE EXECUÇÃO
                # Nesse caso, se chamar x, vai dá erro!

mean(x <- 1:10) # O sinal <- atribui o valor para x e depois MANTÉM x
x               # Nesse caso, pode chamar x sem problemas.
 

# Uma alternativa mais simples
x = 1:10 
mean(x)
x

# Sair
q()

lista1 <- list(a=(1:20), b=(45:77))
sapply(lista1, sum)