#############################################################
## Installing R Packages
## Intro to R/RStudio Feb 2020
#############################################################



# R packages are collections of functions and data sets developed by the open source community.
# They basically extend the functionality of R by enhancing existing functions or or adding new ones. 
# For example, if you are usually working with data frames, probably
# you will have heard about dplyr or data.table, two of the most popular R packages.

# Outside STATCAN  you would do the following:
# Go to the CRAN site and follow download instructions from CRAN (Comprehensive R Archive Network) 
https://cran.r-project.org/

# Install using the `install.packages()` function. The name of the package is the argument
install.packages("dplyr") # in parenthesis
library(dplyr) # without parenthesis this time


# At STATCAN there is the R/Python Community of Practice and User Group. You can find helpful information on their conlfuence site on NEtA:
https://confluence.statcan.ca/pages/viewpage.action?pageId=439556887    

# There are 2 options for accesssing libraries At STATCAN:

#############################################################
# Option 1 - Preferred: download R packages through a package manager called Artifactory (see the confluence help pages on this topic).# The following
#############################################################


# instructions are taken directly from the conlfuence site.
# Before making your Rprofile file (outlined below) check what version of R you are running by typing:

R.version
# Make sure the vesion of R you are running matches that stated in the Sys.setenv statement in the Rprofile. 


# Step 1: Make an .Rprofile file 

# Make a .Rprofile file in your documents folder. This is usually somewhere like \\stchsfs\jensjas$\Profile-Data\Documents or F:\Profile-Data\Documents.

# To do this, open Notepad++, create a new file, then save it. In the save dialog, se the extension type to "All types (*.*)" and then type ".Rprofile" (without the quotes) as the file name.

# Use the following as the contents.

# Copy starting here 
## set packages repo
options(repos = c(CRAN="https://f3eaipitcat12.statcan.ca:8443/artifactory/cran"))

## set package install directory
Sys.setenv(R_LIBS_USER = "F:/config/R/win-library/3.5/library")

## make sure that packages get installed there
invisible(.libPaths(c(unlist(strsplit(Sys.getenv("R_LIBS"), ";")),
                      unlist(strsplit(Sys.getenv("R_LIBS_USER"), ";"))
)))

#Be sure to change the name at the bottom. You can also change the install directory if you wish.
# End copying here


# Step 2. 

# Start RStudio and go to Tools → Global Options. In the General tab change your default working directory to your Documents folder. Usually something like F:/Profile-Data/Documents. 
# The default "~" address resolves to a UNC address, which can again cause problems with some package installs when run scripts through cmd.exe. Any folder you can find via the browse button should work equally well.

#Note: This path appears to reset when your instance restarts. You will have to change this option every time you start R (and intend to install packages).


# Step 3. Checking that it works

# To ensure the profile is loaded you should see a message like this when starting up your R session:
  
  **** Loaded .Rprofile for Jason Jensen ****
  
  
  
#You can furthermore test that the setting have loaded correctly with the .LibPaths() command or an install.packages() command. Here are some examples:
  
  
.libPaths()
[1] "F:/config/R/win-library/3.5"        "C:/Program Files/R/R-3.5.3/library"


install.packages("fs")


#############################################################
# Option 2 directly download from repo folder at fld6filer
#############################################################
# Navigage to the new folder:
"//fld6filer/packagerepo-depotprogiciel/miniCRAN/bin/windows/contrib/"

# Now use this line to install the package you want. Make sure the version of R matches the one you are running. 
install.packages("//fld6filer/packagerepo-depotprogiciel/miniCRAN/bin/windows/contrib/3.4/installr_0.20.0.zip", repos = NULL, type = "win.binary",dependencies = TRUE)


#############################################################
# For project managers:
#############################################################
# As with any software, it is very important to note the version you are running. The same goes for SAS.
# Features or even syntax can change between versions. For those deploying a full production environment, you should consider creating a docker environment or 
# some other process to ensure that the code you write today can always work. 
# Changes in modern programming systems tend to be back-compatible, but relying on that is not a safe bet. 

# IT is highly recommended that you save the session information for each project. This will output a list of R and library versions that were used in the project. 
# I recommend that in your project folder, you always save a list of the session info as a simple text file. 
# This will help ensure whoever picks up the project (whether it is s colleague or your future self) knows exactly what environment
# was in place when the project was created. 


sessionInfo() # to view what you have loaded along with the versions
writeLines(capture.output(sessionInfo()), "my_session.txt")

