#############################################################
## Pipe Operator  %>% 
## Intro to R/RStudio Feb 2020
#############################################################

# Here we will cover 2 topics:
# Part 1. What is the pipe operator and how to use it to string together a series of select, filter and  data summaries. 
# Part 2. Use the group by function to calculate summary stats for each group


# Part 1. What is the pipe operator and how to use it to select, filter and summarize data. 



# Pipes are a powerful tool for clearly expressing a sequence of multiple operations.
# They are commonly used in Unix-like computer operating systems, javascripting and other languages
# to pass output from one process as the input for the next. 

# The syntax is quite straightforward. Consider the pipe to be saying "I'm taking this
# thing on the left and passing it to this process on the right). 

# What makes the pipe operator particularly great is that it allows one to string together
# a sequence of processes in a clear and human readable format. 


#key board shortcut. 
CTRL + SHIFT + M
%>% 

# Let's take the tb data and now ask for the summary stats (mean and total counts) for each 
# county. 

tb_data = read.csv("/Users/Maggie/Downloads/RTraining_2020/STATCAN_R_COURSE1/5_Advanced_Data_Wrangling/data/tb.csv", stringsAsFactors = F, header = T)
iris
# Another feature within RStudio that is fabulous is the autocomplete. As you start typing hit tab. You should
# be given a menu of variables within the data set and other functions that match the first letters of typing. 

# So here we are taking the tb_data, and passing it with the pipe operator to the mutate function which will calculate a new
# variable labelled "total" which will be the total number of cases for that country by year
# If we had a very large dataset we would want to select only the columns of interest, (country, year, total)


#  Let's use the pipe operator syntax to find the total number of tuberculosis cases in 2000 in Yemen. 
library(dplyr)
mutate(tb_data,total = child + adult + elderly )

tb_data2 = tb_data %>% mutate(total = child + adult + elderly) %>% 
        filter(year == "2000"  &  country  == "Yemen")  # you can use the & logical operator or you can separate the filter into two steps




tb_data2 = tb_data %>% mutate(total = child + adult + elderly) %>% 
        filter(year == "2000") %>%  filter(country  == "Yemen") # here we first select data from the year 2000 and then from that set we select the data for Yemen



# In the final step we can use the summarize function to find the total number of cases of tb in Yemen in 2000.
tb_data %>% mutate(total = child + adult + elderly) %>% 
        filter(year == "2000" & country  == "Yemen") %>% # here we first select data from the year 2000 and then from that set we select the data for Yemen
        summarise(child = sum(child), 
                adult = sum(adult), 
                elderly= sum(elderly), 
                total = sum(total),
                n_obs = n())


 
# Part 2. Use the group by function to calculate summary stats for each group

tb_data2 = tb_data %>% 
        mutate(total = child + adult + elderly) %>% 
        group_by(country) %>% 
        summarise(country_total = sum(total, na.rm = T), 
                mean = mean(total, na.rm=T))



tb_data2 = tb_data %>% 
        mutate(total = child + adult + elderly) %>% 
        group_by(country) %>% 
        filter(any(adult > 8000))









# Using this syntax, can you figure out how, for each country, we can compare the total counts of tb cases for males and females 
tb_data2 = tb_data %>% mutate(total = child + adult + elderly) %>% 
        group_by(country, sex) %>%   
        summarise(year_total = sum(total, na.rm = T), mean = mean(total, na.rm=T))

