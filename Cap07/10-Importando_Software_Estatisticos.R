# Importando Dados de Softwares Estatísticos (SAS, STATA, SPSS) 


# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap07")

# Para saber qual diretório estou trabalhando
getwd()


# Lista de pacotes base carregados
search()


# Instalando o pacote
install.packages("haven")
library(haven)


# SAS
vendas <- read_sas("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap07/vendas.sas")
?read_sas
class(vendas)
print(vendas)
str(vendas)


# Stata
df_stata <- read_dta("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap07/mov.dta")
class(df_stata)
str(df_stata)
head(df_stata)


# Pacote Foreign

install.packages("foreign")
library(foreign)

# Stata
florida <- read.dta("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap07/florida.dta")
tail(florida)
class(florida)


# SPSS
# http://cw.routledge.com/textbooks/9780415372985/resources/datasets.asp

dados <- read.spss("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap07/international.sav")
class(dados)
head(dados)
df <- data.frame(dados)
df
head(df)


# Criando um boxplot
boxplot(df$gdp)


# Se você estiver familiarizado com estatística, você vai ter ouvido falar de Correlação. 
# É uma medida para avaliar a dependência linear entre duas variáveis. 
# Ela pode variar entre -1 e 1; 
# Se próximo de 1, significa que há uma forte associação positiva entre as variáveis. 
# Se próximo de -1, existe uma forte associação negativa: 
# Quando a correlação entre duas variáveis é 0, essas variáveis são possivelmente independentes: 
# Ou seja, não há nenhuma associação entre X e Y.

# Coeficiente de Correlação. Indica uma associação negativa entre GDP e alfabetização feminina
cor(df$gdp, df$f_illit)


# **** Importante ****
# Correlação não implica causalidade
# A correlação, isto é, a ligação entre dois eventos, não implica 
# necessariamente uma relação de causalidade, ou seja, que um dos 
# eventos tenha causado a ocorrência do outro. A correlação pode 
# no entanto indicar possíveis causas ou áreas para um estudo mais 
# aprofundado, ou por outras palavras, a correlação pode ser uma 
# pista.


# Sair
q()

