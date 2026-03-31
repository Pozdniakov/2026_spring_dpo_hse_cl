hist(rlnorm(100000), breaks = 100)
many_means <- replicate(1000000, mean(rlnorm(100)))
hist(many_means)
sd(many_means)
set.seed(42)
samp <- rnorm(100, mean = 100, sd = 15)
z_emp <- (mean(samp) - 100)/(15/sqrt(length(samp)))
z_emp
options(scipen = 999)
(1 - pnorm(z_emp)) * 2

t_emp <- (mean(samp) - 100)/(sd(samp)/sqrt(length(samp)))
t_emp
(1 - pt(t_emp, df = length(samp) - 1)) * 2
t.test(samp, mu = 100)

library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/2026_spring_dpo_hse_cl/refs/heads/main/data/heroes_information.csv",
                   na = c("-99", "-", "", "NA"))

t.test(heroes$Weight, mu = 100)
t.test(heroes$Height, mu = 185)


diet <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/stcp-Rdataset-Diet.csv")
diet1 <- diet %>%
  filter(Diet == 1)

t.test(diet1$pre.weight - diet1$weight6weeks, mu = 0)
t.test(diet1$pre.weight, diet1$weight6weeks, paired = TRUE)

diet2 <- diet %>%
  filter(Diet == 2)
t.test(diet2$pre.weight, diet2$weight6weeks, paired = TRUE)

diet3 <- diet %>%
  filter(Diet == 3)
t.test(diet3$pre.weight, diet3$weight6weeks, paired = TRUE)

diet %>%
  count(Diet)

diet12 <- diet %>%
  filter(Diet %in% 1:2)

t.test(diet12$weight6weeks ~ diet12$Diet)
t.test(weight6weeks ~ Diet, data = diet12)
diet1_weight_after <- diet12 %>%
  filter(Diet == 1) %>%
  pull(weight6weeks)

diet2_weight_after <- diet12 %>%
  filter(Diet == 2) %>%
  pull(weight6weeks)
t.test(diet1_weight_after, diet2_weight_after, paired = FALSE)

diet %>%
  group_by(Diet) %>%
  summarise(mean(weight6weeks), sd(weight6weeks))

t.test(weight6weeks ~ Diet, data = diet12, var.equal = TRUE)
