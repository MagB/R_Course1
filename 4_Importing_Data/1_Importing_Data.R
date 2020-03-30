#############################################################
## Importing different types of data. 
## Intro to R/RStudio Feb 2020
#############################################################

# Importing data into R is usually quite simply. 


# Part 1. Flat text files. 
# There are several built in functions ready to help you import data. The example below is for read.table / read.csv
# These other functions could come in handy if you have non-standard data
# read.delim()
# readLines()

read.table
read.csv()


my_csv_data = read.csv("4_Importing_Data/test_data/tb.csv", sep = "," , header = T, quote = "\"", na.strings = c("NA", " ", "999"))
my_csv_data = read.csv("4_Importing_Data/test_data/tb.csv", sep = "," , header = T, quote = "\"", na.strings = c("NA", " ", "999"))


# Part 2. How to import directly from an Excel file. 
# For a simple import by sheet you can try the "xlsx" library.
# Similar to SAS, you can also do an import using a point and click. Look at the right hand side
# in the environ,ent window. Follow the point and click steps there to import the data. 
install.packages("xlsx")
library(xlsx)

my_excel = read.xlsx("4_Importing_Data/test_data/tb.xlsx", sheetName = "tb")


# Part 3. SPSS and SAS 
# There are a handful of libraries that can handle directly importing simple sas files. 
install.packages("Hmisc")
install.packages("haven")
install.packages("foreign")
install.packages("tidyr")

library(haven)
library(dplyr)

test_sas_data = read_sas("4_Importing_Data/test_data/fake_census_test_file.sas7bdat")



  