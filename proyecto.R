install.packages("tidyverse")

library(tidyverse)
library(readr)
library(dplyr)
library(ggplot2)
library(data.table)

my_data1 <- read.csv('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/TRIPS/Divvy_Trips_2013.csv')
head(df)
my_data2 <- read.csv('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/2020_Q2-divvy-tripdata.csv')
head(df2)


#list_files <-list.files(path='/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/TRIPS')
#list_files

list_files <-list.files(path='/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS')
list_files

# MAKING A DATAFRAME OF ALL THE FILES

raw.files <- tibble(filename = list.files('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/TRIPS'))
raw.files

raw.file.paths <- raw.files  %>%
  mutate(filepath = paste0("/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/TRIPS", filename))
raw.file.paths

raw.data <- raw.file.paths %>%
  rowwise() %>%
  do(., read_csv(file=.$filepath))


# CLEANING FILES

# 2020
datafile1 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',list_files[1]))
datafile2 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',list_files[2]))
datafile3 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',list_files[3]))

datafile <- rbind(datafile1, datafile2, datafile3)
write.csv(datafile,"CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/2020_Q2-divvy-tripdata.csv")

datafile1 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',list_files[4]))
datafile2 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',list_files[5]))
datafile3 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',list_files[6]))

datafile <- rbind(datafile1, datafile2, datafile3)
write.csv(datafile,"CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/2020_Q3-divvy-tripdata.csv")

datafile1 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',list_files[7]))
datafile2 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',list_files[8]))
datafile3 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',list_files[9]))

datafile <- rbind(datafile1, datafile2, datafile3)
write.csv(datafile,"CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/2020_Q4-divvy-tripdata.csv")

#2021
datafile1 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',list_files[10]))
datafile2 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',list_files[11]))
datafile3 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',list_files[12]))

datafile <- rbind(datafile1, datafile2, datafile3)
write.csv(datafile,"CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/2021_Q1-divvy-tripdata.csv")

datafile1 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',list_files[13]))
datafile2 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',list_files[14]))
datafile3 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',list_files[15]))

datafile <- rbind(datafile1, datafile2, datafile3)
write.csv(datafile,"CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/2021_Q2-divvy-tripdata.csv")

datafile1 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',list_files[16]))
datafile2 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',list_files[17]))
datafile3 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',list_files[18]))

datafile <- rbind(datafile1, datafile2, datafile3)
write.csv(datafile,"CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/2021_Q3-divvy-tripdata.csv")

datafile1 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',list_files[19]))
datafile2 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',list_files[20]))
datafile3 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',list_files[21]))

datafile <- rbind(datafile1, datafile2, datafile3)
write.csv(datafile,"CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/2021_Q4-divvy-tripdata.csv")


# 2022
datafile1 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',list_files[22]))
datafile2 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',list_files[23]))
datafile3 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',list_files[24]))

datafile <- rbind(datafile1, datafile2, datafile3)
write.csv(datafile,"CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/2022_Q1-divvy-tripdata.csv")

datafile1 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',list_files[25]))
datafile2 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',list_files[26]))
datafile3 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',list_files[27]))

datafile <- rbind(datafile1, datafile2, datafile3)
write.csv(datafile,"CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/2022_Q2-divvy-tripdata.csv")

datafile1 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',list_files[10]))
datafile2 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',list_files[11]))
datafile3 <- read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',list_files[12]))

datafile <- rbind(datafile1, datafile2, datafile3)
write.csv(datafile,"CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/2022_Q3-divvy-tripdata.csv")

# RENAME THE FIELDS

list_files <- list.files("/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/")
list_files

df<-read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',list_files[1]))
df<-df[-c(1)]
write.csv(df,"/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/2020_Q2-divvy-tripdata.csv",row.names=FALSE)

lapply(list_files, 
      function(x) 
        write.csv(read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',x))[-c(1)],paste0("CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/",x),row.names=FALSE)
      )
