library(rtweet)
library(tidyverse)

twitter_senators <- read_csv("https://raw.githubusercontent.com/oduwsdl/US-Congress/master/116thCongress/116Congress.csv") %>% 
  filter(Position == "Sen") %>% 
  select(name = `Wikipedia  Names`, twitter_name = Github)

senator_friends <- get_friends(twitter_senators$twitter_name, retryonratelimit = TRUE)
