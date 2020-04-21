#############################################################
## Getting Started with dplyr 
## Intro to R/RStudio Feb 2020
#############################################################
# Resources:
# https://github.com/rstudio/EDAWR


# Most Data scientists/analysts estimate that 70-90% of their time
# is dedicated to data wrangling. 

# Data wrangling is broken down into 2 components
# 1. Data Manipulation:
        # This is changing variables, values, units, finding outliers or errors in data entry

# 2. Data Tidying:
        # Changing the layout of the data to make it suitable for analysis and visualizations.
        # For example, you may want to tranform your data from wide to long to perform a mixed model with estimates of observation errors. 

# There are two core packages in R that facilitate data wrangling:
        # 1. dplyr
        # 2. tidyr

# You will find that some folks refer to this set  of libraries (along with a few others such as ggplot, purr, tibble, stringr)
# as the tidyverse. https://www.tidyverse.org/

# If you haven't already please follow the steps outlined in the script called "1_Libraries_and_Packages.R", located in this folder "4_Advanced_Data_Wrangling"
# Load the dplyr, tidyr and ggplot2 packages.
install.packages("dplyr")
library(dplyr)



# Intro to dplyr
# There are 5 key functions within dplyr that make data wrangling and manipulations really easy. Note that there are 
# several more functions within dplyr that can do much more than the 5 items listed here. 
## 1) filter : selects rows 
## 2) select : selects columns
## 3) arrange : orders/sorts data or output
## 4) mutate : create new variables
## 5) summarise : summarise information.

# We will use the tuberculosis data from the WHO. The data is microdata reported on each 
# confirmed case of tuberculosis by country, year, and a gender

tb_data = read.csv("/Users/Maggie/Documents/barcodes.csv", stringsAsFactors = F, header = T)



# always begin by getting to know your data
summary(tb_data)
str(tb_data)
colnames(tb_data)

counts <- table(tb_data$country)
barplot(counts, ylim = c(0,40))

hist(tb_data$child) #Number of new cases reported among people 0 - 14 years of age
hist(tb_data$adult) #Number of new cases reported among people 15 - 64 years of age
hist(tb_data$elderly) #Number of new cases reported among people over 64 years of age
hist(tb_data$elderly[tb_data$elderly<20000]) 
   


# Let's start exploring how each of the 5 main functions wihtin dplyr help us quickly
# query the data.




# Filter: Let's look at tb rates in the United States of America

US_data = filter(tb_data, country == "United States of America" )




US_data = filter(tb_data, country == "United States of America" & adult >0 )
US_data = filter(tb_data, country == "United States of America" | country == "Yemen" )

US_data = filter(tb_data, grepl("United", country))


# Select: Let's extract the column of adult cases only
my_cols =  c("adult", "child", "elderly")
adult_cases = select(US_data, adult, child, elderly)





# Arrange (sort) the cases from smallest to largest
adult_cases = arrange(adult_cases, adult)

# Arrange (sort) the cases from largest to smallest
adult_cases = arrange(adult_cases, desc(adult), child)


# Mutate: Let's return to the full tb_data and make a new variable which is a count of all cases

tb_data = mutate(tb_data, all = adult + child + elderly)






tb_data = mutate(tb_data, 
  adult_scaled = adult/5*9, 
  means_cases = mean(adult, na.rm = T))





tb_data = mutate(tb_data, all_sum = sum(adult, child, elderly, na.rm = T))


# Summarise: Let's get a summary of all tb cases. What is the average cases?
summarise(tb_data, mean_adult = mean(adult, na.rm = T))
  
  

summarise(tb_data, 
  mean_adult = mean(adult, na.rm =T), 
  sd = sd(adult, na.rm =T))





summarise(tb_data, 
  country_count = n_distinct(country), 
  mean = mean(adult, na.rm = T), 
  n = n(), 
  miss = sum(is.na(adult) ), 
  not_missing = sum(!is.na(adult)) )




