
2 + 2 * 2
40 + 2 # addition
16 ^ 0.5
16 ^ .5
sqrt(16)
log(8)
log(x = 8, base = 2)
log(8, 2)
?`+`
#`+`(4, 10)  
4 + 10
sin(pi)
options(scipen = 999)
sin(pi)
options(scipen = 7)
sin(pi)
2 ^ 100
options(scipen = 999)
2 ^ 100
sin(pi)
typeof(0.5)

a = 2
a <- 3
a <- 4
# 2 + 2 -> b

`Привет, как дела?` <-  200

rm(`Привет, как дела?`)
rm(list = ls())

a <- 2
b <- 8
log(b, a)

a == b
a != b

#5!=120

a > b
a < b
a < a
b > b
a >= b
a <= b
a >= a
b <= b
typeof(a)
d <- as.integer(a)

g <- 10L
typeof(g)

typeof(typeof(3+4i))

s <- 'hello, everyone!'
sss <- "I love R"
s
as.character(22)

paste("I", "love", "R")
paste("I", "love", "R", sep = "_<3_")
paste("I", "love", "R", sep = "")
paste0("I", "love", "R")

t1 <- TRUE
f1 <- FALSE
!t1
!f1

t1 & t1 #TRUE
t1 & f1 #FALSE
f1 & t1 #FALSE
f1 & f1 #FALSE

#xor()
t1 | t1 #TRUE
t1 | f1 #TRUE
f1 | t1 #TRUE
f1 | f1 #FALSE

age <- 30
age >= 18 & age <= 30
age < 18 | age > 30

c(4, 8, 15, 16, 23, 42)
c("Hey", "hey", "ho")
c(TRUE, FALSE)

c(3, 6)

1:10
5:-3
c(1:20, 5:-3)
# 10:10:100 #doesn't work the way we wanted

seq(10, 100, by = 10)
seq(1, 13, length.out = 7)
seq_len(33)
lost <- c(4, 8, 15, 16, 23, 42)
seq_along(lost)
seq_len(length(lost))

rep(1, 5)
rep(1:3, 3)
rep(1:3, each = 3)

rep(1:3, c(10, 2, 30))

rep(c("hey", "hey", "ha"), 20)

sum(1:10)
mean(1:10)
