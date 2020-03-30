#############################################################
## Useful Built-in Functions and Constants in Base R
## Intro to R/RStudio Feb 2020
#############################################################

#Constants built into R. R has a small number of built-in constants.

LETTERS
letters
month.abb
month.name
pi

# Use ?function_name to immediately get documentation on the function. 
# Each help page is broken down into sections:
# Description: An extended description of what the function does.
# Usage: The arguments of the function and their default values.
# Arguments: An explanation of the data each argument is expecting.
# Details: Any important details to be aware of.
# Value: The data the function returns.
# See Also: Any related functions you might find useful.
# Examples: Some examples for how to use the function.
?mean

# https://www.statmethods.net/management/functions.html
# Basic string manipulations
str1 = "one"
str2 = "two"

x = c("a", "b", "v")
y = c("1", "2", "3")

paste(str1, str2, sep = '_')  # join strings togetherWorldPhones
paste(x, y, sep = '_')  # join elements of vectors together

paste(x, collapse = ' ') Join elements of a vector together.



grep("a", x) #Find regular expression matches in x.
grepl("a", x) #Find regular expression matches in x.

gsub("a", "my_change", x) #Replace matches in x with a string.

toupper(x) #Convert to uppercase.
tolower(x) #Convert to lowercase.
nchar(x) #Number of characters in a string. 


myname = "Maggie"
strsplit(myname, "")	#Split the elements of character vector x at split.

myname = "Magdalena Bartkowska"
l = strsplit(myname, " ") #returns a list with 1 vector element
class(l)
l[[1]][2] # accesses first element of list and second element of the vector
unlist(l)



# Creating vectors
seq(2, 3, by=0.5) #2.0 2.5 3.0 A complex sequence
rep(1:2, times=3) #1 2 1 2 1 2 Repeat a vector - this is the default behaviour
rep(1:2, each=3) #1 1 1 2 2 2 Repeat elements of a vector 

# Math functions
x <- c(6,8,8,4,2,8,9,6)
y <- x*3

sin(x)
log(x) # Natural log. 
sum(x) # Sum.
exp(x) # Exponential. 
mean(x) # Mean.

median(x) # Median.
sqrt(x) # square root

max(x) # Largest element. 
min(x) # Smallest element. 
range(x) # prints the min and max of list

quantile(x) # Percentage quantiles.
quantile(x, 0.15) # Percentage quantiles.

n <- 1
round(x, n) # Round to n decimalplaces.
rank(x) # Rank of elements.

var(x) # The variance.
cor(x, y) # Correlation. 
sd(x) # The standarddeviation.


# distributons
n <- 1
rnorm(n, m=0,sd=1) # n samples from random normal distribution with mean m and standard deviation sd.
rnorm(50, m=50, sd=10) #50 random normal variates with mean=50, sd=10


#base plotting
x <- c(6,8,8,4,2,8,9,6)
plot(x) 
plot(x,y) 

hist(x)

# sampling observations
sample(seq(40,400,10),size=10, replace = T)




?base()
