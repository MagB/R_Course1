##################
# Intro to R extra session
# April 2020
# The Cansim packages
# https://cran.r-project.org/web/packages/cansim/index.html
# and packing a direct hit to the API using GET 
# There is also a cancensus package you could check out. 
# https://cran.r-project.org/web/packages/cancensus/index.html

##################

install.packages("R.cache")

library(R.cache)
options(cansim.cache_path="/Users/Maggie/Library/Caches/R/R.cache") 

# this creates the cach directory
#/Users/Maggie/Library/Caches/R/R.cache’
R.cache
getCacheRootPath()
install.packages("cansim")
library(cansim)
options()


list_cansim_tables(refresh=TRUE)
t = search_cansim_tables("housing")



list_cansim_tables(refresh=TRUE)

search_cansim_tables("Immigrant status of residential property owners") # from this table get the product id  46-10-0033

get_cansim_table_overview("46-10-0033") # get an overview of the data

tables_wanted = get_cansim("46-10-0033") # get the published data table



# Other ways to connect to STC data:
# connect to API
install.packages("httr")
#Require the package so you can use it
require("httr")
install.packages("jsonlite")
#Require the package so you can use it
require("jsonlite")

#This specific request downloads the entire table.
Files<-GET("https://www150.statcan.gc.ca/t1/wds/rest/getFullTableDownloadCSV/13100766/en")

#Check the status of the request to ensure it’s worked successfully
http_status(Files)

#Download the file from the link that the Statistics Canada API has generated (this is content(Files)$object).
download.file(content(Files)$object, paste(getwd(),"/","download.zip", sep=""), method="auto", quiet = FALSE) # downloads to root directory of project

#Unzip the file into your directory
unzippedist<-unzip("download.zip", list=TRUE)
outDir<-getwd()
unzip("download.zip", list=FALSE, exdir=outDir)

#Check the names of the files you just unzipped (some zips contain multiple files, metadata csv files, etc.)
unzippedist$Name
#Read the relevant CSV files
stc_data = read.csv(unzippedist$Name[1])
