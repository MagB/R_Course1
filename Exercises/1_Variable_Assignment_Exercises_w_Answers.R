#############################################################
## Variable Assignment Exercises with Answers.
## Intro to R/RStudio Feb 2020
#############################################################

# Q1. Which of the following are NOT a valid R variable name?
# A: _age and 2ligit2quit  and ?toads. Notice that RStudio indicates a problem on the line number

min_weight
max_length
_age
?toads
mass
celsius2kelvin
2ligit2quit

# Q2. Assign your name to an object
my_name = "Maggie Bartkowska"
my_name <- "Maggie's need for coffee is"



#  Q3. Can you add your name to the following list of names?
my_name = "Maggie"
name_lst  = c("Tristan  Garry", "Rory McGregor", "Francine Adobo")
name_lst = c(name_lst, my_name)


#  Q4. Count the number of names
# A. now there should be 4 names
length(name_lst)
nchar(name_lst)







#  Q5. Calculate the mean and range of the following set of numbers:

my_nums  = c(5,5,6,2,1,6,3,33)
mean(my_nums)
range(my_nums)
min(my_nums)
max(my_nums)
range(my_nums)[2]

# Q6. The equation of a line is y = bx + e. A: 205.692
# Calculate the value of y in the following regression equation:

b <- 8.4
x <- 24.33
e <- 1.32
y = b*x + e

