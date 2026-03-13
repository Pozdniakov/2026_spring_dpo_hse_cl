library(tidyverse)
library(rdracor)
ru <- get_dracor("rus")
class(ru)
ru
summary(ru)

ru %>%
  count(firstAuthorName, sort = TRUE)

ostrovsky_corpus <- ru %>%
  filter(firstAuthorName == "Островский, Александр Николаевич")

# library(ggrepel)
remotes::install_version("ggrepel", version = "0.9.6")

ostrovsky_corpus %>%
  mutate(fem_ratio = numOfSpeakersFemale/(numOfSpeakersMale + numOfSpeakersFemale),
         .before = numOfSpeakersFemale) %>%
  select(title, yearNormalized, numOfSpeakers, fem_ratio) %>%
  ggplot(aes(x = yearNormalized, y = fem_ratio)) +
  geom_hline(yintercept = c(0, 1), colour = "#9595A7", alpha = .7) +
  geom_hline(yintercept = 0.5, colour = "#9595A7", linetype = "dotted", alpha = .7) +
  geom_point(aes(size = numOfSpeakers), alpha = .8) +
  ggrepel::geom_text_repel(aes(label = title), max.overlaps = 4) +
  hrbrthemes::theme_ipsum() +
  labs(x = "Год (нормализованный)",
       y = "Доля женских персонажей",
       title = "Что-то произошло с Островским в начале 1860ых",
       subtitle = "Резкое падение доли женских персонаженй в пьесах Островского",
       size = "Количество\nперсонажей")

bp_id <- "ostrovsky-bespridannitsa"
bp_coocur <- get_net_cooccur_igraph(play = bp_id, corpus = "rus")
class(bp_coocur)
igraph::page_rank(bp_coocur)
plot(bp_coocur)
summary(bp_coocur)

bp_relations <- get_net_relations_igraph(play = bp_id, corpus = "rus")
plot(bp_relations)

get_play_metadata(play = bp_id, corpus = "rus")

get_text_tei(play = bp_id, corpus = "rus")
get_text_chr_spoken(play = bp_id, corpus = "rus", gender = "FEMALE")
get_text_chr_stage(play = bp_id, corpus = "rus")
get_text_chr_spoken_bych(play = bp_id, corpus = "rus", as_data_frame = TRUE)

bp_df <- get_text_df(play = bp_id, corpus = "rus")

bp_df %>%
  filter(type == "p") %>%
  count(who, sort = TRUE)
  
library(stringi)

stri_rand_strings(10, 5, pattern = "[ab]")

bp_line <- bp_df %>%
  filter(type == "p") %>%
  slice(1) %>%
  pull(text)

str_split(bp_line, pattern = "\\s")

bp_lines <- bp_df %>%
  filter(type == "p")

str_detect(bp_lines$text, "-c")

bp_lines %>%
  filter(str_detect(text, "-с\\W")) %>%
  pull(text)

people <- c("Tanyaya.. ", "Katya", "Vanya", "  Lena.  ")
str_detect(people, "ya")
str_extract_all(people, "ya")

str_extract_all(people, ".")
str_extract(people, "\\.")
str_extract(people, fixed(".")) 

str_replace_all(people, "ya", "я")
str_remove(people, fixed("."))
str_remove_all(people, fixed("."))
str_trim(people, side = "left")
str_pad(people, 10, pad = "_", side = "right")

?str_glue()

month.name
str_glue("{month.name} is the {1:12}th month in a year")

23 %% 10
case_when(23 %% 10)
ending <- function(x) {
  if_else(x > 10 & x < 15,
          "ей",
          recode_values(x %% 10,
                        c(1) ~ "",
                        2:4 ~ "а",
                        c(0, 5:9) ~ "ей"))
}

ending(1860:1875)

ru %>%
  select(title, firstAuthorName, yearPrintedFinish, size) %>%
  mutate(info = str_glue("{firstAuthorName} написал пьесу \"{title}\" в {ifelse(is.na(yearPrintedFinish), 'неизвестном', yearPrintedFinish)} году, в пьесе {size} персонаж{ending(size)}"),
         .before = everything()) %>%
  pull(info)

str_glue("Квадрат числа {1:10} равен {(1:10)^2}")

#install.packages("udpipe")
library(udpipe)
syntagrus_model <- udpipe_download_model("russian-syntagrus")
?udpipe
bp_df %>%
  count(line_id, sort = TRUE)

bp_udpiped <- bp_df %>%
  relocate(doc_id = line_id) %>%
  udpipe(object = syntagrus_model)

bp_wide <- bp_udpiped %>%
  separate_longer_delim(feats, "|") %>%
  separate_wider_delim(feats, "=", names = c("feature", "value")) %>%
  pivot_wider(names_from = feature, values_from = value)

bp_filtered <- bp_wide %>%
  #filter(upos %in% c("NOUN", "VERB", "ADJ", "PROPN", "ADV"))
  filter(upos %in% c("NOUN", "VERB", "ADJ", "ADV"))

bp_wide %>%
  distinct(upos)

bp_wide %>%
  count(upos)

bp_characters <- get_play_characters(bp_id, "rus")

bp_full <- bp_wide %>%
  filter(upos == "NOUN") %>%
  mutate(line_id = as.integer(doc_id), .before = doc_id) %>%
  left_join(bp_df, by = "line_id") %>%
  filter(type == "p") %>%
  left_join(bp_characters, by = c("who" = "id"))

bp_full %>%
  select(Case, who, sex) %>%
  group_by(Case) %>%
  summarise(mean(sex == "FEMALE", na.rm = TRUE))

bp_filtered %>%
  count(lemma, sort = TRUE)

#install.packages("stopwords")
library(stopwords)
stopwords(language = "ru")
stopwords_getsources()

ru_ind <- map(stopwords_getsources(),
    stopwords_getlanguages) %>%
  map_lgl(function(x) "ru" %in% x)

stopwords_getsources()[ru_ind]
stopwords_ru <- map(stopwords_getsources()[ru_ind],
    function(x) stopwords(language = "ru", source = x)) %>%
  unlist() %>%
  unique()

bp_filtered %>%
  count(lemma, sort = TRUE) %>%
  filter(!lemma %in% stopwords_ru)

#install.packages("wordcloud2")
library(wordcloud2)

bp_filtered %>%
  count(lemma, sort = TRUE) %>%
  filter(!lemma %in% stopwords_ru) %>%
  wordcloud2(shape = "pentagon")
