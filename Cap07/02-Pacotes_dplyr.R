# Pacotes dplyr

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap07")

# Para saber qual diretório estou trabalhando
getwd()


# Lista de pacotes base carregados
search()


# Instalando os pacotes
install.packages("readr")
install.packages("dplyr")
library(readr)
library(dplyr)


# Carregando o dataset
sono_df <- read_csv("~/Cursos/DSA/FCD/Scripts/Arquivos-Cap07/sono.csv")
View(sono_df)
head(sono_df)
class(sono_df)
str(sono_df)

# Função glimpse() pode ser usada no lugar da função str()
glimpse(sono_df)

# Aplicando mutate
glimpse(mutate(sono_df, peso_libras = sono_total / 0.45359237))


# Contagem e histograma
count(sono_df, cidade)
hist(sono_df$sono_total)


# Amostragem
sample_n(sono_df, size = 10)

# select()
sleepData <- select(sono_df, nome, sono_total)
head(sleepData)
class(sleepData)
select(sono_df, nome)
select(sono_df, nome:cidade) # Pega um range das colunas de nome até país.
select(sono_df, nome:sono_total)  # Pega um range das colunas de nome até sono_total


# filter()
filter(sono_df, sono_total >= 16)
filter(sono_df, sono_total >= 16, peso >= 80)
filter(sono_df, cidade %in% c("Recife", "Curitiba"))


# arrange() - Ordenação em Ordem Crescente
sono_df %>% arrange(cidade) %>% head

sono_df %>%
  select(nome, cidade, sono_total) %>%
  arrange(cidade, sono_total) %>%
  head(10)


sono_df %>%
  select(nome, cidade, sono_total) %>%
  arrange(cidade, sono_total) %>%
  filter(sono_total >= 16)


# desc() - Ordenação em Ordem Decrescente
sono_df %>%
  select(nome, cidade, sono_total) %>%
  arrange(cidade, desc(sono_total)) %>%
  filter(sono_total >= 16)

# mutate()
head(sono_df)

sono_df %>% 
  mutate(novo_indice = sono_total / peso) %>%
  head
# Adicionando nova coluna somente em momento de execução
head(sono_df)

sono_df %>% 
  mutate(novo_indice = sono_total / peso,
         peso_libras = peso / 0.45359237) %>%
  head

# Adicionando nova coluna somente em momento de execução
# Com isso vc consegue ir manipulando os dados sem necessariamente alterar seu dataframe original.
# Depois se vc chegou a conclusão que precisa da variável, basta adicionar ao conjunto de dados. 


head(sono_df)

# summarize()

sono_df %>%
  summarise(media_sono = mean(sono_total))

sono_df %>% 
  summarise(media_sono = mean(sono_total),
            min_sono = min(sono_total),
            max_sono = max(sono_total),
            total = n())
# n() - total de ocorrências


# group_by()

sono_df %>%
  group_by(cidade) %>%
  summarise(avg_sono = mean(sono_total),
            min_sono = min(sono_total),
            max_sono = max(sono_total),
            total = n())

# Importante ficar atento a ordem...1º faz o group_by e depois faz o summarise

# Operador: %>%
head(select(sono_df, nome, sono_total))

sono_df %>%
  select(nome, sono_total) %>%
  head



sono_df %>%
  mutate(novo_indice = round(sono_total * peso)) %>%
  arrange(desc(novo_indice)) %>%
  select(cidade, novo_indice)


sono_df
# Nosso dataset continua intacto, nada mudou em nosso dataframe.
# Estou apenas olhando para os dados, manipulando, verificando aquilo que pode ser feito em termos de limpeza, transformação e etc.
View(sono_df)





# Se você quiser, pode perfeitamente gravar esses resultados em um novo dataframe.

sono_df2 <- sono_df %>%
  mutate(novo_indice = round(sono_total * peso)) %>%
  arrange(desc(novo_indice)) %>%
  select(cidade, novo_indice)

sono_df2
View(sono_df2)

# Agora teremos o resultado dessa operação em um novo dataframe, pois criei outro objeto aqui no R.




## Conselho de Boa Prática!!!

## Não altere o dataset original.
## Porque se durante o processo você cometer algum erro, 
## eventualmente alguma coisa que não era para ter sido feita e você fez e isso vai acontecer com certeza....
## Você tem como comparar o dataset resultante com o dataset original sem precisar carregar os dados novamente.
## Então uma boa prática é: Carregue os dados e qualquer manipulação, limpeza, transformação, 
## faça em um novo dataframe e mantenha sempre o original.


# Sair
q()
