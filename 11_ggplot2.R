library(tidyverse)

penguins
# install.packages("palmerpenguins")
# penguins <- palmerpenguins::penguins
dim(penguins)
gg <- ggplot()

ggplot() +
  geom_point(data = penguins, 
             aes(x = flipper_length_mm,
                 y = body_mass_g,
                 shape = sex))

ggplot() +
  geom_point(data = penguins, 
             aes(x = flipper_length_mm,
                 y = body_mass_g),
             shape = "🐧",
             size = 4)

ggplot() +
  geom_point(data = penguins, 
             aes(x = flipper_length_mm,
                 y = body_mass_g,
                 size = body_mass_g,
                 shape = sex),
             colour = "#209570",
             alpha = 0.5)

penguins_species <- penguins %>%
  count(species)

ggplot() +
  geom_col(data = penguins_species, aes(x = species, y = n))

ggplot() +
  geom_bar(data = penguins, aes(x = species))

ggplot() +
  geom_col(data = penguins, aes(x = species), stat = "count")

ggplot() +
  geom_point(data = penguins, 
             aes(x = flipper_length_mm,
                 y = body_mass_g,
                 size = body_mass_g,
                 shape = sex),
             colour = "#209570",
             alpha = 0.5) +
  geom_smooth(data = penguins, aes(x = flipper_length_mm, y = body_mass_g),
              method = "lm")

ggplot() +
  geom_point(data = penguins,
             aes(x = species,
                 y = body_mass_g), alpha = .5,
             position = position_jitter(width = .1, height = 0))

ggplot() +
  geom_bar(data = penguins, aes(x = species, fill = sex),
           position = "dodge")

ggplot() +
  geom_bar(data = penguins, aes(x = species, fill = sex),
           position = "fill")

ggplot() +
  geom_violin(data = penguins,
              aes(x = species,
                  y = body_mass_g,
                  fill = species), adjust = .5) +
  geom_point(data = penguins,
             aes(x = species,
                 y = body_mass_g), alpha = .5,
             position = position_jitter(width = .1, height = 0)) +
  geom_boxplot(data = penguins, aes(x = species, body_mass_g),
               width = .15, alpha = .8, outlier.shape = NA)

penguins %>%
  ggplot(aes(x = species, y = body_mass_g, fill = species)) +
  geom_violin(adjust = .5) +
  geom_point(alpha = .5,
             position = position_jitter(width = .1, height = 0)) +
  geom_boxplot(fill = "white", width = .15, alpha = .8, outlier.shape = NA)

ggplot() +
  geom_density(data = penguins, aes(x = body_mass_g, fill = species),
                 position = "identity", alpha = .7, adjust = .4)

ggplot() +
  geom_point(data = penguins, 
             aes(x = flipper_length_mm,
                 y = body_mass_g,
                 size = body_mass_g,
                 shape = sex),
             colour = "#209570",
             alpha = 0.5) +
  coord_transform(x = "log", y = "log")

ggplot() +
  geom_bar(data = penguins, aes(x = species, fill = sex),
           position = "fill") +
  coord_flip()

ggplot() +
  geom_bar(data = penguins, aes(x = "",fill = sex),
           position = "fill") +
  coord_polar(theta = "y")

ggplot() +
  geom_point(data = penguins, 
             aes(x = flipper_length_mm,
                 y = body_mass_g,
                 size = body_mass_g,
                 shape = sex,
                 colour = species),
             alpha = 0.5) +
  scale_colour_manual(values = c(Gentoo = "red",
                                 Chinstrap = "green", 
                                 Adelie = "blue"))

ggplot() +
  geom_point(data = penguins, 
             aes(x = flipper_length_mm,
                 y = body_mass_g,
                 size = body_mass_g,
                 shape = sex,
                 colour = species),
             alpha = 0.7) +
  scale_colour_brewer(palette = "Set1") +
  hrbrthemes::theme_ipsum()

ggplot() +
  geom_point(data = penguins, 
             aes(x = flipper_length_mm,
                 y = body_mass_g,
                 size = body_mass_g,
                 shape = sex,
                 colour = body_mass_g),
             alpha = 0.7) +
  scale_colour_viridis_c(option = "inferno", end = .9) +
  theme_minimal()

ggplot() +
  geom_bar(data = penguins, aes(fill = species, x = sex),
           position = "dodge") +
  coord_flip() +
  scale_fill_brewer(palette = "Set1")

ggplot() +
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
