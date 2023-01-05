install.packages("tidyverse")
install.packages("generics")
install.packages("stringi")
install.packages("descriptr")
install.packages("psych")
install.packages("swirl")
library(tidyverse)
library(readr)
library(dplyr)
library(ggplot2)
library(data.table)
library(lubridate)
library(generics)
library(stringi)
library(descriptr)
library(psych)
library(swirl)

list_files <- list.files("/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA_12MONTHS", full.names= TRUE)
list_files



result <- lapply(list_files,
                 function(x){
                   df <- read_csv(x)
                   df$month <- x
                   df$month <- stri_replace_all_regex(df$month,
                                                      pattern=c('/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA_12MONTHS/', '-divvy-tripdata.csv','-divvy-publictripdata.csv'),
                                                      replacement=c('', '', '' ),
                                                      vectorize=FALSE)
                   df$diff <- df$ended_at - df$started_at
                   df$diff_double <- as.double(df$diff, units="auto")
                   df$diff_format <- hms::hms(seconds_to_period(df$diff))
                   df
                 }
)
class(result)

# Single and final Data Frame
df <- do.call(rbind,result)




colnames(df)
ds_screener(df)
glimpse(df)
range(df$diff_double, na.rm = FALSE)
sum(sign(df$diff_double)==0)
sum(sign(df$diff_double)==-1)
mean(df)
diff_num[1:10]

# Subsetting the data frame.
df <- subset(df, !sign(df$diff_double)==-1)
df <- subset(df, !sign(df$diff_double)==0)

df$member_casual <- as.factor(df$member_casual)
df$rideable_type <- as.factor(df$rideable_type)

# Statistics by month
stats_by_month <- describeBy(df$diff_double, df$month, mat = TRUE) 
stats_by_month


# The median grouping by month and member_casual
stats_by_month_by_membercasual <- describeBy(df$diff_double, list(df$month, df$member_casual), mat = TRUE)
stats_by_month_by_membercasual
p <- ggplot(stats_by_month, aes(y=mean,x=group1 )) +
  geom_point()
p 

q <- ggplot(stats_by_month_by_membercasual,aes(x = group1,
                                               y = mean,
                                               group = group2)) +
  geom_line(aes(col = group2)) +
  geom_point()
q

# Relation between member_casual and diff_double
