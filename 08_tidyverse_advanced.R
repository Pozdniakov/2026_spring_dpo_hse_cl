library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/2026_spring_dpo_hse_cl/refs/heads/main/data/heroes_information.csv",
                   na = c("-99", "-", "", "NA"))

# Отбор строк -------------------------------------------------------------


heroes %>%
  slice(500:510)

heroes %>%
  filter(Publisher == "DC Comics")

heroes %>%
  filter(Publisher == "DC Comics", Weight < 100)

heroes %>%
  filter(Publisher == "DC Comics" & Weight < 100)

heroes %>%
  filter(Publisher == "DC Comics") %>%
  filter(Weight < 100)

heroes %>%
  filter_out(Publisher == "DC Comics") %>%
  filter(is.na(Publisher))

heroes %>%
  filter(!Publisher == "DC Comics") %>%
  filter(is.na(Publisher))
#tidyverse::tidyverse_update()

heroes %>%
  slice_max(Weight, n = 3)

heroes %>%
  slice_min(Weight, n = 3)

heroes %>%
  slice_max(Weight, n = 10, with_ties = FALSE)

heroes %>%
  slice_sample(n = 3)

heroes %>%
  slice_sample(prop = .01)

heroes %>%
  slice_sample(prop = 1)

heroes %>%
  drop_na()
heroes %>%
  drop_na(Weight)

heroes %>%
  drop_na(Height, Weight)

heroes %>%
  drop_na(where(is.numeric))


# Сортировка строк --------------------------------------------------------

heroes %>%
  arrange(Weight)

heroes %>%
  arrange(desc(Weight))

heroes %>%
  arrange(`Eye color`, Height)

heroes %>%
  arrange(Gender, desc(Weight))


# Создание колонок --------------------------------------------------------

heroes %>%
  mutate(imt = Weight/(Height/100)^2)

heroes %>%
  mutate(imt = Weight/(Height/100)^2, .before = Height)

heroes %>%
  mutate(imt = Weight/(Height/100)^2, .after = name)

heroes %>%
  transmute(name, Gender, imt = Weight/(Height/100)^2)

heroes %>%
  mutate(imt = Weight/(Height/100)^2, .after = name)

number <- -1

if (number > 0) {
  "Positive number"
} else {
  "Negative number or zero"
}

number <- -2:2
if (number > 0) {
  "Positive number"
} else if (number < 0) {
  "Negative number"
} else {
  "Zero"
}

if_else(number > 0, "Positive number", "Negative number or zero")

heroes %>%
  mutate(imt = Weight/(Height/100)^2, .after = name) %>%
  mutate(imt_group = if_else(imt > 30, "overweight", "not overweight"))

heroes %>%
  mutate(imt = Weight/(Height/100)^2, 
         imt_group = if_else(imt > 30, "overweight", "not overweight"),
         .after = name)

if_else(number > 0, 
        "Positive number",
        if_else(number < 0,
                "Negative number",
                "Zero"))

case_when(
  number > 0 ~ "Positive number", #if
  number < 0 ~ "Negative number", #if else
  .default = "Zero" #else
)

heroes %>%
  mutate(imt = Weight/(Height/100)^2,
         imt_group = case_when(
           is.na(imt) ~ NA_character_, #if
           imt > 40.  ~ "very overweight", #if else
           imt > 30   ~ "overweight", #if else
           imt < 18.5 ~ "underweight", #if else
           .default = "normal weight" #else
         ),
         .after = name) 


# Агрегация ---------------------------------------------------------------

heroes %>%
  summarise(Height_mean = mean(Height, na.rm = TRUE))

heroes %>%
  summarise(min(Height, na.rm = TRUE),
            max(Height, na.rm = TRUE))

heroes %>%
  summarise(first = first(Height),
            last = last(Height),
            tenth = nth(Height, 10))

heroes %>%
  group_by(Gender) %>% str()

heroes %>%
  group_by(Gender, Alignment) %>%
  summarise(Height_mean = mean(Height, na.rm = TRUE))

heroes %>%
  group_by(Gender, Alignment) %>%
  summarise(min = min(Height, na.rm = TRUE),
            max = max(Height, na.rm = TRUE))

range(1:10)
heroes %>%
  group_by(Gender) %>%
  reframe(range(Height, na.rm = TRUE))

heroes %>%
  summarise(mean(Height, na.rm = TRUE), .by = Gender)

#table(heroes$Gender, heroes$Alignment)

heroes %>%
  group_by(Gender) %>%
  summarise(n = n())

heroes %>%
  count(Gender)

heroes %>%
  count(Gender, Alignment, sort = TRUE)

heroes %>%
  mutate(Height_mean = mean(Height, na.rm = TRUE))

heroes %>%
  group_by(Gender) %>%
  mutate(Height_mean_by_gender = mean(Height, na.rm = TRUE), .after = Height) %>%
  ungroup() %>%
  mutate(diff_height_by_gender = Height - Height_mean_by_gender, .after = Height_mean_by_gender)

heroes %>%
  count(Race, sort = TRUE)

heroes %>%
  group_by(Race) %>%
  filter(n() >= 10)

heroes %>%
  group_by(Race) %>%
  filter(n() == 1) %>% View()


# Заключение основ тайдиверса ---------------------------------------------

#select() - выбор колонок
#filter() - отбор строк по условию
#arrange() - сортировка строк
#mutate() - для создания колонок (внутри может понадобиться if_else() или case_when())
#group_by() + summarise() - агрегация


# Соединение тибблов ------------------------------------------------------

band_members
band_instruments

bind_rows(band_members, band_instruments)

list_of_artists <- list(members = band_members, instruments = band_instruments)

list_of_artists %>%
  bind_rows(.id = "original_tibble")

# dir("data", full.names = TRUE) %>%
#   map(read_csv) %>%
#   bind_rows(.id = "file")

# read_csv(dir("data", full.names = TRUE)[1:2], )

bind_cols(band_members, band_instruments)

left_join(band_members, band_instruments)

band_members %>%
  left_join(band_instruments)

band_members
band_instruments

?left_join

names(band_members)
names(band_members)
?union
intersect(names(band_members), names(band_instruments))

band_members %>%
  left_join(band_instruments, by = "name")

band_instruments2

band_members %>%
  left_join(band_instruments2, by = join_by(name == artist))

band_members %>%
  left_join(band_instruments2, by = c("name" = "artist"))

band_members %>%
  right_join(band_instruments)

band_instruments %>%
  left_join(band_members)

band_members %>%
  full_join(band_instruments)

band_members %>%
  inner_join(band_instruments)

# band_members %>%
#   filter(name %in% band_instruments$name)

band_members %>%
  semi_join(band_instruments, by = "name")

band_instruments %>%
  semi_join(band_members, by = "name")


# band_members %>%
#   filter(!name %in% band_instruments$name)
band_members %>%
  anti_join(band_instruments, by = "name")

band_instruments %>%
  anti_join(band_members, by = "name")

