# Expressões Regulares

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap03")

# Para saber qual diretório estou trabalhando
getwd()

# Funcções que podemos usar com Expressões Regulares

# grep(pattern, x, ignore.case = FALSE, perl = FALSE, value = FALSE, fixed = FALSE, useBytes = FALSE, invert = FALSE)
# grepl(pattern, x, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
# sub(pattern, replacement, x, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
# gsub(pattern, replacement, x, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
# regexpr(pattern, text, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
# gregexpr(pattern, text, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)

str <- c("Expressões", "regulares", "em linguagem R", 
         "permitem a busca de padrões", "e exploração de textos",
         "podemos buscar padrões em dígitos",
         "como por exemplo",
         "10992451280")

length(str)
str

# grep()
?grep # Buscar um padrão dentro de um texto
grep("ex", str, value = F) # value = F indica a posição
grep("ex", str, value = T) # value = T indica o conteúdo de fato
grep("\\d", str, value = F)
grep("\\d", str, value = T)


# grepl()
?grepl # Mesma coisa que o grep, no entando o grepl retorna False ou True.
grepl("\\d+", str)
grepl("\\D", str)


# gsub
?gsub # Para substituir um padrão por outro.
gsub("em", "***", str)
gsub("ex", "EX", str, ignore.case = T)


# sub() # Uma variação da gsub
sub("em", "EM", str)


# regexpr()
frase <- "Isso é uma string."
regexpr(pattern = "u", frase) # Retorna a posição


# gregexpr()  # Variação da regexpr
gregexpr(pattern = "u", frase)



str2 <- c("2678 é maior que 45 - @???!§$",
          "Vamos escrever 14 scripts R")

str2

# gsub()
gsub("\\d", "", str2)
gsub("\\D", "", str2)
gsub("\\s", "", str2)
gsub("[iot]", "Q", str2)
gsub("[[:punct:]]", "", str2)


# Sair
q()