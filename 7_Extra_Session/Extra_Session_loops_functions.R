##################
# Intro to R extra session
# April 2020
# Loops and Functions
# 

##################

#Learn and practice Loops 
#https://www.datacamp.com/community/tutorials/tutorial-on-loops-in-r
# also see loops on swirl

# The most basic loop
list_of_cats = c("mini", "max", "fluffy", "furry")

for(i in list_of_cats){
  print(i)
}

# The most basic loop
list_of_cats = c("mini", "max", "fluffy", "furry","mini")

for(i in unique(list_of_cats)){
  counts = length(list_of_cats[grep(i,list_of_cats)])
  print(paste(counts,i ))
}




# Fast and ugly way to search through all your files. 

path = "Exercises/"
out.file<-""
file.names <- dir(path, pattern =".csv")


for(i in 1:length(file.names)){
  print(i)
  file <- read.table(file.names[i],header=TRUE, sep=",", stringsAsFactors=FALSE)
  # do something to the file
  # I use this to search for matching strings in columns or colnames
  if(length(grep("name",colnames(file))) > 0){
    print(paste("This file has that columns: ",file.names[i]))
    }
   
  # Or you can append a bunch of files together provided they have same shape so that binding makes sense
  # out.file <- rbind(out.file, file)
}
write.table(out.file, file = "binded_files.txt",sep=";", 
  row.names = FALSE, qmethod = "double")


# Functions
# Interactive training functions
# https://campus.datacamp.com/courses/introduction-to-writing-functions-in-r/how-to-write-a-function?ex=1


# https://www.statmethods.net/management/userfunctions.html


fahrenheit_to_celsius <- function(temp_F) {
  temp_C <- (temp_F - 32) * 5 / 9
  return(temp_C)
}

fahrenheit_to_celsius(32)

library(dplyr)
  
airquality = airquality %>% mutate(TempC = fahrenheit_to_celsius(Temp)) # now use your own function coupled with mutate. 

airquality %>% fahrenheit_to_celsius() # apply the function to entire df

