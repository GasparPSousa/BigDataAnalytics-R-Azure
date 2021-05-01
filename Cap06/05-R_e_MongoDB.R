# Trabalhando com R e MongoDB

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap06")

# Para saber qual diretório estou trabalhando
getwd()


# Lista de pacotes base carregados
search()


# RMongoDB
# Instalação do Pacote
install.packages("devtools")
library("devtools")
install_github("mongosoup/rmongodb", force = TRUE)
library(rmongodb)


# Criando a conexão (O MongoDB tem que está inicializado...)
help("mongo.create")
mongo <- mongo.create()
mongo

# Checando a conexão
mongo.is.connected(mongo)

if (mongo.is.connected(mongo) == TRUE) {
  mongo.get.databases(mongo)
}


# Armazenando o nome de uma das coleções
coll <- "users.contatos"


# Contando os registros em uma coleção
help("mongo.count")
mongo.count(mongo, coll)


# Buscando um registro em uma coleção
mongo.find.one(mongo, coll)
mongo.find.one(mongo, coll)

# Obtendo um vetor de valores distintos das chaves de uma coleção
res <- mongo.distinct(mongo, coll, 'city')
head(res)

# Obtendo um vetor de valores distintos das chaves de uma coleção
# E gerando um histograma
pop <- mongo.distinct(mongo, coll, 'pop')
hist(pop)


# Contando os elementos
nr <- mongo.count(mongo, coll, list('pop' = list('$lte' = 2)))
print(nr)

# Buscando todos os elementos
pops <- mongo.find.all(mongo, coll, list('pop' = list('$lte' = 2)))
head(pops, 2)

# Encerrando a conexão
mongo.destroy(mongo)

# Criando e validando um arquivo json
library(jsonlite)
json_arquivo <- '{"pop":{"$lte":2}, "pop":{"$gte":1}}'
cat(prettify(json_arquivo))

validate(json_arquivo)


# Sair
q()
