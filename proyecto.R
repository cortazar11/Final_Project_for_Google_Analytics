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

my_data <- read_csv("/home/miguel/CURSO_DATA_ANALYSIS/Caso_Práctico/DATA_12MONTHS/202112-divvy-tripdata.csv")
glimpse(my_data)

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
result
# Grouping by month and member_casual
df$member_casual <- as.factor(df$member_casual)
by_month_member <- df %>%
              group_by(month) %>%
              count(member_casual)
by_month_member

p <- ggplot(by_month, aes(fill=member_casual,y=n,x=month )) +
  geom_bar(position="dodge",stat="identity")
p

# Grouping by month the time is used
typeof(df$diff_double)
class(df$diff_double)
e
typeof(df$diff)
sapply(df$diff_double, mean, na.rm=TRUE)

df <- subset(df, !sign(df$diff_double)==-1)
df <- subset(df, !sign(df$diff_double)==0)
count(df)
by_month <- df %>%
              group_by(month) %>%
              #summarise_at(vars(diff_double), list(name = mean))
                      
by_month

summary(df$diff_double)
result <- sapply(df$diff_double, mean, na.rm=TRUE)
stats_by_month <- describeBy(df$diff_double, df$month, mat = TRUE) 
stats_by_month
p <- ggplot(by_month_time, aes(fill=member_casual,y=n,x=month )) +
  geom_bar(position="dodge",stat="identity")
p
