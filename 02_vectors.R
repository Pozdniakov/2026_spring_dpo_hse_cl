
# Coercion ----------------------------------------------------------------


c(FALSE, 2)
2 + TRUE
c(TRUE, 2, "три")
c(c(TRUE, 2), "три")

as.character(as.integer(c(TRUE, FALSE, FALSE)))
as.double(c("0.5", "2.5", "три"))


# Vectorization -----------------------------------------------------------


n <- 1:4
m <- c(40, 30, 20, 10)
n + m
n * m
m - n
n / m
m ^ n
m ^ n - m * n 
m > n
sqrt(m)
log(x = m, base = n)

n <- 1:4
m <- c(40, 30, 20, 10)
k <- c(10, 100)
n + k
t <- c(2, 4, 6)
n + t

n * 10

sum(1 / (1:10))

1:10 * 2:11

# Indexing ----------------------------------------------------------------


n <- c(0, 1, 1, 2, 3, 5, 8, 13, 21, 34)

n[1]
n[10]
n[length(n)]
tail(n)
tail(n, 1)
head(n)
head(n, 2)

n[3] <- 20
n
n[4:7]
n[c(1, 4, 10)]
indeces <- c(1, 4, 10)
n[indeces]
n[c(2, 4, 6, 8)]
n[4:6] <- 0
n
n[c(10, 1, 3)]
n[length(n):1]
rev(n)
n

n[-1]
n[c(-4, -5)]

n[c(TRUE, FALSE, TRUE, FALSE, TRUE,
    FALSE, TRUE, FALSE, TRUE, FALSE)]
n[c(TRUE, FALSE)]

n
n > 10
n[n > 10]

mean(n)
n > mean(n)
n[n > mean(n)]

my_named_vector <- c(first = 1, second = 2, third = 3)
attributes(my_named_vector)

names(my_named_vector)

pi
letters[1:3]
LETTERS
month.name
month.abb

names(my_named_vector) <- letters[1:3]
my_named_vector
my_named_vector["b"]
my_named_vector["c"]
my_named_vector[c("c", "a", "b")]

n[n >= 18 & n <= 30]


# 2 4 6 8 10 12 14 16 18 20 -----------------------------------------------
#1
seq(2, 20, by = 2)
#2
1:10 * 2
#3
b <- 1:20
b[c(FALSE, TRUE)]
#4
c(2, 4, 6, 8, 10, 12, 14, 16, 18, 20)
#5
v <- 1:20
v[seq(2, length(v), by = 2)]
#6
1:10 + 1:10
#7
(1:20)[1:20 %% 2 == 0]
#8
v1 <- 1:20
v1[v1 * c(0, 1) != 0]
#9
(1:20)[1:20 * c(0, 1) != 0]
#10
sqrt(c(4,16,36,64,100,144,196,256,324,400))
#11
match(c('b','d','f','h','j','l','n','p','r','t'), letters)
