#############################################################
## Data Types and Assigning Variables 
## Intro to R/RStudio Feb 2020
#############################################################

# So there are four basic types of data in R, 
        # 1) numeric   1 2 3 4 
        # 2) character   "1" "2" "3" "4"
        # 3) logical   TRUE FALSE FALSE FALSE 
        # 4) factor   R's form of categorical data, saves a variable as a set of levels.

# setting variables as factors becomes important for correctly assigning certain types of models. 
# factor data can be a little trickier to work with, so we will focus on the first 3 data types listed above. 

# When you're working with data, you will encounter other types of data that R can handle. 
# R implements these as abstractions of the four basic types. And probably the most common type to encounter 
# are dates and times, or date-time data.



#  All data types in R are treated as objects. Think of objects as containers where you can put any data type and
# when you evaluate that container it gives you the thing you have put there. Let's see if we can put a few numbers, 
# arithmetic and characters in containers and evaluate them.


# For more best practices regarding naming conventions:  https://www.r-bloggers.com/r-code-best-practices/

## 1. Setting a variable 
# Notice that the environment panel on the right side of your screen is updated with variable assignments. 

y =  23  
y <- 23  # many R users prefer this original format for defining variables

## 2. Style for variable/object names.


# In general, you can use any object name you want when you create an object. 
# R recognizes the difference between lower and uppercase letters in variable names. 
# So if you create an object named capital A and an object named lowercase a, R will treat those two objects as different objects. 


# There are some names that are protected by R that you're not going to be able to use. 
# For example, you cannot use names that start with numbers. Numbers can be used within the name. E.g., cattle_data_2019
# You also can't start a variable with a dollar sign, a mathematical operator, or an exclamation mark.

# Many programmers recommend using a particular style for a particular type of object in R. For example, all data file names
# should be lower case with an underscore separator, functions should be defined wiht a period etc. 
# The more consistent you can be with naming conventions the easier it will be to reproduce your work (for yourself and others). 

rstudiointro <- 40      # all lower case
rstudio_intro <- 40     # under_score separator 
rstudio.intro <- 40     # period separator not acceptable in python or SAS
RstudioIntro <- 40      # upper camel case

4rstudiointro <-6  # can't assign to a variable name beginning with a number 

# If you create an object that you want to get rid of, you can remove it from your memory with the rm command.
rm(RstudioIntro) # remove a single object

rm(list = ls()) #remove a whole list of objects, in this case all objects 

# Try the following:

# 1. Assign single values to an object
my_number = 42  # assigning a numerical value
 
my_name = "Maggie"    # assigning a string/character value
my_name = 'Maggie'      # note that R accepts single and double quotations marks interchangeably for variable assignment. 



## 2. Setting vectors/arrays/lists 
# Vectors combine multipe elements into a one dimensional array.
# They are building blocks for more complex data structures

# # In R there are 2 types of vectors: Atomic vectors and Lists
# Atomic vectors of which there are six types::
#        -logical 
#        -numeric (integer, double)
#        -character
#        -complex (useful for advanced mathematical functions, allows for imaginary number operations)
#        -raw (bytes)

# Lists, can mix data types. Lists are sometimes called recursive vectors because lists can contain other lists.
# We will see an example of this at the end of this section. 


# In some programming languages there are very specific differences in the data structure of arrays and vectors. 
# This is beyond the scope of this class. For now, we can use the terms interchangeably. For the bulk of typcial 
# data science work this distinction will not matter. When computational speed becomes a limiting factor, then 
# using the best data structure and type for a particular problem will become important. 



# 2a. setting vectors

# We use the `c` function to combine or concatenate vector elements
# let's create the vector a and assign it the following information

a <- c(1, 2, 3, 4, 5) # vector of numeric values
a
b <- c("January", "February", "March", "April", "May") # vector of character values
b
c <- c("TRUE", "FALSE", "FALSE", "TRUE", "FALSE") # vector of logical values
c

my_word_list = c("one", "two", "buckle", "my", "shoe", 1) #note that with c() R forces all elements to be the same type
my_word_list = c(1, 2,4, 5, "t") #note that with c() R forces all elements to be the same type

my_word_list = list("one", "two", "buckle", "my", "shoe", 1) # use a list to mix and match

length(my_word_list)
class(my_word_list) # find the dominant data type of vector


## 2b. Creating series quickly
        
