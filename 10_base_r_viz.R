library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/2026_spring_dpo_hse_cl/refs/heads/main/data/heroes_information.csv",
                   na = c("-99", "-", "", "NA"))
weight <- heroes %>%
  drop_na(Weight) %>%
  pull(Weight)


# Меры рассеяния ----------------------------------------------------------

diff(range(weight))
weight %>%
  range() %>%
  diff()

IQR(weight)

median(abs(weight - median(weight))) * 1.4826
mad(weight)
?mad
options(scipen = 999)
sum((weight - mean(weight))^2)/(length(weight) - 1)
var(weight)

sqrt(sum((weight - mean(weight))^2)/(length(weight) - 1))

(sum((weight - mean(weight))^2)/(length(weight) - 1)) %>%
  sqrt()
sd(weight)

(weight - mean(weight))/sd(weight)

iris %>%
  select(!Species) %>%
  scale()

weight %>% scale()

z <- function(x) (x - mean(x))/sd(x)
z(weight)
z(1:10)
iris %>%
  mutate(across(where(is.numeric), z))


# Ассиметрия и эксцесс ----------------------------------------------------

install.packages("psych")
psych::skew(weight)

psych::kurtosi(weight)


# А теперь все вместе! ----------------------------------------------------

summary(weight)

summary(heroes)
summary.data.frame
methods(summary)
class(heroes)

psych::describe(weight)

heroes %>%
  group_by(Gender, Alignment) %>%
  summarise(psych::describe(Weight))

install.packages("skimr")

skimr::skim(weight)

heroes %>%
  skimr::skim()

heroes %>%
  group_by(Gender) %>%
  skimr::skim(where(is.numeric))

xxx
psych::describe(xxx)
IQR(xxx$x)
IQR(xxx$y)
cor(xxx$x, xxx$y)
plot(xxx)


# Визуализация данных в base R --------------------------------------------

plot(heroes$Height, heroes$Weight)

plot(heroes$Height)

iris %>%
  select(!Species) %>%
  plot(col = iris$Species)

hist(weight, breaks = 100)

boxplot(weight)
boxplot(Weight ~ Alignment, data = heroes)
boxplot(heroes$Weight ~ heroes$Alignment)


