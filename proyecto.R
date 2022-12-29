library(tidyverse)
library(readr)
library(dplyr)
library(ggplot2)
library(data.table)
library(lubridate)

my_data1 <- read_csv('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA2/Divvy_Trips_2013.csv')
class(my_data1$starttime)
my_data2 <- read_csv('CURSO_DATA_ANALYSIS/Caso_Práctico/DATA2/Divvy_Trips_2014_A_Q1Q2.csv')
my_data2$starttime[1]

as.POSIXct(my_data2$starttime, tz = "", format="%m/%d/%Y %H:%M")

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

lapply(list_files_final[23:24],
          function(x) {
                my_data <-read_csv(x)
                names(my_data)[names(my_data) == "start_time"] <- "starttime"
                names(my_data)[names(my_data) == "end_time"] <- "stoptime"
                write.csv(my_data,x,row.names=FALSE)
          }
       )

lapply(list_files_final[22],
        function(x) {
          my_data <- read_csv(x)
          names(my_data) <- c("trip_id","starttime", "stoptime", "bikeid", "tripduration", "from_station_id", "from_station_name",
                              "to_station_id", "to_station_name", "usertype", "gender", "birthyear")
          write.csv(my_data,x,row.names=FALSE)
        }
       )

as.POSIXct(my_data2$starttime, tz = "", format="%m/%d/%Y %H:%M")

lapply(list_files_final[2:16],
                 function(x){
                   my_data <- read_csv(x)
                   as.POSIXct(my_data$starttime, tz = "", format="%m/%d/%Y %H:%M")
                   as.POSIXct(my_data$stoptime, tz = "", format="%m/%d/%Y %H:%M")
                 })

result <- lapply(list_files_final,
       function(x){
         my_data <- read_csv(x)
         class(my_data$starttime)
         class(my_data$stoptime)
       })
result

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

list_files_final <- list.files(path='/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA2',full.names = TRUE)
list_files_final

starttime_type <- lapply(list_files_final,
                         function(x){
                           spec(read_csv(x))
                           
                         }
)

starttime_type

df <- list.files(path = "/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA2", pattern = "*.csv") %>% 
  map_df(~fread(.))
df
