# Split-Apply-Combine - plyr

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap07")

# Para saber qual diretório estou trabalhando
getwd()


# Lista de pacotes base carregados
search()

# Instalando os pacotes
install.packages("plyr")
install.packages("gapminder")
# https://www.gapminder.org

library(plyr)
library(gapminder)
?gapminder

# Split-Apply-Combine
?ddply
df <- ddply(gapminder, ~ continent,
            summarise,
            max_le = max(lifeExp))
str(df)
head(df)
View(df)
levels(df$continent)


# Split-Apply-Combine
ddply(gapminder, ~ continent,
      summarise,
      n_unique_countries = length(unique(country)))


ddply(gapminder, ~ continent,
      function(x) c(n_unique_countries = length(unique(x$country))))

ddply(gapminder, ~ continent,
      summarise,
      min = min(lifeExp),
      max = max(lifeExp),
      median = median(gdpPercap))




# Usando um dataset do ggplot
library(ggplot2)
data(mpg)
str(mpg)
?mpg
View(mpg)

# Trabalhando com um subset do dataset
data <- mpg[, c(1,7:9)]
str(data)
View(data)


# Sumarizando e Agregando Dados

ddply(data, .(manufacturer),
      summarise,
      avgcty = mean(cty))


# Várias funções em uma única chamada
ddply(data, .(manufacturer),
      summarise,
      avgcty = mean(cty),
      sdccty = sd(cty),
      maxhwy = max(hwy))



# Sumarizando os dados pela combinação de variáveis/fatores
ddply(data, .(manufacturer, drv),
      summarise,
      avgcty = mean(cty),
      sdccty = sd(cty),
      maxhwy = max(hwy))


# Sair
q()
