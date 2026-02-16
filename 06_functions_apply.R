
# Создание функций --------------------------------------------------------


pow <- function(x, p) {
  power <- x ^ p
  return(power)
}

pow(3, 2)

pow <- function(x, p) {
  power <- x ^ p
  power
}
pow(4, 5)

pow <- function(x, p) {
  x ^ p
}
pow(10, 3)

pow <- function(x, p) x ^ p
pow(5, 5)

pow <- function(x, p = 2) x ^ p
pow(6, 4)

80/1.7^2

w <- 87
h <- 1.83
w/h^2

imt <- function(weight, height) weight/height^2
imt(40, 1.60)

factors <- function(x) which(x %% seq_len(x) == 0)
factors(3)
factors(161)
factors(1984)

pow_strange <- function(x, p, strange = power + 1) {
  power <- x ^ p
  strange
}
pow_strange(x = 2, p = 9)
?mean

list(mean, min, `[`, `+`)


# Семейство apply() -------------------------------------------------------

A <- matrix(1:12, 3)
A
rowSums(A)
rowMeans(A)
colSums(A)
colMeans(A)

apply(A, 1, mean)
apply(A, 2, mean)

max_minus_one <- function(x) max(x) - 1
apply(A, 2, max_minus_one)

A[2, 2] <- NA
apply(A, 1, sum, na.rm = TRUE)
neo <- c("Welcome", "to", "the", "matrix", "Neo", "!")
mean(nchar(neo))

B <- matrix(neo, 2)
mean(nchar(B))
apply(B, 2, function(string) mean(nchar(string)))
apply(B, 2, \(x) mean(nchar(x)))
some_list <- list(some = 1:10, list = letters)
some_list
lapply()
length(some_list)

lapply(some_list, length)

na_n <- function(x) sum(is.na(x))
apply(iris, 2, na_n)
apply(iris, 1, na_n)
as.matrix(iris)
iris

lapply(some_list, length)
lapply(iris, class)

class(iris$Species)
as.character(iris$Species)
as.integer(iris$Species)
mean(iris$Species)

lapply(some_list, length)
sapply(some_list, length)

install.packages("purrr")
library(purrr)
map(some_list, length)
map_int(some_list, length)
map(some_list, 2)

v0 <- sapply(seq_len(10000000), log)
v1 <- log(seq_len(10000000))

factors_vectorized <- Vectorize(factors)
factors_vectorized(c(2:10))

many_means <- replicate(1000, mean(rnorm(30)))
hist(many_means)
