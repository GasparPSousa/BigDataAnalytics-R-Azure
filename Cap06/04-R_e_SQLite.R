# Trabalhando com R e SQLite

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap06")

# Para saber qual diretório estou trabalhando
getwd()


# Lista de pacotes base carregados
search()


# Instalar SQLite
install.packages("RSQLite")
library(RSQLite)

# Remover o banco SQLite, caso exista - Não é obrigatório
# system("del exemplo.db") # --> no Windows
# system("rm exemplo.db")    # --> no Mac e Linux

# Criando driver e conexão ao banco de dados

drv = dbDriver("SQLite")   
# Criando um driver SQLite

con = dbConnect(drv, dbname = "exemplo.db")  
# Abrimos uma conexão para o banco exemplo.db...
# Como o banco não existia, automaticamente ele foi criado no diretório onde estou.

dbListTables(con)
# Listamos a tabela nessa conexão.



# Criando uma tabela e carregando com dados do dataset mtcars
dbWriteTable(con, "mtcars", mtcars, row.names = T)

# Listando uma tabela
dbListTables(con)

# Ou seja, é muito fácil e útil trabalhar com o SQLite. 
# Ao finalizar seu processo de análise, você deve ter um Dataframe.
# Pega esse Dataframe e grava em uma tabela no seu SQLite.
# Pega seu arquivinho "exemplo.db" e pode distribuir para quem quiser, pode levar para outra aplicação, pode fazer um backup.
# Isso evita que você perca os dados quando fechar o RStudio.
# Existe outras alternativas, essa é uma delas.

# O arquivinho "exemplo.db" pode ser usado em qualquer outro computador(linux, mac, windows),
# pois ele não é dependente de Sistema Operacional.
# Essa é outra vantagem em utilizar o SQLite.


dbExistsTable(con, 'mtcars')
dbExistsTable(con, 'mtcars2')
dbListFields(con, 'mtcars')


# Lendo o conteúdo da tabela
dbReadTable(con, 'mtcars')


# Criando apenas a definição(estrutura) da tabela.
dbWriteTable(con, 'mtcars2', mtcars[0, ], row.names = T)
dbListTables(con)
dbReadTable(con, 'mtcars2')


# Executando consultas no banco de dados
query = "SELECT row_names FROM mtcars"
rs = dbSendQuery(con, query)
# result set(conjunto resultado)
dados = fetch(rs, n = -1)
dados
class(dados)

?fetch

# se esse comando não for suficiente porque não tem memória no computador, execute o comando abaixo
# que provavelmente deve resolver a situação.


# Executando consultas no banco de dados
query = "SELECT row_names FROM mtcars"
rs = dbSendQuery(con, query)
while (!dbHasCompleted(rs)) {
  dados = fetch(rs, n = 1)
  print(dados$row_names)
}


# Executando consultas no banco de dados
query = 'SELECT disp, hp FROM mtcars WHERE disp > 160'
rs = dbSendQuery(con, query)
dados = fetch(rs, n = -1)
dados
class(dados)


# Executando consultas no banco de dados
query = 'SELECT row_names, avg(hp) FROM mtcars GROUP BY row_names'
rs = dbSendQuery(con, query)
dados = fetch(rs, n = -1)
dados


# Criando uma tabela a partir de um arquivo
dbWriteTable(con, 'iris', '~/Cursos/DSA/FCD/Scripts/Arquivos-Cap06/iris.csv', sep = ',', header = T)
dbListTables(con)
dbReadTable(con, 'iris')


# Encerrando a conexão
dbDisconnect(con)



# Carregando dados no banco de dados
# http://dados.gov.br/dataset/iq-indice-nacional-de-precos-ao-consumidor-amplo-15-ipca15
# Criando driver e conexão ao banco de dados

drv = dbDriver('SQLite')
# Abrindo a conexão com o SQLite

con = dbConnect(drv, dbname = 'exemplo.db')
# Abrindo a conexão com o banco exemplo.db...Nesse caso o banco já existe.

dbWriteTable(con, 'indices', '~/Cursos/DSA/FCD/Scripts/Arquivos-Cap06/indice.csv',
             sep = '|', header = T)
# Gravando o arquivo "indice.csv" na tabela "indices" da minha conexão("con")

dbRemoveTable(con, 'indices')
# Para o caso de escrever o nome da tabela errado no comando anterior.

dbWriteTable(con, 'indices', '~/Cursos/DSA/FCD/Scripts/Arquivos-Cap06/indice.csv',
             sep = '|', header = T)


dbListTables(con)
dbReadTable(con, 'indices')

df <- dbReadTable(con, 'indices')
df
str(df)
sapply(df, class)


hist(df$setembro)
df_mean <- unlist(lapply(df[, c(4, 5, 6, 7, 8)], mean))
df_mean

dbDisconnect(con)
# Fechando a conexão

# Sair
n
