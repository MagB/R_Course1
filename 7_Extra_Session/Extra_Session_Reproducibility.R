##################
# Intro to R extra session
# April 2020
# 1. reproducibility
# 

##################

# Reproducibility 
http://christophergandrud.github.io/RepResR-RStudio/
file:///Users/Maggie/Desktop/ReproducibleResearch_Chapter2.pdf

# p.22 Chapter 2. Reproducible Research with R and RStudio Second Edition

#1. Document everything!
#2. Everything is a (text) file.
#3. All files should be human readable.
#4. Explicitly tie your files together.
#5. Have a plan to organize, store, and make your files available.


# You should record your session info. Many things in R have
# stayed the same since it was introduced in the early 1990s. This makes it easy
# for future researchers to recreate what was done in the past. However, things
# can change from one version of R to another and especially from one version
# of an R package to another. Also, the way R functions and how R packages
# are handled can vary across dierent operating systems, so it’s important to
# note what system you used. Finally, you may have R set to load packages
# by default (see Section 3.1.8 for information about packages). These packages
# might be necessary to run your code, but other people might not know what
# packages and what versions of the packages were loaded from just looking at
# your source code. The sessionInfo command in R prints a record of all of
# these things.




# Print R session info
sessionInfo() # to view what you have loaded along with the versions
writeLines(capture.output(sessionInfo()), "my_session.txt")


# get a list of your full system environment. including paths. 
Sys.getenv()


# Start all scripts with basic info:
##################
# R Source code file used to create Figure 3 in My Article
# Created by Christopher Gandrud
# MIT License
##################
