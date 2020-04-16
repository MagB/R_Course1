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


##2.  Creating a dataset
# Create a data frame with the following three variables.
## A variable called x with the numbers 1 to 10.
## A variable called y with the last ten letters of the alphabet, in upper case and formatted as text/character.
# (Hint: don't write out the letters of the alphabet.)
## A variable called y that alternates between the numbers 1 and 2. (This is not a typo.)


  
#3.  Sorting a dataset
## Create a new dataset that sorts the mtcars dataset (this is a built in dataset part of base R) 
# in decreasing order of cyl, increasing order of gear, and decreasing order of hp.
# Hint: we did not explicitly review how to use baseR to sort, check out https://www.statmethods.net/management/sorting.html


#4.   Selecting rows
## Create a new dataset that that keeps only the first 3 rows and the rows for Toyotas from the mtcars dataset. 
# (Hint: you don't need to know which rows have Toyotas to answer this question.)



#5. Selecting columns and rows
#Create a new dataset that drops all the columns except mpg and drops the first 10 rows from the mtcars dataset.



#6. Appending datasets
#Create a new dataset with duplicate entries for the first and last rows of mtcars by appending these rows of mtcars onto itself. 
# Make sure the duplicated rows appear next to the original rows.
# Hint: cbind and rbind functions allow you to column bind and row bind data in baseR 
# check out this source for examples and explanation:
# http://www.datasciencemadesimple.com/cbind-in-r/


#7. Creating a new variable
# Create a new variable in mtcars called x that is the sum of mpg and disp if the transmission is automatic, and is the sum of mpg and cyl if the transmission is manual.

mtcars



#8. Filtering a dataset
#Using the mtcars dataset, keep only the records with mpg greater than or equal to 15, carb strictly less than 8, and dist equal to 2.


# Bonus
# Using the warpbreaks dataset, create a data frame that gives the modal number of breaks by wool type and level of tension. 
# (Hint: this question requires something not found in base R.)
warpbreaks
?mode


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


#4. Sélection des rangées
#Créez un nouvel ensemble de données qui ne conserve que les 3 premières rangées et les rangées pour Toyota provenant de l'ensemble de données mtcars. (Indice : vous n'avez pas besoin de savoir quelles rangées ont des Toyota pour répondre à cette question.)

#5. Sélection des colonnes et des rangées
Créez un nouvel ensemble de données qui supprime toutes les colonnes sauf mpg et qui supprime les 10 premières rangées de l'ensemble de données mtcars.


# 6. Ajout d'ensembles de données
Créez un nouvel ensemble de données avec des entrées dupliquées pour la première et la dernière rangée de mtcars en ajoutant ces rangées de mtcars dans le même fichier. Assurez-vous que les rangées dupliquées apparaissent à côté des rangées d'origine.

#7. Création d’une nouvelle variable
#Créer une nouvelle variable dans mtcars nommée x qui est la somme de mpg et disp si la transmission est automatique, et la somme de mpg et cyl si la transmission est manuelle.


#8. Regroupement des ensembles de données
#Regrouper mtcars avec cars en tant qu’un regroupement de gauche, en utilisant la variable carb dans mtcars et la variable speed dans cars comme clés.


#8. Filtrer un ensemble de données
#En utilisant les données de mtcars, ne conservez que les enregistrements pour lesquels mpg est supérieur ou égal à 15, où carb strictement inférieur à 8, et où dist est égal à 2.

#Boni
#À l'aide de l'ensemble de données warpbreaks, créez une base de données qui donne le nombre modal de cassures par type de laine et par niveau de tension. (Indice : cette question nécessite quelque chose qui ne se trouve pas dans R de base.)