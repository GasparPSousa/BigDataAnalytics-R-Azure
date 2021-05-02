# Estudo de Caso - Limpando, Transformando e Manipulando Dados de Voos

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap07")

# Para saber qual diretório estou trabalhando
getwd()


# Lista de pacotes base carregados
search()


# Instalando pacote hflights (Dados de voos de Houston)
install.packages("hflights")
library(hflights)
library(dplyr)
?hflights

# Criando um objeto tbl
?tbl_df
flights <- tbl_df(hflights)
flights2 <- tibble::as_tibble(hflights)
flights2
View(flights2)


# Resumindo os dados
str(hflights)
glimpse(hflights)

# Visualizando como dataframe
data.frame(head(flights2))

# Filtrando os dados com slice
flights2[flights2$Month == 1 & flights2$DayofMonth == 1, ]


# Aplicando filter
filter(flights2, Month == 1, DayofMonth == 1)
filter(flights2, UniqueCarrier == "AA" | UniqueCarrier == "UA")
filter(flights2, UniqueCarrier %in% c("AA", "UA"))


# Select()
select(flights2, Year:DayofMonth, contains("Taxi"), contains("Delay"))
?contains

# Organizando os dados
flights2 %>%
  select(UniqueCarrier, DepDelay) %>%
  arrange(DepDelay)

flights2 %>%
  select(UniqueCarrier, DepDelay) %>%
  arrange(desc(DepDelay))


flights2 %>%
  select(Distance, AirTime) %>%
  mutate(Speed = Distance / AirTime*60)


head(with(flights2, tapply(ArrDelay, Dest, mean, na.rm = T)))
head(aggregate(ArrDelay ~ Dest, flights2, mean))

flights2 %>%
  group_by(Month, DayofMonth) %>%
  tally(sort = T)

# Sair
q()
