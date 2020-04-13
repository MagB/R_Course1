#############################################################
## Basic Calculations in R 
## Intro to R/RStudio Feb 2020
#############################################################


# In this script, we will cover the following:
# Part 1. Arithmetic Operators
# Part 2. Logical Operators
# Part 3. Common constants that are built into R

# Reference material
# https://www.datacamp.com/courses/free-introduction-to-r
# https://www.statmethods.net/management/operators.html



# Part 1. Arithmetic Operators. 
# R can perform all kinds of mathematical calculations.

+ # addition
- # subtraction
* # multiplication
/ # division
^ or ** #exponents
x %/% y # integer division
x %% y # remainder from division

# Let's work out some examples. 

4/5

2 + 5 

2-5

5/2 # normal division

5%/%2 # integer division

5%%2 # remainder

200 ^ 0.5 # squareroot

3+9*2000 # order of operations

log(1) # log functions

exp(0.5) #exponential functions


# Part 2. Logical Operators. 

# R, like any programming language also performs logical comparisons
 == # equal to
< # less than 
<= #less than or equal to
> #greater than
>= # greater than or equal to
!= # not equal to
!x # not x
x | y # x or y
X & y # x and y

isTRUE(x) # test if x is true
        
# Let's work through a few examples     
1 == 4 

"y" == "y"

"y" == "g"

x = c(1:10)
x
x > 8



# Part 3. Common constants that are built into R
pi 
LETTERS
letters
month.abb
month.name



