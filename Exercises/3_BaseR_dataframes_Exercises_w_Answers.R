#############################################################
## Data frame Exercise (baseR) with Answers.
## Intro to R/RStudio Feb 2020
#############################################################
#### Modified from a gitlab PPD page: ####
#### Title: Answers to fun problems for learning R ####
#  Steve Martin -PPD
# Feb 2020
#############################################################


#1. Importing data
# load the data set "my_df.csv" into your environment. 
# this file is housed in this exerise folder

# load the data set "my_df.csv" into your environment. 
# this file is housed in this exerise folder
# you could also use the point and click method by pulling down the Tools menu and choose Import Data sets. 
# Note this only works for 
my_df = read.csv("Exercises/my_df.csv", header = T, stringsAsFactors = F, strip.white = T)



##2.  Creating a dataset
# Create a data frame with the following three variables.
## A variable called x with the numbers 1 to 10.
## A variable called y with the last ten letters of the alphabet, in upper case and formatted as text/character.
# (Hint: don't write out the letters of the alphabet.)
## A variable called y2 that alternates between the numbers 1 and 2. (This is not a typo.)

# the I function protects y from being turned into a factor in the data.frame function
q3 <- data.frame(x = 1:10,
  y = I(LETTERS[-(1:16)]),
  y2 = 1:2
)

q3 <- data.frame(x = seq(10),
  y = I(LETTERS[17:26]),
  y2 = 1:2                 )

# setting stringsAsFactors = FALSE stops all character vectors from being turned into factors
q3 <- data.frame(x = 1:10,
  y = LETTERS[-(1:16)],
  y2 = 1:2,
  stringsAsFactors = FALSE
)


  
#3.  Sorting a dataset
## Create a new dataset that sorts the mtcars dataset (this is a built in dataset part of base R) 
# in decreasing order of cyl, increasing order of gear, and decreasing order of hp.
# Hint: we did not explicitly review how to use baseR to sort, check out https://www.statmethods.net/management/sorting.html


# the trick for this question is mixing ascending and descending orders in the order
# function using math
q4 <- mtcars[order(mtcars$cyl, -mtcars$gear, mtcars$hp, decreasing = TRUE), ]

q4 <- mtcars[order(-mtcars$cyl, mtcars$gear, -mtcars$hp), ]


# As a comparison, here is how this would like using  dplyr. This makes the code  a bit more human reader friendly. 
q4 <- arrange(mtcars, desc(cyl), gear, desc(hp))

# a little clearer with pipes
q4 <- mtcars %>% arrange(desc(cyl), gear, desc(hp))




#4.   Selecting rows
## Create a new dataset that that keeps only the first 3 rows and the rows for Toyotas from the mtcars dataset. 
# (Hint: you don't need to know which rows have Toyotas to answer this question.)
# make a new column called 'model', find the index positions of Toyota and then make a vector with the positions you are pulling out of mtcars
mtcars$model = row.names(mtcars) 
toyota_positions = which(grepl('toyota', mtcars$model, ignore.case = TRUE))
first_3_rows = seq(1,3)
all_positions = c(first_3_rows,toyota_positions)
q5 <- mtcars[all_positions,  ]

# use the seq function
q5 <- mtcars[seq(nrow(mtcars)) %in% 1:3 |
    grepl('toyota', row.names(mtcars), ignore.case = TRUE),
  ]


#  indexing by position with grep rather than with a logical vector
q5 <- mtcars[c(1:3, grep('toyota', row.names(mtcars), ignore.case = TRUE)), ]


# it's a good idea to make sure rows don't get duplicated when indexing by position, though
q5 <- mtcars[unique(c(1:3, grep('toyota', row.names(mtcars), ignore.case = TRUE))), ]


# we didn't cover this specifically in lecture, but you can check out teh subset function. 
# See this documentation for info:https://www.statmethods.net/management/subset.html
# subset needs a logical vector though 
q5 <- subset(mtcars,
  seq_len(nrow(mtcars)) %in% 1:3 |
    grepl('toyota', row.names(mtcars), ignore.case = TRUE)
)

