#############################################################
## Subsetting Vectors
## Intro to R/RStudio Feb 2020
#############################################################


# One of the cores tasks of any data scienctist/analyst is querying and subsetting data.
# In base R, all you need to know is the index of the item(s) you want to extract.
# There are 2 main ways to do this. 
# 1) Pass the numerical index of the item(s). Note you can pass a single number of list of numbers. 
# 2) Use the which function which converts a logical vector (TRUE/FALSE) a numeric list



# Part 1: Explore extracting elements with numerical indices.

# Let's make a new vector where the first 5 entries are 0 and the last 5 values are 0
# R is 1 indexed meaning that the first entry in a vector (or object or list) starts at index 1
x <- c(0,0,0,0,0, 1,1,1,1,1)

# How can you save the 4th element of x to y
# How can you change the 6th element of x to 99?

x[4]

x[4] = 99

x


vector_values <- LETTERS    # creates an object with the letters of the alphabet
length(vector_values)       # gives you the length of a vector. How many elements it has basically


vector_values[6]         # picking letter number 6
vector_values[10:19]     # pick letters from 10 to 19
vector_values[ -c(10:19)] # remove letters 10 to 19 from this vector



# now let's select more values

x[c(1,2,3)] # you can use a vector to specifiy multiple index locations you want to access

x[seq(1:5)] # you can use a function shortcut to do the same task

x[x>1] # you can also use logical comparisons to subset values. Here we extract all values greater than 1. 




# Before diving into dataframe structures let's get a little more comfortable subsetting 

x <- c(0,0,0,0,0,1,1,0,0,1)

# How can you save the 4th element of x to y
# How can you change the 6th element of x to 0?



# Part 2: Extracting elements with which to identify indices.
x <- c(0,0,0,0,0,1,1,0,0,1)

find_indeces = which(x >0)
extract_the_ones = x[which(x >0)]

