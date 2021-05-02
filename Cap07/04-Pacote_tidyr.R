# Remodelagem de Dados com tidyr

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap07")

# Para saber qual diretório estou trabalhando
getwd()


# Lista de pacotes base carregados
search()


# Instalando os pacotes
install.packages("tidyr")
library(tidyr)
library(ggplot2)

# Dados de notas em disciplinas
dados <- data.frame(
  Nome = c("Geografia", "Literatura", "Biologia"),
  Regiao_A = c(97, 80, 84),
  Regiao_B = c(86, 90, 91)
)

# Observe atentamente esse dataframe. Quantas variáveis tem nesse dataframe??

# Regiao_A e Regiao_B tem EXATAMENTE o mesmo tipo de informação(Nota em disciplina).
# Nesse cenário, nitidamente nós temos uma bagunça nos dados.
# A forma como a pessoa organizou lá na fonte, ela não se preocupou em colocar as informações em colunas individuais.
# Na prática, as variáveis que existem aqui são nome, região e nota. São 3 informações diferentes. 
# Se depois eu for usar um modelo preditivo, eu posso usar essas 3 variáveis.

# Só que a forma que o dataset foi construído não representa exatamente essa divisão.
# Eu tenho Regiao_A e Regiao_B, logo está DUPLICANDO a informação


# Para resolver esse problema, temos que remodelar esses dados

dados %>%
  gather(Regiao, NotaFinal, Regiao_A:Regiao_B)
# gerar duas novas colunas(Regiao e NotaFinal) a partir das colunas Regiao_A e Regiao_B.
# Agora sim temos 3 variáveis diferentes(Nome, Regiao e NotaFinal)
dados %>%
  gather(Regiao, NotaFinal, Regiao_B:Regiao_A)

?gather



# Criando dados
set.seed(10)
df2 <- data.frame(
  id = 1:4,
  acao = sample(rep(c('controle', 'tratamento'), each = 2)),
  work.T1 = runif(4),
  home.T1 = runif(4),
  work.T2 = runif(4),
  home.T2 = runif(4)
)


df2

# Olhando esse df2, fica muito claro que nós temos repetição de informação em diversas variáveis.
# Logo, precisamos remodelar esse dataset.

# Reshape 1
df2_organizado1 <- df2 %>%
  gather(key, time, -id, -acao)
# gerar duas novas colunas(key, time) usando todo o dataset MENOS as colunas id e acao.
# a funcao gather vai pegar todas as colunas(MENOS as colunas id e acao) e vai agrupar nas colunas key e time.
# Ou seja, pegou tudo que representa a variável tempo e colocou na coluna time
# e pegou tudo que representa a variável "turno" e colocou na coluna key.
# agora sim temos variáveis separadas, variável INDEPENDENTES. O que não tínhamos antes naquela dataset.
df2_organizado1 %>% head(8)

# Mas perceba que work.T1/home.T1. Nitidamente .T1 parece representar uma outra coisa.

# Reshape 2

df2_organizado2 <- df2_organizado1 %>%
  separate(key, into = c("localidade", "tempo"), sep = "\\.")
# separando a coluna key em duas colunas(localidade e tempo)

df2_organizado2 %>% head(8)

# Mais um exemplo
set.seed(1)
df3 <- data.frame(
  participante = c("p1", "p2", "p3", "p4", "p5", "p6"), 
  info = c("g1m", "g1m", "g1f", "g2m", "g2m", "g2m"),
  day1score = rnorm(n = 6, mean = 80, sd = 15), 
  day2score = rnorm(n = 6, mean = 88, sd = 8)
)

print(df3)

# Reshape dos dados
df3 %>%
  gather(day, score, c(day1score, day2score))
# gerando duas colunas(day e score) usando as colunas day1score e day2score

df3 %>%
  gather(day, score, c(day1score, day2score)) %>%
  spread(day, score)
# juntando tudo de novo.

df3 %>%
  gather(day, score, c(day1score, day2score)) %>%
  separate(col = info, into = c("group", "gender"), sep = 2)


df3 %>%
  gather(day, score, c(day1score, day2score)) %>%
  separate(col = info, into = c("group", "gender"), sep = 2) %>%
  unite(infoAgain, group, gender)

df3 %>%
  gather(day, score, c(day1score, day2score)) %>%
  separate(col = info, into = c("group", "gender"), sep = 2) %>%
  ggplot(aes(x = day, y = score)) + 
  geom_point() + 
  facet_wrap(~ group) + 
  geom_smooth(method = "lm", aes(group = 1), se = F)


# Sair
q()