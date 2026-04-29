v <- seq(-5, 5, .01)
plot(v, dnorm(v))
qnorm(0.975)

library(tidyverse)
diet <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/stcp-Rdataset-Diet.csv")
diet %>%
  group_by(Diet) %>%
  summarise(mean(weight6weeks), sd(weight6weeks))

diet12 <- diet %>%
  filter(Diet %in% 1:2)
t.test(diet12$weight6weeks ~ diet12$Diet,
       var.equal = TRUE)

set.seed(42)
samp <- rnorm(100, mean = 100, sd = 15)
shapiro.test(samp)
hist(samp)

weight1 <- diet %>%
  filter(Diet == 1) %>%
  pull(weight6weeks)

shapiro.test(weight1)
hist(weight1)
hist(rnorm(length(weight1)))

qqnorm(weight1)
qqnorm(rlnorm(length(weight1)))


# Непараметрические аналоги т-теста ---------------------------------------


diet1 <- diet %>%
  filter(Diet == 1)
options(scipen = 999)
t.test(diet1$pre.weight, diet1$weight6weeks, paired = TRUE)
wilcox.test(diet1$pre.weight, diet1$weight6weeks, paired = TRUE)

t.test(diet12$weight6weeks ~ diet12$Diet)
wilcox.test(diet12$weight6weeks ~ diet12$Diet)

a <- c(1, 3, 5, 9)
b <- c(1000, 2000, 2500, 3000)
t.test(a, b, paired = TRUE)
wilcox.test(a, b, paired = TRUE)

diet23 <- diet %>%
  filter(Diet %in% c(2, 3))

wilcox.test(diet23$weight6weeks ~ diet23$Diet)

diet2 <- diet %>%
  filter(Diet == 2)
wilcox.test(diet2$pre.weight, diet2$weight6weeks, paired = TRUE)

# Тест хи-квадрат Пирсона -------------------------------------------------

heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/2026_spring_dpo_hse_cl/refs/heads/main/data/heroes_information.csv",
                   na = c("-99", "-", "", "NA"))

gender_publisher <- heroes %>%
  filter(Publisher %in% c("Marvel Comics", "DC Comics")) %>%
  select(Gender, Publisher) %>%
  drop_na()

table(gender_publisher)

table(gender_publisher$Gender)
table(gender_publisher$Publisher)

61/(61 + 153)
111/(111 + 252)

111/(111 + 61)
252/(252 + 153)

table(gender_publisher) %>% summary()
table(gender_publisher) %>% chisq.test()
table(gender_publisher) %>% fisher.test()

table(gender_publisher) %>% 
  mosaicplot(shade = TRUE, color = TRUE)

pub_good <- heroes %>%
  filter(Alignment %in% c("good", "bad")) %>%
  select(Alignment, Gender) %>%
  drop_na()

chisq.test(table(pub_good))
chisq.test(table(pub_good), correct = FALSE)
fisher.test(table(pub_good))
mosaicplot(table(pub_good), shade = TRUE, color = TRUE)

heroes$is_human <- heroes$Race == "Human"
heroes$is_human <- NULL
gender_race <- heroes %>%
  transmute(is_human = Race == "Human", Gender) %>%
  drop_na()

gender_race %>%
  group_by(is_human) %>%
  summarise(mean(Gender == "Female"))

table(gender_race) %>% chisq.test()
table(gender_race) %>% chisq.test(correct = FALSE)
table(gender_race) %>% fisher.test()

table(gender_race) %>% mosaicplot(shade = TRUE, color = TRUE)
