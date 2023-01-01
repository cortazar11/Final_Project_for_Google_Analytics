install.packages("tidyverse")
install.packages("generics")
install.packages("stringi")
library(tidyverse)
library(readr)
library(dplyr)
library(ggplot2)
library(data.table)
library(lubridate)
library(generics)
library(stringi)

list_files <- list.files("/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA_LAST_12_MONTH", full.names= TRUE)
list_files

my_data <- read_csv("/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA_LAST_12_MONTH//202112-divvy-tripdata.csv")
glimpse(my_data)

result <- lapply(list_files,
                 function(x){
                    df <- read.csv(x)
                    df$month <- x
                    df$month <- stri_replace_all_regex(df$month,
                              pattern=c('/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA_LAST_12_MONTH/', '-divvy-tripdata.csv'),
                                                      replacement=c('', ''),
                                                      vectorize=FALSE)
                    df
                 }
       )
class(result)

df <- do.call(rbind,result)
colnames(df)

df$member_casual <- as.factor(df$member_casual)
df$member_casual
value <- abs(rnorm(12 , 0 , 15))
p <- ggplot(df, aes(fill=member_casual,y=value,x=month )) +
  geom_bar(stat="identity")
p
# df <- list.files(path = "/home/miguel/CURSO_ANALISIS_DATOS/Caso_Práctico/DATA_LAST_12_MONTH", pattern = "*.csv",full.names = TRUE) %>% 
#   map_df(~fread(.))
# glimpse(df)


#########################################################################################################################################
my_data1 <- read_csv('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA2/Divvy_Trips_2013.csv')
my_data1$usertype[my_data1$usertype=="Customer"] <- "casual"
my_data1$usertype[my_data1$usertype=="Subscriber"] <- "member"
write.csv(my_data1,'/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA2/Divvy_Trips_2013.csv',row.names =FALSE)
unique(my_data1$usertype)
my_data1$usertype <- as.factor(my_data1$usertype)
write.csv(my_data1,'/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA2/Divvy_Trips_2013.csv',row.names=FALSE)

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

# Renaming columns
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

# Converting to date type

as.POSIXct(my_data2$starttime, tz = "", format="%m/%d/%Y %H:%M")

lapply(list_files_final[2:16],
                 function(x){
                   my_data <- read_csv(x)
                   my_data$starttime <-as.POSIXct(my_data$starttime, tz = "", format="%m/%d/%Y %H:%M")
                   my_data$stoptime <- as.POSIXct(my_data$stoptime, tz = "", format="%m/%d/%Y %H:%M")
                   write.csv(my_data,x,row.names=FALSE)
                 })

# Class of starttime and stoptime
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


# Data fr from list of files

list_files_final <- list.files(path='/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA2',full.names = TRUE)
list_files_final

starttime_type <- lapply(list_files_final[1],
                         function(x){
                           spec(read_csv(x))
                           
                         }
)

starttime_type

# Converting usertype from character to factor and doing a chartbar.
lapply(list_files_final,
       function(x){
         my_data <- read_csv(x)
         my_data$usertype[my_data$usertype=="Customer"] <- "casual"
         my_data$usertype[my_data$usertype=="Subscriber"] <- "member"
         write.csv(my_data,x,row.names=FALSE)
       })



df <- list.files(path = "/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA2", pattern = "*.csv") %>% 
  map_df(~fread(.))
df
