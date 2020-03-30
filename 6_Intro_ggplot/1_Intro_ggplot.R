#############################################################
## Getting Started with ggplot 
## Intro to R/RStudio Feb 2020
#############################################################
# Resources:
# https://ggplot2-book.org/

library(ggplot2)
library(dplyr) #mpg is a data set within dplyr

# We will start by using the mpg (miles per gallon) dataset that is builtin to the ggplot package. 

head(mpg)
unique(mpg$class)

# Variable description:
# cty: miles per gallon in city driving
# hwy: miles per gallon highway driving
# displ: engine displacement in Litres.

# drv: drivetrain
        # with 3 levels: f -front wheel, r-rear wheel,or 4-four wheel.

# model: model of car. 
        # 38 levels

#class: “type” of car e.g., two seater, SUV, compact, etc.      
        # 7 levels


# Every ggplot figure has 3 components:
        ## 1. data: defining the source data set 
        ## 2. aesthetic mapping: basically defines which variables from the dataset that will be visualized
        ## 3. layers: these define what you want the plot to look like. All ggplots have to have at least 
                ## one layer that is defined with the geom function, which defines the type of graph (i.e., boxplot, scatter etc).
                ## Other layers can customize labels, background, legends, colours, annotation etc. 

# Part 1. A simple scatter plot
ggplot(data = mpg, aes(x = displ, y = hwy)) +  # the first argument is the data, the aes() -aesthetic function defines the x and y variables in the plot
        geom_point()       # the geom layer here defines that we want to plot points (scatter plot)

# It is also common to see "lazy" assignment. In this case you can drop the explicit data = and variable = notation

ggplot(mpg, aes(displ, hwy)) +
        geom_point() 

# Part 2. Plot geoms.
# There are several geom functions.These are listed below. 

# We will focus on a few of these as we explore how to customize our plots. 


# geom_point() :scatter plot
# geom_smooth() : fits a smoother (this is a trend line through the point) to the data and its standard error
# geom_jitter() : jitters points to reduce overlap of distinct dots 
# geom_boxplot() : boxplot displaying quantiles etc. 
# geom_violin :  
# geom_histogram() : 
# geom_freqpoly() :
# geom_density()
# geom_bar()
# geom_path()
# geom_line()



ggplot(mpg, aes(displ, hwy)) +
        geom_line() 

# Here let's plot the relationship between displacement and miles per gallon on highways and plot the 
# linear model for this relationship (fit with the least square means)
# It's also possible to fit linear models with robust fitting algorithms and gam models (generalized additive models). But to do 
# so you need to load the particular packages that can perform those specific statistical fitting procedures i.e., MASS and mgcv package

ggplot(mpg, aes(displ, hwy)) + 
        geom_point() + 
        geom_smooth(method  = "lm")


ggplot(mpg, aes(hwy)) + geom_histogram() # this is the distribution of miles per gallon for highway driving 

ggplot(mpg, aes(hwy)) + geom_histogram() + stat_bin(bins = 45) # we can add another layer to increase the number of bins. 


# Part 3. Customizing labels and colours

# Let's start with setting a title and axis titles.
hwy_cty = ggplot(mpg, aes(cty, hwy)) +
        geom_point() +
        ggtitle("Relationship between city and highway mileage", subtitle = "subtitle") +
        xlab("city driving (mpg)") + 
        ylab("highway driving (mpg)") 

# Customizing colour, shape and size of points:
ggplot(mpg, aes(displ, hwy)) + geom_point(colour = "blue") #sets point colours
ggplot(mpg, aes(displ, hwy)) + geom_point(shape = 9) #sets shapes. change the value of shape to explore options. 
ggplot(mpg, aes(displ, hwy)) + geom_point(size = 1.2) #sets size

# Adjusting colour, shape and size by level of a variable

ggplot(mpg, aes(displ, hwy, colour = class)) + geom_point() # set colour by levels of a variable
ggplot(mpg, aes(displ, hwy, colour = class, shape = drv)) + geom_point() # set shape by levels of a variable
ggplot(mpg, aes(displ, hwy, size = cyl)) + geom_point()# or adjust point size





# Part 4. Themes: There are a number of set themes you can call, or you can define your own. 
# Predefined themes are found here: https://ggplot2.tidyverse.org/reference/ggtheme.html 
# How to customize theme elements: https://ggplot2.tidyverse.org/reference/theme.html

# Here are two common and very useful predefined themes:

hwy_cty + theme_bw()
hwy_cty + theme_classic()

# Let's look at how to customize the theme elements
hwy_cty +
        theme(panel.background = element_rect(fill = "purple", colour = "grey50"), 
                panel.grid.major.y = element_blank(), 
                plot.background = element_rect(fill = "green"),
                plot.title = element_text(color="red", size=14, face="bold",hjust = 0.5), 
               plot.subtitle = element_text(color="purple", size=14, face="bold.italic",hjust = 0.5),
                axis.title.x = element_text(color="blue", size=14, face="bold"), 
                axis.title.y = element_text(color="#993333", size=14, face="bold"))

dev.off()

# Part 5. Multi-panel plots: Facetting
# Facetting creates tables of graphics by splitting the data into subsets and displaying the same graph for each subset. 
# There are two types of facetting: grid and wrapped. 
# Grid splits the plot into columns for each level of the facetting variable 
# Wrap, will make different panels for each plot and these can be shown across multiple rows and columns. 


# To facet a plot you simply add a facetting specification with facet_wrap(), which takes the name of a variable preceded by ~.

ggplot(mpg, aes(displ, hwy)) + 
        geom_point() + 
        facet_wrap(~class, nrow = 2)

ggplot(mpg, aes(displ, hwy)) + 
        geom_point() + 
        facet_grid(~class)