# If you want to create a vector containing a sequence of numbers, you use the `:` operator


d <- 11:15   #no need for the c function
d <- c(11:15)


# you an also perform the same manipulations on vectors composed of characters:
vector_values <- LETTERS    # creates an object with the letters of the alphabet




### 3. Functions and arguments
        
# Functions are objects which perform specific tasks and arguments control what functions do

# Functions always have open and closed brackets

#We put our arguments inside the brackets
# We can use the seq() and rep() functions to create vectors with many elements quickly.
# the seq() is a sequence function, `

my_series <- seq(1,8) # the sequence function allows you to define the start, stop and frequency of sampling between the start and stop
my_series <- seq(1,8,1) # here <1, 8> are arguments telling the function to generate a sequence of numbers from 1 to 8. 
my_series <- seq(1,8,2) # the last argument tells the function to make a sequence of numbers from 1 to 8 but to take every 2nd element. 

my_repeat <- rep(2, 10) # the repeat function takes two arguments. The first is the item to be repeated, and the second is the number of times you want the element repeated. 

my_randon_sample <- sample(seq(1,100), 2, replace = F) # here we randomly sample 2 values from a list of 1 to 100. we sample without replacement, meaning you cannot select the same number more than once. 

# R has wonderful built-in help. You can seek help in R about the function and the arguments it has just by putting a question mark before the function in question

?seq
?rep
?mean
?sample

# 4. Operations on vectors 
# Some functions can be applied on any type of vector:

# how many words are in my_word_list?
my_word_list = c("one", "two", "buckle", "my", "shoe", 1)

length(my_word_list) # find number of items in vector
nchar(my_word_list)
nchar("this_can_be_long")

# 4a) Operations on vectors composed of numeric values
# If we apply an operation to numerical vector, it will apply to all elements. This is where 
# R deviates from algebra and becomes more programmatic.R uses vectorized operations and 
# performs operations element-wise. This will become a real advantage when we store variables in 
# our vectors. 
# Operations on vectors composed of character values can also be performed. But, we'll see examples of those
# in section 5 below where we explore built-in functions

d <- c(11:15)
a <- c(1:5)

d-2
d*3
a*d


# 4b) Operations on vectors composed of character values

my_letters = c("a", "b", "c", "D")

my_letters = tolower(my_letters)

your_letters = toupper(my_letters) 

my_letters22 = paste("22", my_letters, sep = "-") # joins strings together

all_letters = paste(my_letters,your_letters, sep = "-") # joins strings together


my_word_list = c("one", "two", "buckle", "my", "shoe")

grep("my", my_word_list) # returns index of matching substring
grepl("ne", my_word_list) # returns index of matching substring
my_word_list[grepl("ne", my_word_list)] # 

strsplit("Maggie Bartkowska"," ") #split strings on a character


# 4c. Operations on vectors composed of logical data
# In general performing mathematical operations with TRUE and FALSES doesn't work. 
# But R uses a rule to make it applicable. 
# Because TRUES can convert to 1's through coercion rules and FALSE get converted to 0's, you could actually do math with logicals, 
# R treats TRUEs as 1 and FALSE as 0.

# If I add true plus true, R converts them to numbers so we can do the math, then we get 2. 
# And if I add true plus false, R converts those numbers and get 1 because the false was 0, which means I could run a mathematical function like sum, 
# which calculates the sum of a vector, on the vectors of trues and falses, and it's going to tell me how many trues are in that vector, 
# because each true will show up as a 1 and get added to the sum, and each false will be a 0 and not go to the sum.

logical_vec = c(TRUE, FALSE)

logical_vec2 = c(TRUE, FALSE)

logical_vec2 + logical_vec


# More on lists. 
# Here make a dataframe of two columns "a" and "b", each are numeric. Dataframes like this are a collection of lists.
d <- data.frame(a=11:13, b=21:23)
is.list(d) # TRUE
is.data.frame(d)
str(d)

m <- lm(a ~ b, data=d) # now fit a simple linear regression (or line of best fit) to the relationship between a and b

# In SAS the output of the model can be saved to an object or printed immediately. R is the same. 
# Here we set the results of the linear model to the object m
is.list(m) # TRUE
m # calling m just shows the basic model info. But calling structure on the object m shows you the full scale of model information
# available when fitting a simple linear model.
str(m)

attributes(m$coefficients)
m$coefficients["(Intercept)"]
m$coefficients["b"]

