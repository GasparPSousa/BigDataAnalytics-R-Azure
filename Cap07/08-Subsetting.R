# Subsetting

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap07")

# Para saber qual diretório estou trabalhando
getwd()


# Lista de pacotes base carregados
search()


# Muitas das técnicas abaixo podem ser realizadas com a aplicação das funções:
# subset(), merge(), plyr::arrange()
# Mas conhecer estas notações é fundamental para compreeder como 
# gerar subconjuntos de dados



## Vetores
x <- c("A", "E","D", "B","C")
x[] # Notação de Indexação/Slicing - Permite colocar regras para retornar subconjuntos dos dados.
x


# Índices POSTIVOS - Elementos em posições específicas
x[c(1, 3)]
x[c(1 , 1)] # repetindo mais de uma vez
x[order(x)]

# Índices NEGATIVOS - Ignora elementos em posições específicas
# Retorna tudo Menos posições específicas
x[-c(1, 3)]
x[-c(1, 4)]


# Vetor Lógico para gerar subsetting
x[c(TRUE, FALSE)] # Coloca duas informações, mas seu vetor tem 5...ele vai duplicando a ideia.
x[c(TRUE, FALSE, TRUE, FALSE)]
x[c(TRUE, FALSE, FALSE, FALSE)]

# Vetor de caracteres
x <- c("A", "B", "C", "D")
y <- setNames(x, letters[1:4])
# criar um vetor de caracteres y atribuindo nomes as colunas.
x
y

y[c("d", "c", "a")] # Consigo criar um subset usando os nomes das colunas.

y[c("a", "a", "a")]

## Matrizes
mat <- matrix(1:9, nrow = 3, byrow = F)
colnames(mat) <- c("A", "B", "C")
mat
mat[1:2, ] # slicing da primeira e segunda linha com TODAS as colunas
mat[1:2, 2:3]
mat[, 2:3] # slicing de TODAS as linhas com as colunas 2 e 3

# Quando fazemos o slicing não modificamos o dataset original. Ele continua intacto.
# Neste caso estou apenas imprimindo um subset na Tela.



# Função outer() permite que uma Matriz se comporte como vetores individuais
?outer
vals <- outer(1:5, 1:5, FUN = "paste", sep = ",")
# Concatendo dois vetores usando a função "paste" colocou uma virgula entre eles.
vals
vals[c(4, 15)]
## Dataframes
df <- data.frame(x = 1:3, y = 3:1, z = letters[1:3])
df
df$x
df$z
df[df$x == 2, ] 
# Posso filtrar essa coluna no momento que estou fazendo o slicing
# Chamo o dataframe, digo que quero apenas a coluna x  quando o elemento for igual a 2 nas Linhas. Nas colunas eu quero TODAS.

df[df$x == 3, ]

df[c(1, 2), ]
df[c("x", "z")]
df[ , c("x", "z")]
str(df["x"])
str(df[, "x"])

# Removendo colunas de dataframes
df <- data.frame(x = 1:3, y = 3:1, z = letters[1:3])
df
df$z <- NULL
df


# Operadores [], [[]] e $
a <- list(x = 1:3, y = 4:5)
a
a[1]
a[2]
a[[1]]
a[[2]]
a[[1]][[1]]
a[[1]][[3]]
a[[2]][[1]]
a[[2]][[2]]
a[["x"]]

b <- list(a = list(b = list(c = list(d = 1))))
b

b[[c("a", "b", "c", "d")]]
b[["a"]][["b"]][["c"]][["d"]]

# x$y é equivalente a x[["y", exact = FALSE]]
var <- "cyl"
mtcars$var
mtcars[[var]]

x <- list(abc = 1)
x
x$a
x[["a"]]
x[["abc"]]


# Subsetting e atribuição
x <- 1:5
x
x[c(1, 2)] <- 2:3
x

x[-1] <- 4:1
x
# Isso é subsetting
head(mtcars)
mtcars[] <- lapply(mtcars, as.integer)
# Aqui está atribuindo aos índices.

head(mtcars)


# Isso não é subsetting
mtcars <- lapply(mtcars, as.integer)
# Aqui está atribuindo ao dataset mtcars e não aos índice como acima.

head(mtcars)




# Lookup tables
x <- c("m", "f", "u", "f", "f", "m", "m")
lookup <- c(m = "Male", f = "Female", u = NA)
lookup[x] # Com os nomes das colunas
unname(lookup[x])  # Sem os nomes das colunas


# Usando operadores lógicos
x1 <- 1:10 %% 2 == 0
x1
which(x1)
x2 <- which(x1)
x2
y1 <- 1:10 %% 5 == 0
y2 <- which(y1)
y2
intersect(x2, y2)
x1 & y1
union(x2, y2)
setdiff(x2, y2)


# Sair
q()
