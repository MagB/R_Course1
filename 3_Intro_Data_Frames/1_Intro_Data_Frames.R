#############################################################
## Data Frames
## Intro to R/RStudio Feb 2020
#############################################################


# 1. Explore the basics of data frames 
# You can think of data frames as a grouping of vectors
# Let's start by building our own data by combining vectors and using the `data.frame()` function.
# Note that all the vectors included should have the same lengths

my_df <- data.frame(
        name = c("John","Jane","Elijah","Wanu"),
        birth = c(1940, 1954, 2017, 2011),
        instrument = c("guitar", "flute", "drums", "guitar")
)


# There are a number of built-in functions that help you quickly evaluate your data.
View(my_df)  #opens the data in the tab above. Or you can click on the df on the environment window on the right

names(my_df)
colnames(my_df)
head(my_df) #default shows top 10 rows
tail(my_df) #default shows bottom 10 rows
dim(my_df) #find dimensions
str(my_df) # structure, shows the variable names, type and first few observations. 
summary(my_df) # provides basic summary statistics on all variables i.e., min max median and quartiles, counts of character variables. 


# R treated the character columns as factors so let's convert them to characters using the 
# StringsAsFactors option in the data.frame statement .

my_df <- data.frame(
        name = c("John","Jane","Elijah","Wanu"),
        birth = c(1940, 1954, 2017, 2011),
        instrument = c("guitar", "flute", "drums", "guitar"), stringsAsFactors = F
)

str(my_df) # check structure again

write.csv(my_df, "my_df.csv") # Look for it on your computer




data1 <- read.csv(file.choose())  # In a pop up window, navigate to where your data is

        
## Remove objects from the Global environment
        
#`rm()` is the function we use. Just specify which object as an argument


rm(a) # to remove the object "a"
rm("b","c","d","f","data1")# to remove a number of objects
rm(list = ls())# to remove all the objects in the Global environment. [You may want to be sure before you run this code because the environment will be cleared]


# R also has a number of handy built-in data sets that we can use to test our workflow.
# E.g., 
airquality
cars
DNase
library(help = "datasets")
