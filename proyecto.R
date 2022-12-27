install.packages("tidyverse")

library(tidyverse)
library(readr)
library(dplyr)
library(ggplot2)
library(data.table)

my_data1 <- read.csv('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/TRIPS/Divvy_Trips_2013.csv')
colnames(my_data1)
my_data2 <- read.csv('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/202210-divvy-tripdata.csv')
colnames(my_data2)


#list_files <-list.files(path='/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/TRIPS')
#list_files
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

# 2014_Q3
datafile1 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/TRIPS/',list_files[3]))
datafile2 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/TRIPS/',list_files[4]))
datafile <- rbind(datafile1, datafile2)
write.csv(datafile,"/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/TRIPS/2014_Q3-divvy-tripdata.csv", row.names=FALSE)



# 2015_Q3
datafile1 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/TRIPS/',list_files[7]))
datafile2 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/TRIPS/',list_files[8]))
datafile3 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/TRIPS/',list_files[9]))
datafile <- rbind(datafile1, datafile2,datafile3)
write.csv(datafile,"/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/TRIPS/2015_Q3-divvy-tripdata.csv", row.names=FALSE)

# 2016_Q2
datafile1 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/TRIPS/',list_files[13]))
datafile2 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/TRIPS/',list_files[14]))
datafile3 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/TRIPS/',list_files[15]))
datafile <- rbind(datafile1, datafile2,datafile3)
write.csv(datafile,"/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/TRIPS/Divvy_Trips_2016_Q2.csv", row.names=FALSE)




# 2020_Q2
datafile1 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',list_files[1]))
datafile2 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',list_files[2]))
datafile3 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',list_files[3]))

datafile <- rbind(datafile1, datafile2, datafile3)
write.csv(datafile,"/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/Divvy_Trips_2020_Q2.csv", row.names=FALSE)

# 2020_Q3
datafile1 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',list_files[4]))
datafile2 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',list_files[5]))
datafile3 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',list_files[6]))

datafile <- rbind(datafile1, datafile2, datafile3)
write.csv(datafile,"/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/Divvy_Trips_2020_Q3.csv", row.names=FALSE)

# 2020_Q4
datafile1 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',list_files[7]))
datafile2 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',list_files[8]))
datafile3 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',list_files[9]))

datafile <- rbind(datafile1, datafile2, datafile3)
write.csv(datafile,"/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/Divvy_Trips_2020_Q4.csv", row.names=FALSE)

# 2021_Q1
datafile1 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',list_files[10]))
datafile2 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',list_files[11]))
datafile3 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',list_files[12]))

datafile <- rbind(datafile1, datafile2, datafile3)
write.csv(datafile,"/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/Divvy_Trips_2021_Q1.csv", row.names=FALSE)
# 2021_Q2
datafile1 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',list_files[13]))
datafile2 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',list_files[14]))
datafile3 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',list_files[15]))

datafile <- rbind(datafile1, datafile2, datafile3)
write.csv(datafile,"/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/Divvy_Trips_2021_Q2.csv", row.names=FALSE)
# 2021_Q3
datafile1 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',list_files[16]))
datafile2 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',list_files[17]))
datafile3 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',list_files[18]))

datafile <- rbind(datafile1, datafile2, datafile3)
write.csv(datafile,"/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/Divvy_Trips_2021_Q3.csv", row.names=FALSE)
# 2021_Q4
datafile1 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',list_files[19]))
datafile2 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',list_files[20]))
datafile3 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',list_files[21]))

datafile <- rbind(datafile1, datafile2, datafile3)
write.csv(datafile,"/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/Divvy_Trips_2021_Q4.csv", row.names=FALSE)

# 2022_Q1
datafile1 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',list_files[22]))
datafile2 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',list_files[23]))
datafile3 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',list_files[24]))

datafile <- rbind(datafile1, datafile2, datafile3)
write.csv(datafile,"/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/Divvy_Trips_2022_Q1.csv", row.names=FALSE)
# 2022_Q2
datafile1 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',list_files[25]))
datafile2 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',list_files[26]))
datafile3 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',list_files[27]))

datafile <- rbind(datafile1, datafile2, datafile3)
write.csv(datafile,"/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/Divvy_Trips_2022_Q2.csv", row.names=FALSE)
# 2022_Q3
datafile1 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',list_files[28]))
datafile2 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',list_files[29]))
datafile3 <- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',list_files[30]))

datafile <- rbind(datafile1, datafile2, datafile3)
write.csv(datafile,"/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/Divvy_Trips_2022_Q3.csv", row.names=FALSE)

list_files_trips <-list.files(path='/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/TRIPS/')
list_files_trips
list_files_years <-list.files(path='/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/')
list_files_years

names_trips <- names(read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/TRIPS/',list_files_trips[1])))
names_trips

names_years <- names(read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',list_files_years[1])))
names_years

# lapply(list_files, 
#       function(x) 
#         write.csv(read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',x))[-c(1)],paste0("CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/",x),row.names=FALSE)
#       )

lapply(list_files_years, 
       function(x) {
         df<- read.csv(paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',x))
         names(df) <- c("trip_id","rideable_type" ,"starttime","stoptime" ,
                        "from_station_name","from_station_id" ,"to_station_name" ,
                        "to_station_id","start_lat" ,"start_lng" ,"end_lat" ,"end_lng",
                        "usertype" )  
         
         write.csv(df,paste0('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA/YEARS/',x),row.names=FALSE)
       }
)

# Data frame from list of files

list_files_final <- list.files(path='/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA2/',full.names=TRUE)
list_files_final

starttime_type <- sapply(list_files_final,
       function(x){
         df <- read.csv(x)
         colnames(df)
          }
       )

starttime_type
df <- list.files(path = '~/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA2/', pattern = '*.csv',full.names=TRUE) %>%
  map_df(~read_csv(.))
head(df)
