#############################################################
## Excercise ggplot 
## Intro to R/RStudio Feb 2020
#############################################################



# Part 1. Use the mpg dataset that comes with dplyr for the following exercises. 
# 1. How would you plot the relationship between cty (average city mileage) and hwy
# (average highway mileage)

ggplot(mpg, aes(cty, hwy)) + 
  geom_point()

# 2. colour the points to match the different levels of the variable class
ggplot(mpg, aes(cty, hwy, colour = class)) + 
  geom_point()

# 3. Investigate how the distribution of hwy (average highway mileage) varies with the type of drv (drive train)

# start with looking at one variable at a time
ggplot(mpg, aes(hwy)) + 
  geom_histogram()

ggplot(mpg, aes(drv, hwy)) + 
  geom_boxplot()

# 4. Explore how many records are available for every care manufacturer represented in the dataset
ggplot(mpg, aes(manufacturer)) + 
  geom_bar()

# Part 2. Use the economics dataset to explore the following:
# https://ggplot2.tidyverse.org/reference/economics.html

# 1. Get to know the dataset. How many rows and columns are there?
# What is the class of each variable?

# The economics dataset is comprised of 
dim(economics) #prints rows and columns
str(economics)
class(economics$date)

# date - month of data collection
# psavert - personal savings rate 
# pce -personal consumption expenditures in billions of dollars
# unemploy - number of unemployed in thousands
# unempmed - median duration of unemployment in weeks
# pop total population in thousands. 
head(economics)

# 2. Plot the unemployment rate (# of unemployed / population)
ggplot(economics, aes(date, unemploy / pop)) +
  geom_line()

# OR you can make a new variables 
economics = economics %>% mutate(unemprate = unemploy / pop)

ggplot(economics, aes(date, unemprate)) +
  geom_line()


# 3. Change the theme (visual elements) of the plot 
# Add a title to the plot. Change the x and y axis labels to be Unemployment Rate and Date. 
# 
range(economics$date)
ggplot(economics, aes(date, unemprate)) +
  geom_line() +
  xlab("Date") + 
  ylab("Unemployment Rate") +
  ggtitle("Variability in unemployment rate from 1967 to 2015") +
  theme(panel.background = element_rect(fill = "white",
                                        colour = "black",
                                        size = 0.5, linetype = "solid"))
dev.off()

