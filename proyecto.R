install.packages("tidyverse")

library(tidyverse)
library(readr)
library(dplyr)


df <- read.csv('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/202004-divvy-tripdata.csv')
str(df)
list_files <-list.files(path='/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS') 
list_files
months<-substr(list_files,0,6)
months
result <- lapply(list_files, function(x){
      df<-read.csv(paste0('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA/YEARS/',x))
      table(df$member_casual)
      
})
names(result) <- months
class(result)
result$`202005`
