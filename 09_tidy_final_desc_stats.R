library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/2026_spring_dpo_hse_cl/refs/heads/main/data/heroes_information.csv",
                   na = c("-99", "-", "", "NA"))


# Wide and long: pivot_*() ------------------------------------------------


new_diet <- tribble(
 ~student, ~before_r_course, ~after_r_course,
 "Masha", 79, 70,
 "Liza", 75, 71,
 "Mark", 85, 83
)

new_diet %>%
  pivot_longer(cols = before_r_course:after_r_course)

new_diet %>%
  pivot_longer(cols = before_r_course:after_r_course,
               names_to = "time",
               values_to = "weight") %>%
  pivot_wider(names_from = time,
              values_from = weight)


# across() ----------------------------------------------------------------

heroes %>%
  drop_na(Height, Weight) %>%
  group_by(Gender) %>%
  summarise(mean_height = mean(Height),
            mean_weight = mean(Weight))

heroes %>%
  #drop_na(Height, Weight) %>%
  group_by(Gender) %>%
  summarise(across(ends_with("eight"), mean, na.rm = TRUE))

heroes %>%
  #drop_na(Height, Weight) %>%
  group_by(Gender) %>%
  summarise(across(ends_with("eight"), function(x) mean(x, na.rm = TRUE)))

heroes %>%
  drop_na(Height, Weight) %>%
  group_by(Gender) %>%
  summarise(across(where(is.character), function(x)
    mean(nchar(x), na.rm = TRUE)))

heroes %>%
  drop_na(Height, Weight) %>%
  group_by(Gender) %>%
  summarise(across(where(is.character), function(x)
    mean(nchar(x), na.rm = TRUE)),
            across(where(is.numeric), mean))

heroes %>%
  drop_na(Height, Weight) %>%
  group_by(Gender, Alignment) %>%
  summarise(across(c(Height, Weight), list(minimum = min,
                                           average = mean,
                                           maximum = max)))

heroes %>%
  mutate(across(where(is.character), as.factor)) %>%
  mutate(across(where(is.factor), as.integer))

iris %>% 
  group_by(Species) %>%
  mutate(across(where(is.numeric), function(x) x/max(x) * 100))

iris %>%
  mutate(across(where(is.numeric), function(x) (x - mean(x))/sd(x) ))


# list-columns and nesting ------------------------------------------------

heroes_nested <- heroes %>%
  nest(data = !Gender)

heroes %>%
  group_by(Gender) %>%
  nest() %>%
  ungroup()

heroes %>%
  nest(data = !Gender) %>%
  mutate(dim = map(data, dim)) %>%
  unnest(dim) %>%
  select(!data)

heroes %>%
  nest(data = !Gender) %>%
  mutate(dim = map(data, dim)) %>%
  unnest_wider(dim, names_sep = "_") %>%
  select(!data)

films <- tribble(
  ~film, ~genres,
  "Солнцестояние", "horror, triller",
  "Interstellar", "adventures, drama, sci-fi",
  "Бегущий по лезвию", "drama, sci-fi",
  "Metropolis", "drama, sci-fi"
)

films
films %>%
  filter(str_detect(genres, fixed("sci-fi")))

str_split(films$genres, ", ")

films %>%
  mutate(genres = str_split(genres, ", ")) %>%
  unnest_longer(genres) %>%
  mutate(value = TRUE) %>%
  pivot_wider(names_from = genres, 
              values_from = value,
              values_fill = FALSE)

films %>%
  separate_longer_delim(cols = genres, delim = ", ") %>%
  mutate(value = TRUE) %>%
  pivot_wider(names_from = genres, 
              values_from = value,
              values_fill = FALSE)


# Descriptive stats -------------------------------------------------------

weight <- heroes %>%
  drop_na(Weight) %>%
  pull(Weight)


# Central tendencies ------------------------------------------------------

sum(weight)/length(weight)
mean(weight)
mean(c(weight, 100500))
median(weight)
sort(weight)
median(c(weight, 100500))

heroes %>%
  count(Race, sort = TRUE)

mean(weight, trim = 0.1)
mean(weight, trim = 0.5)