# For comparison, here a dplyr way 
q5 <- mtcars %>% filter(
  seq_len(nrow(mtcars)) %in% 1:3 |
    grepl('toyota', row.names(mtcars), ignore.case = TRUE)
)

# a little clearer with pipes
q5 <- mtcars %>%
  filter(seq_len(nrow(mtcars)) %in% 1:3 |
      grepl('toyota', row.names(mtcars), ignore.case = TRUE)
  )





#5. Selecting columns and rows
#Create a new dataset that drops all the columns except mpg and carb and drops the first 10 rows from the mtcars dataset.
new_mt_cars = mtcars[11:nrow(mtcars),c("mpg", "carb")]
new_mt_cars = mtcars[-seq(1,10),c("mpg", "carb")]


#6. Appending datasets
#Create a new dataset with duplicate entries for the first and last rows of mtcars by appending these rows of mtcars onto itself. 
# Hint: cbind and rbind functions allow you to column bind and row bind data in baseR 
# check out this source for examples and explanation:
# http://www.datasciencemadesimple.com/cbind-in-r/
first_row_dup  = mtcars[1,]
last_row_dup  = mtcars[nrow(mtcars),]
last_row_dup  = mtcars[dim(mtcars)[1],] # here we get the number of rows from the first element of the dimensions of the data set

dup_data = rbind(mtcars,first_row_dup,last_row_dup)

#7. Creating a new variable
# Create a new variable in mtcars called x that is the sum of mpg and disp

dup_data$x = dup_data$mpg + dup_data$disp



#8. Filtering a dataset
#Using the mtcars dataset, keep only the records with mpg greater than or equal to 15 and carb strictly less than 8.

mpg_15ormore = mtcars[mtcars$mpg >= 15 & mtcars$carb < 8 ,]




# Francais
# 1. Importer le fichier csv "my_df.csv"

#2. Exportation des données
# Écrivez l'ensemble de données importé à la question 1 sous la forme d'un csv. Assurez-vous que seules les trois colonnes sont écrites, avec leur nouveau nom.
#Création d’un ensemble de données
#Créez un cadre de données avec les trois variables suivantes.
#Variable nommée x avec les nombres de 1 à 10.
#Variable nommé y avec les dix dernières lettres de l'alphabet, en majuscules et formatée en texte/caractère. (Indice : n'écrivez pas les lettres de l'alphabet.)
#Variable appelée y qui alterne entre les nombres 1 et 2. (Ceci n'est pas une faute de frappe.)

#3. Tri d'un ensemble de données
# Créez un nouvel ensemble de données qui trie l'ensemble de données mtcars par ordre décroissant de cyl, ordre croissant de gear et ordre décroissant de hp.
# Indice: regarder le fonction order ici  https://www.statmethods.net/management/sorting.html


#4. Sélection des rangées
#Créez un nouvel ensemble de données qui ne conserve que les 3 premières rangées et les rangées pour Toyota provenant de l'ensemble de données mtcars. 
# (Indice : vous n'avez pas besoin de savoir quelles rangées ont des Toyota pour répondre à cette question.)
# Indice: regarder le fonction subset ici https://www.statmethods.net/management/subset.html



#5. Sélection des colonnes et des rangées
# Créez un nouvel ensemble de données qui supprime toutes les colonnes sauf mpg et qui supprime les 10 premières rangées de l'ensemble de données mtcars.


# 6. Ajout d'ensembles de données
# Créez un nouvel ensemble de données avec des entrées dupliquées pour la première et la dernière rangée de mtcars 


#7. Création d’une nouvelle variable
#Créer une nouvelle variable dans mtcars nommée x qui est la somme de mpg et disp.




#8. Filtrer un ensemble de données
#En utilisant les données de mtcars, ne conservez que les enregistrements pour lesquels mpg est supérieur ou égal à 15 et où carb strictement inférieur à 8.
