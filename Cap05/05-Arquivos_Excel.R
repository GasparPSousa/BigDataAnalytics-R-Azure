# Manipulação de Arquivos Excel

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap05")

# Para saber qual diretório estou trabalhando
getwd()


# Lista de pacotes base carregados
search()

# "Não caia na tentação de querer usar direto a planilha Excel no RStudio."
# Idealmente é melhor transformar a planilha Excel em arquivo .csv e depois importar o arquivo .csv para o R.



# Instalar o Java - JDK 
# https://www.oracle.com/technetwork/java/javase/downloads/index.html

# Windows
# Faça o download do JDK gratuitamente no site da Oracle
# Instale no seu computador
# Configure a variável de ambiente JAVA_HOME apontantando para o diretório de instalação do JDK
# Inclua o diretório JAVA_HOME/bin na variável de ambiente PATH

# Mac e Linux
# Faça o download do JDK gratuitamente no site da Oracle
# Instale no seu computador
# Abra um terminal e execute: sudo R CMD javareconf

# ********** Pacotes que requerem Java **********
# XLConnect
# xlsx
# rJava 

# ********** Pacotes que requerem Perl **********
# É necessário instalar o interpretador da linguagem Perl e adicionar o diretório bin da instalação do Perl
# na variável de ambiente PATH
# Download: https://www.activestate.com/products/activeperl/
# gdata

# Instalando os pacotes
install.packages('rJava')
install.packages("xlsx")
install.packages("XLConnect")
install.packages("readxl")
install.packages("gdata")

# Este pacote deve estar carregado para poder usar todos os pacotes que requerem Java
library(rJava)

# Obs: Ao carregar todos os pacotes que manipulam excel, pode gerar problema de namespace, pois alguns pacotes
# possuem o mesmo nome de funções (que são diferentes entre os pacotes). Para evitar problemas, carregue e use
# os pacotes de forma individual (não carregue todos os pacotes de uma única vez).

# Pacote readxl
library(readxl)

# Lista as worksheet no arquivo Excel
excel_sheets("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap05/UrbanPop.xlsx")


# Lendo a planilha do Excel
read_excel("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap05/UrbanPop.xlsx")
head(read_excel("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap05/UrbanPop.xlsx"))
read_excel("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap05/UrbanPop.xlsx", sheet = "Period2")
read_excel("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap05/UrbanPop.xlsx", sheet = 3)
read_excel("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap05/UrbanPop.xlsx", sheet = 4) # Vai gerar erro, pois só tem 3 planilhas.


# Importando uma worksheet para um dataframe
df <- read_excel("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap05/UrbanPop.xlsx", sheet = 3)
head(df)

# Importando todas as worksheets
df_todas <- lapply(excel_sheets("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap05/UrbanPop.xlsx"), read_excel, path = "~/Cursos/DSA/FCD/Scripts/Arquivos-Cap05/UrbanPop.xlsx")
df_todas
class(df_todas)


# Pacote XLConnect
detach(package:readxl)
library(XLConnect)

# Namespace
arq1 = XLConnect::loadWorkbook("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap05/UrbanPop.xlsx")
df1 = readWorksheet(arq1, sheet = "Period1", header = T)
df1
class(df1)


# Pacote xlsx

detach(package:XLConnect)
library(xlsx)
?xlsx

?read.xlsx
df2 <- read.xlsx("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap05/UrbanPop.xlsx", sheetIndex = 1)
# Instalei e carreguei o pacote xlsx normalmente, mas agora na execução deu bug 

# Error in .jnew("org/apache/poi/ss/usermodel/WorkbookFactory") : 
# java.lang.InstantiationException: org.apache.poi.ss.usermodel.WorkbookFactory

df2

# Pacote gdata
detach(package:xlsx)
library(gdata)

arq2 <- xls2csv("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap05/planilha1.xlsx", 
                sheet = 1,
                na.strings = "EMPTY")

# Instalei e carreguei o pacote gdata normalmente, mas agora na execução deu bug 

# Unable to open file '~/Cursos/DSA/FCD/Scripts/Arquivos-Cap05/planilha1.xlsx'.
# Error in xls2sep(xls = xls, sheet = sheet, verbose = verbose, blank.lines.skip = blank.lines.skip,  : 
# Intermediate file '/tmp/RtmpCKhuzj/fileaa0489d6763.csv' missing!
# Além disso: Warning message:
# In system(cmd, intern = !verbose) :
#  execução do comando ''/usr/bin/perl' '/home/gaspar/R/x86_64-pc-linux-gnu-library/4.0/gdata/perl/xls2csv.pl'  
# '~/Cursos/DSA/FCD/Scripts/Arquivos-Cap05/planilha1.xlsx' '/tmp/RtmpCKhuzj/fileaa0489d6763.csv' '1'' teve status 2

arq2
read.csv(arq2)


# Dos 5 pacotes instalados e carregados normalmente, 
# 3(rJava, XLConnection e readxl) funcionaram perfeitamente na hora da execução,
# mas 2(xlsx e gdata) deram bug na hora da execução.


# Sair
q()
