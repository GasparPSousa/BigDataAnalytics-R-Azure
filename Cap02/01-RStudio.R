# Primeiros Passos na Linguagem R

# 

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaços no nome

setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap02")

# Para saber qual o diretório estou trabalhando:
getwd()

# Nome dos Contribuitors
contributors()

# Licença
license()

# Informações sobre a sessão
sessionInfo()

# Imprimir uma mensagem na tela
print('Estou iniciando minha carreira em de Cientista de Dados')

# Criar gráficos
plot(1:25)

# Instalar pacotes
install.packages('randomForest')
install.packages('ggplot2')
install.packages('dplyr')
install.packages("devtools")

# Carregar o pacote 
library(ggplot2)

# Descarregar o pacote
detach(package:ggplot2)

# Se não souber o que faz determinada função
help(mean)
?mean

# Para buscar mais opções sobre uma função, use os pacotes SOS
install.packages('sos')
library(sos)
findFn("fread")

# Se não souber o nome da função
help.search('randomForest')
help.search('matplot')
??matplot

# Abrir uma página web para fazer buscar na documentação R de tudo que está disponível
RSiteSearch('matplot')

# Função example mostra com utilizar determinado pacote ou função
example('matplot')

# Sair
q()




