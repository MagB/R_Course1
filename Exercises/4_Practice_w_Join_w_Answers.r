#############################################################
## Advanced Data Wrangling Merging and Joinging Exercises with Answers.
## Intro to R/RStudio Feb 2020
#############################################################



# LEt's use joins to compare the two  iris datasets that come with base R
# Note that the new iris is saved as an array data type. You can use as.data.frame() function to coerece it into a df structure
iris3_new = as.data.frame(iris3)
iris3_orig = iris

#Can you merge the two datasets on matches with Petal width from the old dataset and match it to Petal width for Virginica and return all rows and columns and return NA where there are no matching values?
# Hint: in R you can merge on variables with diferent names by passing in an equivalency in the by option. 
# e.g., by = c("VAR1_NAME" = "VAR2_NAme")

merge1 = full_join(iris3_orig, iris3_new, by = c("Petal.Width" = "Petal W..Virginica"))


# Can you merge them again but this time only keep columns from the old dataset?

merge2 = semi_join(iris3_orig, iris3_new, by = c("Petal.Width" = "Petal W..Virginica"))


# Try merging them together, but this time keeping all rows from the original dataset and retain all columns from x and y
# Match records on Petal width from the original and the Setosa Width from the new dataset
merge3 = semi_join(iris3_orig, iris3_new, by = c("Petal.Width" = "Petal W..Setosa"))


# What happens if you do a join and forget the by statement?

answer = "You will see in the console below: Joining, by = c('ID', 'Cen_Fname', 'Cen_Mname', 'Cen_Lname', 'cen_fullname', 'cen_address1', 'cen_address2', 'Cen_postal', 'Cen_city', 'Cen_province', 'cen_AR_UID', 'cen_dob', 'Year')"
