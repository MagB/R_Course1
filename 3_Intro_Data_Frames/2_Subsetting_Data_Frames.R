#############################################################
## Subsetting Data Frames
## Intro to R/RStudio Feb 2020
#############################################################


# In baseR we select rows and columns using indeces just like we did for vectors
# https://www.statmethods.net/management/subset.html
str(airquality)

# Part 1. Extracting columns and rows
# The first indeces tell R which rows to extract and the second set indicates which columns ro extract. 
# Note that when no columns or rows are specified all are returned

airquality[ , ] # [row, column]


airquality = airquality
# Part 2, 
# Selecting (Keeping) Variables
airquality[1] # a single index extracts a column
airquality["Wind"] #  extracts a single column by name
airquality$Ozone #  extracts a column by name

airquality[1:4] # a series extracts multiple columns
airquality[c("Wind", "Temp")] #  extracts multiple columns by passimg vector of column name

colnames(airquality)

my_vars = c("Wind","Temp"  )

newdata <- airquality[my_vars]

airquality[1:3, c("Wind","Temp")]



# Excluding Variables
my_vars2 <- colnames(airquality) %in% my_vars

newdata <- airquality[1:3,!my_vars2]

# exclude 3rd and 5th variable
newdata <- airquality[c(-3,-5)]

# delete variables v3 and v5
airquality2 <- airquality
airquality2$Temp <- airquality2$Ozone <- NULL

# Part 3. Selecting Observations

# first 5 observations
newdata <- airquality2[1:5,]

# based on variable values. The which() function returns the index positions
newdata <- airquality[ which(airquality$Month == 5
        & airquality$Temp > 65), ]


