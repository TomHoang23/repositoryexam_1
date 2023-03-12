#Homework 1

library(dplyr)
library(tidyverse)
library(nycflights13)
library(lubridate)
view(flights)

#1
datetime_1 <- ymd("2020/06/06")
datetime_2 <- ymd("2021/07/14")
datetime_2 - datetime_1

#2
datetime_1 <- ymd("1988/01/01")
datetime_2 <- ymd("1989/01/01")
datetime_2 - datetime_1
case_when(
  (datetime_2 - datetime_1) / ddays(365) > 1 ~ TRUE,
  TRUE ~ FALSE
)

#3
datetime_1 <- ymd("1989/01/01")
datetime_2 <- ymd("1990/01/01")
datetime_2 - datetime_1
case_when(
  (datetime_2 - datetime_1) / ddays(365) > 1 ~ TRUE,
  TRUE ~ FALSE
)

#4

#5
datetime_john <- ymd("1962/04/11")
(today() - datetime_john) / dyears(1)


#6
flights

flights%>%
  select(year,month,day,hour,minute,carrier)%>%
  mutate(
    departure = make_datetime(year,month,day,hour,minute))

flights

make_datetime_100 <- function(year, month, day, time) {
  make_datetime(year, month, day, time %/% 100, time %% 100)
}

flights %>%
  filter(!is.na(dep_time), !is.na(arr_time)) %>%
  mutate(
    dep_time = make_datetime_100(year, month, day, dep_time),
    arr_time = make_datetime_100(year, month, day, arr_time),
    sched_dep_time = make_datetime_100(year, month, day, sched_dep_time),
    sched_arr_time = make_datetime_100(year, month, day, sched_arr_time)
  ) %>%
  select(origin,dest,carrier,arr_time,dep_time) ->
  flights_dt

flights_dt

#8
flights_dt%>%
  select("origin", "dest", "carrier", "arr_time") %>%
  filter(origin == "LGA", dest == "DFW", carrier == "AA") %>%
  slice(115:125)

#9
t1 <- "2013-01-09 16:16:00"
t2 <- "2013-01-09 19:17:00"

t1 <- as.POSIXct(t1, format = "%Y-%m-%d %H:%M:%S")
t2 <- as.POSIXct(t2, format = "%Y-%m-%d %H:%M:%S")

timedif <- difftime(t2, t1, units = "mins")
print(timedif)



