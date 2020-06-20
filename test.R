library(tidyverse)

movies <- read_csv("scripts/data/imdb2006-2016.csv") %>% 
  select(title = Title, genre = Genre, director = Director, year = Year, runtime = `Runtime (Minutes)`, rating = Rating, votes = Votes, )


movies <- filter()