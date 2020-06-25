# 1. Find the duplicated movie. How could you go across this?
# 2. Which director has made the longest movie?
# 3. What's the highest ranked movie?
# 4. Which movie got the most votes?
# 5. Which movie had the biggest revenue in 2016?
# 6. How much revenue made the movies in the dataset every year in total?

library(tidyverse)
imdb <- read_csv("scripts/data/imdb2006-2016.csv")  %>% 
  select(title = Title, director = Director, year = Year, runtime = `Runtime (Minutes)`, rating = Rating, votes = Votes, revenue_million = `Revenue (Millions)`, rank = Rank) 

# 1
imdb %>% count(title) %>% 
  arrange(desc(n))

# 2
imdb %>% arrange(desc(runtime))

# 3
imdb %>% arrange(rank)

# 4
imdb %>% arrange(desc(votes))

# 5
imdb %>% filter(year == 2016) %>% arrange(desc(revenue_million))

# 6
imdb %>% group_by(year) %>% 
  summarize(rev_sum = sum(revenue_million, na.rm = TRUE)*1000000)
