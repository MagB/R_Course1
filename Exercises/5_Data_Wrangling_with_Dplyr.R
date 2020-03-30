#############################################################
## Advanced Data Wrangling with Dplyr Exercises with Answers.
## Intro to R/RStudio Feb 2020
#############################################################
library(tidyr)

?data
data()
counties

# Let's explore the World Bank Population data that comes with base R
?world_bank_pop

world_pop = world_bank_pop # It is good practice  manipulate a copy of the data and never alter the original data. 


# 1. What the dimensions (rows, and columns) of the data and what are the column names?





# 2. Assess the class of each variable and for the numeric, assess the min and max.



# 3. Are there any duplicated rows in the data?


# 4. How many observations are present for each country?


# 5. What is the 30th value of the country variables?




# 6. Make a reduced data set called world_pop_2017. This dataset should have the country and indicator variables
# along with the population data for 2017 only. 



# 7. Can you calculate the total population of the world in 2017?
# Hint, in functions like sum and mean you need to explicitly tell R to ignore the NA (missing) values
# otherwise it does not know how to add missing e.g., sum(`2017`, na.rm = T)




# 8. Using the entire dataset again, can you calculate the world's population for every year?
# Hint: Look at the notes in the advanced dplyr section. find a way to select the numeric columns of interest
# and then search for a summarise function that can be applied to all 
 
