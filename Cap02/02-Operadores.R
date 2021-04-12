# Operadores Básicos, Relacionais e Lógico em R.


# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaços no nome

setwd("~/Cursos/DSA/FCD/BigDataRAzure/Cap02")

# Para saber qual o diretório estou trabalhando:
getwd()

## Operadores Básicos

# Soma
8 + 8

# Subtração
8 - 3

# Multiplicação
4 * 4

# Divisão
9 / 9

# Potência
5^2
5**2

3^3
3**3

# Módulo(Resto da Divisão)
16 %% 3

## Operadores Relacionais(Fazem comparação entre 2 elementos, variáveis)
x = 7 
y = 5

# Operadores
x > 8
x < 8
x <= 8
x >= 8
x == 8
x != 8


## Operadores Lógicos

# And ( & )

x == 8 & x == 6
(x == 7) & (y == 5)
(x == 8) & (y == 5)

(x == 7) & (x == 5)
(x == 7) & (x >= 5)
(x == 8) & (x == 7)



# Or ( | )

(x == 8) | (y > 5)
(x == 8) | (y >= 5)



# Not 
x > 8
print(!x > 8)
print(!(x > 8))

# Sair
q()







