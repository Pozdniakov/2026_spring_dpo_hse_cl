library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/2026_spring_dpo_hse_cl/refs/heads/main/data/heroes_information.csv",
                   na = c("-99", "-", "", "NA"))

heroes_selected <- heroes %>%
  select(Height, Gender) %>%
  drop_na()
options(scipen = 999)
t.test(heroes_selected$Height ~ heroes_selected$Gender) 
dnorm(0)
dnorm(1)
dnorm(-1)
dnorm(10)
dnorm(100, mean = 100, sd = 15)

v <- seq(-3, 3, by = .1)
dnorm(v)
plot(v, dnorm(v))

vv <- 50:150
plot(vv, dnorm(vv, mean = 100, sd = 15))

pnorm(100, mean = 100, sd = 15)
pnorm(130, mean = 100, sd = 15)
1 - pnorm(130, mean = 100, sd = 15)
pnorm(85, mean = 100, sd = 15)

qnorm(0.977, mean = 100, sd = 15)

rnorm(30)
set.seed(42)
samp <- rnorm(100, mean = 100, sd = 15)
samp
hist(samp)

hist(rnorm(2500000, mean = 100, sd = 15))
mean(samp)

mean(rnorm(1000000, mean = 100, sd = 15))

sqrt(sum((samp - mean(samp))^2)/(length(samp) - 1))
sd(samp)

many_means <- replicate(1000000, mean(rnorm(100, mean = 100, sd = 15)))
many_means
hist(many_means)
mean(many_means)
sd(many_means)

se <- sd(samp)/sqrt(length(samp))

mean(samp) - se * qnorm(0.975)
mean(samp) + se * qnorm(0.975)
