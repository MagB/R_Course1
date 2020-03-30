library(dplyr)
rm(starwars)

starwars2 = starwars %>% rbind(starwars)

# This function allows you to vectorise multiple if_else() statements. 
# It is an R equivalent of the SQL CASE WHEN statement. If no cases match, NA is returned.

y <- seq(-2, 2, by = .5)
case_when(y >= 0 ~ sqrt(y),TRUE   ~ y) # Remove the TRUE ~ y and see how the output changes

# Remove duplicate rows and check number of rows
starwars2 %>% select(-c("films", "vehicles", "starships" )) %>% filter(duplicated(species)) %>% nrow()
starwars2 %>% select(-c("films", "vehicles", "starships" )) %>% filter(duplicated(.)) %>% nrow()



# keep all rows that are replicated. 
copies = starwars2 %>% filter(duplicated(starwars2) | duplicated(starwars2,fromLast=T))

# keep only the distinct unique rows
select_columns = colnames(starwars2)[!(colnames(starwars2) %in% c("films", "vehicles", "starships" ))]
starwars2 = starwars2 %>% distinct()

# Remove duplicated rows based on Sepal.Length
iris 
iris %>% distinct(Sepal.Length, .keep_all = TRUE)

iris %>% distinct()




# More advanced filtering:
colnames(iris)
unique(iris$Species)

# extract rows based on multiple variables and matching to a list
iris %>% filter(Species %in% c("setosa", "versicolor") & Petal.Width > 0.30)

# Extract all rows where species name contains a H
iris %>% filter(grepl("v",Species))



# What species of character in starwars has blue eyes
blue_eye_species =  starwars %>% group_by(species) %>% filter(any(eye_color == "blue"))
blue_eye_fixed_species =  starwars %>% group_by(species) %>% filter(all(eye_color == "blue"))



# Summarise options
# Summarise multiple variables using summarise_at()
iris %>%
        filter(Species == "versicolor") %>%
          summarise_at(c("Sepal.Length", "Sepal.Width"),
                mean, na.rm = T)

# Summarise conditionally using summarise_if()
iris %>%       
  filter(Species == "versicolor") %>%
        summarise_if(is.numeric,
                funs(n(),
                        mean,
                        median))

# Subset numeric variables and use summarise_all() to get summary statistics
iris %>%       
  filter(Species == "versicolor") %>% 
  select_if(is.numeric) %>% 
  summarise_all(
        list(mean = mean, 
              median= median, 
               sd= sd, 
               var= var), na.rm = T)

iris %>% 
        mutate(Norm.Sepal.Length = (Sepal.Length - mean(Sepal.Length)) / sd(Sepal.Length))