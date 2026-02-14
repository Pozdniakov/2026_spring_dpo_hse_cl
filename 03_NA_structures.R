
# Логические векторы ------------------------------------------------------

eyes <- c("green", "blue", "blue", "brown", "green", "blue")
#length(eyes[eyes == "blue"])
sum(eyes == "blue")
#sum(eyes == "blue")/length(eyes == "blue")
mean(eyes == "blue")
all(eyes == "blue") #extended &
any(eyes == "blue") #extended |

which(eyes == "blue")
#seq_along(eyes == "blue")[eyes == "blue"]

eyes[eyes == "blue" | eyes == "green"]
#eyes[eyes == c("green", "blue")] #doesn't return what we want

eyes[eyes %in% c("green", "blue")]

respondents_city <- c("Москва", "Санкт-Петербург", "Москва",
                      "Балашиха", "Москва", "Владивосток", "Красноярск",
                      "Чебоксары", "Сочи", "Тамбов", "Тула", "Самара")
big_cities <- c("Москва", "Санкт-Петербург", "Новосибирск", "Екатеринбург")

respondents_city[!respondents_city %in% big_cities]


# Пропущенные значения ----------------------------------------------------

missed <- NA
missed == "NA"
missed == ""
missed == 0
missed == NA
NA == NA
Joe <- NA
Mary <- NA
Joe == Mary

n <- c(0, 1, 1, 2, 3, 5, 8, 13, 21, 34)
n[5] <- NA
n
mean(n)
n != NA
n == NA
is.na(n)
mean(n[!is.na(n)])
na.omit(n)
is.numeric(n)
mean(n, na.rm = TRUE)
typeof(NA)
NA_integer_
NA_real_
NA_complex_
NA_character_
typeof(n[5])
typeof(as.integer(n)[5])
typeof(as.character(n)[5])
NA
NA ^ 0
NA & FALSE

1/0
Inf > 600000000000000000000000
max(Inf, 10)
-1/0
0/0
#NA = Not Available
#NaN = Not a Number
typeof(NaN)
mean(c(NA, NA, NA, NA), na.rm = TRUE)
is.na(NA)
is.nan(NaN)
is.na(NaN)
is.nan(NA)
character(length = 10)
double(10)
double()
m <- NULL


# Matrix ------------------------------------------------------------------

matrix(1:20, nrow = 5)

A <- matrix(1:12, nrow = 4)
A[2, 3]
A[2:3, 2:3]
A[c(1, 3, 4), c(1, 3)]
A[c(TRUE, FALSE, TRUE, FALSE), c(TRUE, FALSE, TRUE)]
A[A > 10]

A[, 2:3]
A[1:2, ]
A[1:2, 1:2] <- 100
A
attributes(A)
attr(A, "dim") <- NULL
A
attr(A, "dim") <- c(2, 6)
A
t(A)
#A %*% t(A)
attr(A, "dim") <- c(2, 5)
attr(A, "dim") <- c(2, 2, 3)
A[1, 2, 2]
length(letters)
matrix(letters, nrow = 13)

matrix(rep(1:9, 9), nrow = 9)
rep(1:9, each = 9)
#rep(1:9, rep(9, 9))       

matrix(rep(1:9, 9) * rep(1:9, each = 9), nrow = 9)
outer(1:9, 1:9)
1:9 %o% 1:9
matrix(rep(1:9, each = 9), 9) * 1:9
A[1:10]
matrix(rep(1:9, each = 9) * 1:9, nrow = 9)

B <- matrix(1:9, nrow = 9)
C <- matrix(1:9, ncol = 9)
B %*% C

matrix(rep(1:9, 9), nrow = 9) * matrix(rep(1:9, 9), nrow = 9, byrow = TRUE)
A[1:10]
