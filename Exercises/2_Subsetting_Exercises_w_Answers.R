#############################################################
## Subsetting Exercises with Answers.
## Intro to R/RStudio Feb 2020
#############################################################

## Subsetting Vector Exercise 
# You may find it useful to look at the list of functions in the script called "BaseR_functions" housed in the "Supporting_Info" file folder. 


# Q1. Create a vector consisting of a sequence of numbers ranging from 0 to 10000 with steps every 20
my_vector = seq(0,10000, by = 20)

# Q2. From the vector you created in Q1. extract the 334th element
my_vector[334]

# Q3. From the vector created in Q1, extract 10 elements of your choice
my_vector[c(1,4,5,2,7,17,23,1234,12,222)]
my_vector[rep(1,10)]
my_vector[sample(seq(40,400,10),size=10)]

# Q4. From the following vector extract the last entry
set.seed(2)
vector2= sample(seq(40,10000,1.25),size=2992000, replace = T)
vector2[length(vector2)] 



# Q5. Can you figure out how to make a vector consisting of every third letter in the alphabet?
# Set the values to an object called vector_values
# Hint, start with the build in object LETTERS and apply the seq() function.
vector_values <- LETTERS[seq(1,length(LETTERS),3)]  
