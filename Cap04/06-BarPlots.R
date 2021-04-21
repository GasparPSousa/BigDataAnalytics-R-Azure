# Bar Plots

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap04")

# Para saber qual diretório estou trabalhando
getwd()

# Lista de pacotes base carregados
search()

?barplot

# Preparando os dados - número de casamentos em uma igreja de SP
dados <- matrix(c(652, 1537, 598, 242, 36, 46, 38, 21, 218, 327, 106, 67), nrow = 3, byrow = T)
dados


# Nomeando linhas e colunas na matriz
colnames(dados) <- c("0", "1-150", "151-300", "> 300")
rownames(dados) <- c("Jovem", "Adulto", "Idoso")
dados


# Construindo o Barplot
barplot(dados, beside = T)

# Construindo o plot - Stacked Bar Plot
barplot(dados)


# As 3 faixas de idade são representadas na mesma coluna para as diferentes quantidades


barplot(dados, col = c("steelblue1", "tan3", "seagreen3"))


# Crie uma legenda para o gráfico anterior
legend("topright", pch = 19, col = c("steelblue1", "tan3", "seagreen3"), legend = c("Jovem","Adulto","Idoso"))



?pch
?legend
# Agora temos uma coluna para cada faixa etária, mas na mesma faixa de quantidade

barplot(dados, beside = T, col = c("steelblue1", "tan3", "seagreen3"), 
        main = "Número de Casamentos em São Paulo")
legend("topright", pch = 19, col = c("steelblue1", "tan3", "seagreen3"), 
       legend = c("Jovem","Adulto","Idoso"))


# Com a Transposta da matriz, invertemos as posições entre faixa etária e faixa de quantidade

barplot(t(dados), beside = T, col = c("steelblue1", "tan3", "seagreen3", "peachpuff1"),
        main = "Número de Casamentos em São Paulo")
legend("topright", pch = 19, col = c("steelblue1", "tan3", "seagreen3", "peachpuff1"), 
       legend = c("0","1-150","151-300",">300"))


# Salvando o BarPlot1 em png.
png("Grafico6_BarPlot1.png", width = 900, height = 900, res = 72)

barplot(dados, col = c("steelblue1", "tan3", "seagreen3"))
legend("topright", pch = 19, col = c("steelblue1", "tan3", "seagreen3"), legend = c("Jovem","Adulto","Idoso"))

dev.off()


# Salvando o BarPlot2 em png.
png("Grafico6_BarPlot2.png", width = 900, height = 900, res = 72)

barplot(dados, beside = T, col = c("steelblue1", "tan3", "seagreen3"), 
        main = "Número de Casamentos em São Paulo")
legend("topright", pch = 19, col = c("steelblue1", "tan3", "seagreen3"), 
       legend = c("Jovem","Adulto","Idoso"))

dev.off()


# Salvando o BarPlot3 em png.

png("Grafico6_BarPlot3.png", width = 900, height = 900, res = 72)

barplot(t(dados), beside = T, col = c("steelblue1", "tan3", "seagreen3", "peachpuff1"),
        main = "Número de Casamentos em São Paulo")
legend("topright", pch = 19, col = c("steelblue1", "tan3", "seagreen3", "peachpuff1"), 
       legend = c("0","1-150","151-300",">300"))

dev.off()


# Sair
q()



