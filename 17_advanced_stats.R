
# Ковариации и корреляции -------------------------------------------------

install.packages("Stat2Data")
library(Stat2Data)
library(tidyverse)
data(Backpack)

back <- Backpack %>%
  mutate(backpack_kg = 0.453592 * BackpackWeight,
         body_kg = 0.453592 * BodyWeight)

back %>%
  select(body_kg, backpack_kg) %>%
  cov()

back %>%
  select(body_kg, backpack_kg) %>%
  var()

back %>%
  select(BodyWeight,BackpackWeight) %>%
  cov()

back %>%
  select(body_kg, backpack_kg) %>%
  cor()

cor.test(back$body_kg, back$backpack_kg)

plot(back$body_kg, back$backpack_kg)

cor.test(back$body_kg, back$backpack_kg, method = "spearman")
cor.test(back$body_kg, back$backpack_kg, method = "kendall")

cor.test(back$BodyWeight, back$BackpackWeight)

heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/2026_spring_dpo_hse_cl/refs/heads/main/data/heroes_information.csv",
                   na = c("-99", "-", "", "NA"))
options(scipen = 999)
cor.test(heroes$Height, heroes$Weight, method = "spearman")
plot(heroes$Height, heroes$Weight)

t.test(back$backpack_kg ~ back$BackProblems, var.equal = TRUE)
cor.test(back$backpack_kg, back$BackProblems)

back %>%
  select(Year, Units, body_kg, backpack_kg) %>%
  cor()

back %>%
  select(Year, Units, body_kg, backpack_kg) %>%
  psych::corr.test(adjust = "bonferroni")

back %>%
  select(Year, Units, body_kg, backpack_kg) %>%
  psych::corr.test()

back %>%
  select(Year, Units, body_kg, backpack_kg) %>%
  psych::corr.test(adjust = "BH")

p_vec <- seq(0.0001, 0.06, length.out = 10)
p_vec
p.adjust(p_vec, method = "fdr")

model <- lm(backpack_kg ~ body_kg, data = back)
model
str(model)
model$coefficients
ggplot(data = back, aes(x = body_kg, y = backpack_kg)) +
  geom_point() +
  geom_abline(slope = model$coefficients[2],
              intercept = model$coefficients[1])

model
predict(model)
predict(model, newdata = data.frame(body_kg = 100))
predict(model, newdata = data.frame(body_kg = 0))
model
summary(model)
residuals(model)
back$backpack_kg - predict(model)
mean(residuals(model))
class(model)
plot(model)
tss <- sum((back$backpack_kg - mean(back$backpack_kg))^2)
rss <- sum(residuals(model) ^ 2)
tss
1 - rss/tss
cor.test(back$body_kg, back$backpack_kg)$estimate ^ 2

model_multi <- lm(backpack_kg ~ body_kg + Units + Year + BackProblems, data = back)
summary(model_multi)

car::vif(model_multi)


# ANOVA -------------------------------------------------------------------

#ANalysis Of VAriance
diet <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/stcp-Rdataset-Diet.csv")

diet <- diet %>%
  mutate(weight_diff = weight6weeks - pre.weight,
         Dietf = factor(Diet, labels = LETTERS[1:3]))
lm(weight_diff ~ Dietf, data = diet) %>%
  summary()

aov(weight_diff ~ Dietf, data = diet) %>%
  summary()

aov_model <- aov(weight_diff ~ Dietf, data = diet)
pairwise.t.test(diet$weight_diff, diet$Dietf, pool.sd = FALSE)

TukeyHSD(aov_model)


# Иерархическая кластеризация ---------------------------------------------

mtcars %>%
  scale() %>%
  dist() %>%
  hclust() %>% plot()
