# Pacotes e Instalação de Pacotes

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap03")

# Para saber qual diretório estou trabalhando
getwd()



# De onde vem as funções? Pacotes (conjuntos de funções)
# Quando você inicia o RStudio, alguns pacotes são 
# carregados por padrão

# Busca os pacotes carregados
search()



# Instala e carrega os pacotes
install.packages(c("ggvis", "tm", "dplyr"))
install.packages("tm")
library(ggvis)
library(tm)
# Deu bug para installar e carregar o pacote tm
require(dplyr)

search()
?require
detach(package:dplyr)


# Lista o conteúdo dos pacotes
?ls
ls(pos = "package:ggvis") # Lista todas as funções que pertecem ao pacote ggvis
ls(getNamespace("ggvis"), all.names = TRUE) # Lista TUDO que pertecem ao pacote ggvis


# Lista as funções de um pacote
lsf.str("package:ggvis") # Mostra os parâmetros das funções do pacote ggvis
lsf.str("package:ggplot2")
library(ggplot2)
lsf.str("package:ggplot2") # Mostra os parâmetros das funções do pacote ggplot2



# R possui um conjunto de datasets preinstalados. 

library(MASS)
data() # Listar todos os datasets que estão disponíveis gratuitamente no R

?lynx
head(lynx)

head(iris)
tail(lynx)
summary(lynx)

plot(lynx)
hist(lynx)
head(iris)
iris$Sepal.Length
sum(iris$Sepal.Length)


?attach
attach(iris) # Se der um attach
sum(Sepal.Length) # Você pode usar o nome da coluna diretamente sem precisar mencionar o nome do dataset



# Sair
q()