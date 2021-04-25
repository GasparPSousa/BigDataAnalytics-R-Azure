# Trabalhando com Arquivos TXT.

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap05")

# Para saber qual diretório estou trabalhando
getwd()


# Lista de pacotes base carregados
search()

# Usando as funções base do R (pacote utils)
search()

## Essas funções do Pacote Utils, podemos usar tanto para arquivos .txt, quanto para arquivos .csv 



# Importando arquivo com read.table()
?read.table

df1 <- read.table("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap05/pedidos.txt")
df1
dim(df1)
## Nesse comando geramos 6 linhas e apenas uma coluna. 
## Precisamos informar que o arquivo tem cabeçalho(header).
## Também precisamos informar o separador para criar a tabela com várias colunas.



df1 <- read.table("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap05/pedidos.txt", header = T, sep = ',')
df1
dim(df1)

## Agora sim, temos um dataframe com 5 linhas e 3 colunas e podemos trabalhar.




# Modificando os nomes das colunas
df1 <- read.table("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap05/pedidos.txt", header = T, sep = ',',
                  col.names = c('Var1', 'Var2', 'Var3'))
df1


# Caso queira apagar algum valor na hora da importação para fazer um filtro inicial.
df1 <- read.table("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap05/pedidos.txt", header = T, sep = ',',
                  col.names = c('Var1', 'Var2', 'Var3'),
                  na.strings = c('Zico', 'Maradona'))
df1

str(df1)



# Importando arquivo com read.csv()
df2 <- read.csv("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap05/pedidos.txt")
df2
dim(df2)

## Diferente do read.table(), o read.csv() automaticamente já colocou as colunas de maneira correta.


df3 <- read.csv2("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap05/pedidos.txt")
df3
dim(df3)

## Já o read.csv2() necessita que seja especificado o separador.

df3 <- read.csv2("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap05/pedidos.txt", sep = ',')
df3
dim(df3)



# Importando arquivo com read.delim()
df4 <- read.delim("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap05/pedidos.txt")
df4
dim(df4)

# O read.delim() também necessita que seja espefificado o separador.
df4 <- read.delim("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap05/pedidos.txt", sep = ',')
df4
dim(df4)


# Importando / Exportando

#Gerando arquivo (depois de ter explorado e arrumado os dados)
write.table(mtcars, file = 'mtcars.txt')
dir()

df_mtcars <- read.table('mtcars.txt')
df_mtcars
dim(df_mtcars)


write.table(mtcars, file = "mtcars2.txt", sep = "|", col.names = NA, qmethod = "double")
list.files()

read.table("mtcars2.txt")
df_mtcars2 <- read.table("mtcars2.txt")
df_mtcars2

df_mtcars2 <- read.table("mtcars2.txt", sep = '|')
df_mtcars2

df_mtcars2 <- read.table("mtcars2.txt", sep = '|', encoding = 'UTF-8')
df_mtcars2


# Sair
q()
