library(tidyverse)
penguins <- palmerpenguins::penguins
g_penguins <- ggplot() +
  geom_point(data = penguins, 
             aes(x = flipper_length_mm,
                 y = body_mass_g,
                 size = body_mass_g,
                 shape = sex,
                 colour = body_mass_g),
             alpha = 0.7) +
  geom_smooth(data = penguins, 
              aes(x = flipper_length_mm,
                  y = body_mass_g),
              colour = "#202030", method = "lm") +
  scale_colour_viridis_c(option = "inferno", end = .9) +
  facet_wrap(~island) +
  labs(x = "Flipper length, mm",
       y = "Body mass, g",
       title = "Penguins",
       subtitle = "...but not from Madagaskar",
       caption = "Pozdniakov Ivan",
       colour = "Body mass, g",
       size = "Body mass, g",
       shape = "Sex") +
  hrbrthemes::theme_ipsum()

install.packages("plotly")
library(plotly)
ggplotly(g_penguins)

install.packages("leaflet")

library(leaflet)
leaflet() %>%
  addTiles() %>%
  addMarkers(lat=55.767290, lng=37.664066, popup="Our academic home")

install.packages('tinytex')
tinytex::install_tinytex()
# to uninstall TinyTeX, run tinytex::uninstall_tinytex() 

install.packages("rdracor")
library(rdracor)
corpora_meta <- get_dracor_meta()
class(corpora_meta)
summary(corpora_meta)
plot(corpora_meta)

tat <- get_dracor("tat")
summary(tat)

rus <- get_dracor("rus")
rus

revizor_df <- get_text_df("gogol-revizor", "rus")
revizor_df
get_text_chr_spoken("gogol-revizor", "rus")
