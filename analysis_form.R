library(tidyverse) 

data <- read_csv("form_results.csv") 

View(data)

glimpse(data) 

# first question: students' experience with different applications
relationship <- data %>% 
  select(1:7) %>% 
  rename_at(vars(starts_with("How is your relationship")), 
            funs(str_extract(., "(?<=\\[).+?(?=\\])"))) %>% 
  pivot_longer(-Zeitstempel,
               names_to = "application", 
               values_to = "experience") %>% 
  mutate(experience = as_factor(experience), 
         experience = fct_relevel(experience, c(
           "Never heard of it",
           "I know how to open the application",
           "Used it a couple of times",
           "Used it for a project/assignment/paper",
           "Advanced user")))

ggplot(data = relationship) + 
  geom_bar(aes(experience, fill = experience)) +
  facet_grid(application ~ .) 

# second question: students' experience with R
terms_of_r <- data %>% 
  select(1, 8:15) %>% 
  rename_at(vars(starts_with("In terms of")),
            funs(str_extract(., "(?<=\\[).+?(?=\\])"))) %>% 
  pivot_longer(-Zeitstempel, 
               names_to = "achievement", 
               values_to = "experience") %>%
  mutate(experience = as_factor(experience),
         experience = fct_relevel(experience, c(
           "Never heard of it",
           "Read of it",
           "Did it a couple of times",
           "Did it for something somebody else graded (project/paper/etc.)",
           "Doing it on a daily basis")))

ggplot(data = terms_of_r) +
  geom_bar(aes(experience, fill = experience)) +
  facet_grid(achievement ~ .)

# third question: what the students want to do in the final part
final_part <- data %>% 
  select(1, answer = 16) 

ggplot(data = final_part, aes(answer)) +
  geom_bar() # --> not readable

final_part %>% count(answer) %>% 
  mutate(percentage = round(n/sum(n), 2)) 




