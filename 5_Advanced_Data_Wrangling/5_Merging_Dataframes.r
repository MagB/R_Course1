#############################################################
## Merging data frames with dplyr 
## Intro to R/RStudio Feb 2020
#############################################################

library(dplyr)

# There are two different ways that you may want to combine datasets. 
# 1. Combining data sets by binding: simple addition of columns or rows
# 2. Combining data sets by matching a common key. 

# You may also find it handy to combine datasets and reduce the matching set to that with or without specific matches
# 3. Combine data sets from a filtered set of matching keys

# We will stay within the tidyverse way of combining data 


#1. Binding 
# LEt's starte by making 2 dataframes along with a new column identifying the source of the datasets. 

airquality1 = airquality %>% mutate(source_df = "airquality1")

airquality2 = airquality %>% mutate(source_df = "airquality2")

# let's append airquality2 onto airquality1

airquality_rbind = bind_rows(airquality1, airquality2) #append airquality2 onto airquality1

airquality_cbind = bind_cols(airquality1, airquality2) #append airquality2 as new columns to airquality1. 
# Notice that the column names are automatically changed of airquality2. Now Ozone is Ozone1. 

colnames(airquality_cbind)




# 2. Combining datasets with a by statement. 
# Here we will add a key called id that we will use to match rows between the two datasets. 
# Just to keep things interesting, the id we are adding will not be the sequential row number. 

airquality1 = airquality %>% mutate(source_df = "airquality1", id = sample(1:nrow(airquality), replace = F)) %>% arrange(id)
airquality2 = airquality %>% mutate(source_df = "airquality2", id = sample(1:nrow(airquality), replace = F)) %>% arrange(id)

joined_airqual = left_join(airquality1, airquality2, by= "id")  #matches rows from airquality2 to airquality1

joined_airqual = right_join(airquality1, airquality2, by= "id")  #matches rows from airquality1 to airquality2


# Let's give the datasets different identifiers that do not have perfect overlap between the two datasets
airquality1 = airquality %>% mutate(source_df = "airquality1", id = sample(50:(nrow(airquality)+49), replace = F)) %>% arrange(id)
airquality2 = airquality %>% mutate(source_df = "airquality2", id = sample(1:nrow(airquality), replace = F)) %>% arrange(id)


joined_airqual_inner = inner_join(airquality1, airquality2, by= "id")  #Retains only rows that have a match in both sets. 

joined_airqual_inner = full_join(airquality1, airquality2, by= "id")  #Retains all values and all rows. 


# 3. Filtering Joins 

joined_airqual_semi = semi_join(airquality1, airquality2, by= "id")  #Retains rows in airquality1 that have a match in airquality2

joined_airqual_anti = anti_join(airquality1, airquality2, by= "id")  #All rows in a that do not have a match in b