read.csv("/Users/ivan/Desktop/heroes_information.csv")
getwd()
#setwd
read.csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv")
rm("heroes_information")
read.csv("data/heroes_information.csv")

heroes <- read.csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
                   na.strings = c("-99", "-", "NA", " ", ""))

mean(heroes$Height, na.rm = TRUE)

# heroes_wrong <- read.csv2("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
#          na.strings = c("-99", "-", "NA", " ", ""), encoding = "UTF-8")

str(heroes)

# read.table("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
#            header = TRUE, sep = ",", quote = "\"", dec = ".",
#            na.strings = c("-99", "NA", "-", " ", ""))

gender_factor <- as.factor(heroes$Gender)
gender_factor
str(gender_factor)
attributes(gender_factor)
methods(print)
attributes(gender_factor) <- NULL
gender_factor
as.character(gender_factor)
as.integer(gender_factor)

install.packages("readxl")

chooseCRANmirror()
# 73 потом 9
# Если не помогло, то 
# 17
library(readxl)
nhk <- read_excel("data/nhk_news_3feb.xlsx")
nhk_df <- as.data.frame(nhk)
read_excel("data/nhk_news_3feb.xlsx", range = "B1:E11")

install.packages("googlesheets4")
library(googlesheets4)
read_sheet("https://docs.google.com/spreadsheets/d/1U6Cf_qEOhiR9AZqTqS3mbMF3zt2db48ZP5v3rkrAEJY/edit#gid=780868077")

heroes_female <- heroes[heroes$Gender == "Female",]
write.csv(x = heroes_female,
          file = "data/female_heroes.csv",
          row.names = FALSE)
heroes$X <- NULL
