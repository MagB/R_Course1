#############################################################
## Basic Data Visualizations
## Intro to R/RStudio Feb 2020
#############################################################
# https://r4ds.had.co.nz/transform.html#select



#“The simple graph has brought more information to the data analyst’s mind than any other device.” — John Tukey


#  In this section we will explore the plots that are available as part of the base R package.
# These are very handy to use to do quick data exploration. 
# We will explore how to use the ggplot package later in the course to create fully customized, publication quality graphs.

boxplot() # box plot 
hist() # histogram

plot() #basic scatterplot
barplot() # bar plot

pie() # pie chart


# We will use the airquality data set to explore the base R graphs
head(airquality)


# Part 1. Boxplot
# Let's use the boxplot to explore the distribution of values for these variables: Ozone, Solar.R, Wind, Temp
# here we pass in a subsetted dataframe with the 4 columns that we will be plotting. 

boxplot(x =  airquality[,1:4],
        main='Multiple Box plots')


# We can get more specific and look at the breakdown of the distribution of temperature within each month. 
# We can also set the labels and define plot colors. 
boxplot(Temp~Month,
        data=airquality,
        main="Different boxplots for each month",
        xlab="Month Number",
        ylab="Degree Fahrenheit",
        col="orange",
        border="brown"
)

?boxplot # Use the help file to explore all the available arguments. 
# Can you rotate the figure so that the boxplots are horizontal rather than vertical?



# Part 2. Histogram
# With histograms, altering the number of bins is one of the most common things we might want to do.
# the breaks argument allows us to add a number of bins to the plot. 
# LetsZA
hist(airquality$Temp, breaks=4, main="With breaks=4")
hist(airquality$Temp, breaks=20, main="With breaks=20")


# Part 3. Barplot
# Barplots are most often used to show: counts of groups, or point estimates from models along with se or sd bars. 
# Let's find the number of days within each month where daily temperature was greater than 30 C

# First, let's make a new column called TempC to convert the temperature in Farenheit to Celsius

airquality$TempC = (airquality$Temp - 32) * 5/9 

summary(airquality)
table()  #crosstabs

hotday_count = table(airquality$Month[airquality$TempC> 30])
hotday_count

barplot(hotday_count,
        main="Number of days greater than 30C by month",
        xlab="Month Number",
        ylab="Degree Celsius")


# Part 4. Pie charts 
# Although it's generally recommended to avoid pie charts, we can make one for the distribution
# of hot days by month
pie(hotday_count)

?pie


# Part 5. One of the most used and effective visualizations is a simple scatterplot.  
# We will use a scatter plot to evaluate if there is an association between ozone concentrations and temperature. 

plot(x = airquality$TempC, 
        y= airquality$Ozone,
        xlab="Temperature Celsius",
        ylab="Ozone Concentration")


# Because we are analysts, we want to go one step further and perform a simple linear regression to 
# test the hypothesis that there is a relationship between ozone concentration and daily temperature. 
# We can perform a quick simple linear regression fit with least mean squares using the lm() function, which stands for linear model.
# Let's take a moment and just explore the output from the model
ozone_temp_lm = lm(airquality$Ozone~airquality$TempC)
summary(ozone_temp_lm)


plot(x = airquality$TempC, 
        y= airquality$Ozone,
        xlab="Temperature Celsius",
        ylab="Ozone Concentration")

title("The relationship between temperature and ozone")
abline(reg = ozone_temp_lm)
abline( h = mean(airquality$Ozone, na.rm  = T),col="red")
abline( v = mean(airquality$Temp, na.rm  = T),col="blue")
