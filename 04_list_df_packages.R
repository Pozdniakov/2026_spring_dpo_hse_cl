
# list --------------------------------------------------------------------


simple_list <- list(42, "hey", TRUE)
simple_list
class(simple_list)
#`[`(letters, 4)
complex_list <- list(letters, 
     1:10, 
     simple_list, 
     matrix(1:4, 2), 
     sqrt,
     `[`)
complex_list
str(complex_list)

named_list <- list(name = "Николай", age = 30, student = TRUE)
named_list
named_list$name
named_list[1]

typeof(named_list$name)
class(named_list$name)
class(named_list[1])
class(named_list[[1]])
named_list["name"]
named_list[["name"]]
is.vector(1:10)
is.vector(named_list)
is.atomic(1:10)
is.atomic(named_list)
is.recursive(1:10)
is.recursive(named_list)


# data.frame --------------------------------------------------------------

str(list(name = c("Anton", "Anya", "Artem", "Ivan", "Svetlana"),
     age = c(10, 45, 35, 16, 22),
     student = c(FALSE, FALSE, TRUE, FALSE, TRUE)))

str(data.frame(name = c("Anton", "Anya", "Artem", "Ivan", "Svetlana"),
         age = c(10, 45, 35, 16, 22),
         student = c(FALSE, FALSE, TRUE, FALSE, TRUE)))

df <- data.frame(name = c("Anton", "Anya", "Artem", "Ivan", "Svetlana"),
           age = c(10, 45, 35, 16, 22),
           student = c(FALSE, FALSE, TRUE, FALSE, TRUE))

df[1:3, 1:2]
#t(df)
df$name
df[1:2, 2:3]
df
df[df$age >= 18, "name"]
df[df$age >= 18, ]
df[df$age > mean(df$age), ]
df[!df$student, ]
df[, c("student", "name")]
df$lovesR <- TRUE
df
df$lovesR <- NULL
df
df[df$age >= 18, "name"]
df[df$age >= 18, 1]
df$name[df$age >= 18]

a <- 1:10
data(mtcars)
mtcars[,c("hp", "mpg", "cyl")]
#mtcars[11]

# Работа с пакетами -------------------------------------------------------



install.packages("beepr")
library("beepr")
library(beepr)
beep(9)
?mean
?median
beep()
beepr::beep()
# psych::alpha()
# ggplot2::alpha()

install.packages("devtools")

# Если из России не устанавливается пакет, то попробуйте:
# chooseCRANmirror()
# Выбираем сначала 73 (и жмем enter)
# Потом 9 (сервер в Новосибирске)
# Если не помогло, то попробуйте китайский севрер:
# chooseCRANmirror()
# Выбираем 17 (и жмем enter)
# После этого запускаем install.packages("название пакета") заново


devtools::install_github("brooke-watson/BRRR")
BRRR::skrrrahh(9)

install.packages("remotes")
remotes::install_github("brooke-watson/BRRR")

install.packages("tidyverse")