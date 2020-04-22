#############################################################
## Advanced Data Wrangling with Dplyr Exercises with Answers.
## Intro to R/RStudio Feb 2020
#############################################################
library(tidyr)
library(dplyr)
?data
data()
counties

# Let's explore the World Bank Population data that comes with base R
?world_bank_pop

world_pop = world_bank_pop

# 1. What the dimensions (rows, and columns) of the data and what are the column names?

dim(world_pop)

colnames(world_pop) #note that the function names also works

# 2. Assess the class of each variable and for the numeric, assess the min and max.
summary(world_pop)

# 3. Are there any duplicated rows in the data?
world_pop %>% filter(duplicated(.)) %>% nrow()


# 4. How many observations are present for each country?
world_pop %>% group_by(country) %>% count() %>% arrange()


# 5. What is the 30th value of the country variables?

world_pop %>% select(country) %>% slice(30)
world_pop %>% select(country) %>% summarise(nth(country,30))
world_pop$country[30]


# 6. Make a reduced data set called world_pop_2017. This dataset should have the country and indicator variables
# along with the population data for 2017 only. 

world_pop_2017 = world_pop %>% select(country, indicator, "2017")


# 7. Can you calculate the total population of the world in 2017?
# Hint, in functions like sum and mean you need to explicitly tell R to ignore the NA (missing) values
# otherwise it does not know how to add missing e.g., sum(`2017`, na.rm = T)

world_pop_2017t = world_pop_2017%>% filter(indicator == "SP.POP.TOTL")
world_pop_2017t %>% summarise(Tot = sum(`2017`, na.rm =T))


# 8. Using the entire dataset again, can you calculate the world's population for every year?
# Hint: Look at the notes in the advanced dplyr section. find a way to select the numeric columns of interest
# and then search for a summarise function that 
 
world_pop %>% select_if(is.numeric) %>% 
  summarise_all(list(total = sum, 
                   mean =mean), na.rm=T)


# 9. Let's make two datasets and look at different ways we can join them together
df1 = data.frame(col1 = seq(1,1000, 10), 
                 col2 = rep(2,100), 
                 col3 = rep(c("A", "B"),50))

                    
df2 = data.frame(col1 = seq(1,1000, 10), 
                 col2 = rep(255,100), 
                 col3 = rep(c("A", "C"),50))


# 9a, join the two dataframes using col3 as the key. Keep all rows in df1 and match matches with df2.
# You may need to change the variable types before joining. 
# Hint: Did you get an error about joining with factors? How can you fix the variable type so that we can join on col3.
# What happens to the other variables that are not being used as a by for the join ?
df1 = data.frame(col1 = seq(1,1000, 10), 
                 col2 = rep(2,100), 
                 col3 = rep(c("A", "B"),50), stringsAsFactors = F)


df2 = data.frame(col1 = seq(1,1000, 10), 
                 col2 = rep(255,100), 
                 col3 = rep(c("A", "C"),50), stringsAsFactors = F)

df1_join_df2 = left_join(df1, df2, by = c("col3"))

# What happens when you join on 3 variables? 

df1_join_df2_option2 = left_join(df1, df2, by = c("col3","col1", "col2"))


# 10. Let's use the have package and load the fake census data located in the folder called "4_Importing_Data/test_data"

library(haven)
my_census_2018 = read_sas("4_Importing_Data/test_data/fake_census_test_file.sas7bdat")

# Add a variable for Year and set its value to 2018. Can you do it using base R and dplyr?
my_census_2018$Year = 2018

my_census_2018 = my_census_2018 %>% mutate(Year = 2018)

# can you make a new dataset called my_census_2019 which is copy of the first 1000 rows of the 2018 dataset?
# Make sure to change the variable Year to 2019
my_census_2019 = my_census_2018 %>% slice(1:1000)

my_census_2019$Year = 2019

my_census_2019 = my_census_2019 %>% mutate(Year = 2019)


# Lets make a new df called my_census and add the rows from 2019 to the bottom of the 2018 data

my_census = bind_rows(my_census_2018, my_census_2019)


# Can you find a function that can help highlight the duplicated rows?
dups = my_census %>% filter(duplicated(ID) | duplicated(ID, fromLast = T))

z = my_census %>% filter(duplicated(ID, cen_address1))


# Using the 2018 and 2019 files separately, can you combine them so that only rows where there are matching values in both sets

only_matches = inner_join(my_census_2019, my_census_2018, by = c("ID"))

