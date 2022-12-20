install.packages("tidyverse")

library(tidyverse)
library(readr)
library(dplyr)
library(ggplot2)
library(data.table)

# df <- read.csv('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/202004-divvy-tripdata.csv')
# str(df)
# list_files <-list.files(path='/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS') 
# list_files
# months<-substr(list_files,0,6)
# months
# result <- lapply(list_files, function(x){
#       df<-read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',x))
#       class(df)
#       #table(df$member_casual)
#       
# })
# 
# names(df) <- months
# ggplot(data=df,aes(x=result$`202005`))+geom_bar()

list_files <-list.files(path='/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/TRIPS')
list_files
# Concatenar ficheros para generar uno único del tercer trimestre de 2014
datafile1 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/TRIPS/',list_files[6]))
datafile2 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/TRIPS/',list_files[7]))
datafile <- rbind(datafile1, datafile2)
write.csv(datafile,"CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/TRIPS/Divvy_Trips_2014_Q3.csv")

# Concatenar ficheros para generar un único del tercer trimestre de 2015

datafile1 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/TRIPS/',list_files[9]))
datafile2 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/TRIPS/',list_files[10]))
datafile3 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/TRIPS/',list_files[11]))

datafile <- rbind(datafile1, datafile2, datafile3)
dim(datafile)
write.csv(datafile,"CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/TRIPS/Divvy_Trips_2015_Q3.csv")

# Concatenar ficheros para generar un único del segundo trimestre de 2015
