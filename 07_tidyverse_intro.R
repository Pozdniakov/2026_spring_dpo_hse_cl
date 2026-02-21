# data.table vs tidyverse -------------------------------------------------

install.packages("data.table")
library(data.table)
heroes_dt <- fread("https://raw.githubusercontent.com/Pozdniakov/2026_spring_dpo_hse_cl/refs/heads/main/data/heroes_information.csv",
                   na = c("-99", "-", "", "NA"))
heroes_dt
class(heroes_dt)
heroes_dt[Alignment == "good",
          .(Height_mean = mean(Height, na.rm = TRUE)),
          by = Gender][order(Height_mean),]

install.packages("tidyverse")
library(tidyverse)

heroes_tbl <- read_csv("https://raw.githubusercontent.com/Pozdniakov/2026_spring_dpo_hse_cl/refs/heads/main/data/heroes_information.csv",
         na = c("-99", "-", "", "NA"))

class(heroes_tbl)
heroes_tbl

heroes_tbl %>% 
  filter(Alignment == "good") %>%
  group_by(Gender) %>%
  summarise(Height_mean = mean(Height, na.rm = TRUE)) %>%
  arrange(desc(Height_mean))

# Пайпы -------------------------------------------------------------------

sum(log(abs(sin(1:22))))

1:22 %>% 
  sin() %>% 
  abs() %>% 
  log(10, base = .) %>% 
  sum()
# 1 %>%
# `:` (22)

#{magrittr}

1:22 |>
  sin() |>
  abs() |>
  abs() |>
  log(10, base = _) |>
  sum()

c("Корень из", 2, "равен", sqrt(2))
2 %>% 
  c("Корень из", ., "равен", sqrt(.))

B <- matrix(10:39, nrow = 5)
apply(B, 1, mean)

10:39 %>%
  matrix(nrow = 5) %>%
  apply(1, mean)


# Работа с колонками ------------------------------------------------------

heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/2026_spring_dpo_hse_cl/refs/heads/main/data/heroes_information.csv",
                       na = c("-99", "-", "", "NA"))

heroes %>%
  select(1, 4)

heroes %>%
  select(name, Race, Publisher, `Eye color`)

heroes %>%
  select(name:Publisher)

heroes %>%
  select(name:`Eye color`, Publisher:Weight)

heroes_without_first_column <- heroes %>%
  select(!...1)

heroes_without_first_column

heroes %>%
  select(!Race)

heroes %>%
  select(!(Gender:Height))

heroes %>%
  select(name:last_col())
#last_col(heroes)

heroes %>%
  select(everything())

heroes %>%
  select(name, Publisher, everything())

heroes %>%
  select(ends_with("color"))

heroes %>%
  select(starts_with("H"))

heroes %>%
  select(starts_with("H") & ends_with("color"))

heroes %>%
  select(contains("eigh"))

heroes %>%
  select(where(is.numeric))

heroes %>%
  select(where(is.character))

heroes %>%
  select(where(function(x) !any(is.na(x)) ))
heroes %>%
  select(where(function(x) mean(is.na(x)) > .5 ))

heroes %>%
  select(id = ...1, name, Race)

heroes %>%
  rename(id = ...1)

names(heroes)
#names(heroes) <- make.names(names(heroes))

heroes %>%
  rename_with(make.names)

heroes %>%
  rename_with(str_to_lower)

heroes %>%
  rename_with(str_to_upper)

heroes %>%
  relocate(Publisher)

heroes %>%
  relocate(name, Publisher, where(is.numeric), ends_with("color"))

heroes %>%
  relocate(Publisher, .after = name)

heroes %>%
  relocate(Universe = Publisher, where(is.numeric), .before = Race)

heroes %>%
  select(2)

heroes %>%
  select(Height) %>%
  pull()

heroes %>%
  pull(Height)

heroes %>%
  pull(Height, name)
