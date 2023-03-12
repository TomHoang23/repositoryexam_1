Homework 4

library(tidyverse)
library(dplyr)
library(data.table)

read_csv("Collegedata.csv") -> college
view(college)

read_csv("nycdata-1.csv") -> nyc
view(nyc)
#4
data1 <- college[, c("INSTNM", "SAT_AVG", "ADM_RATE"), with = FALSE]
data1

#5
college%>%
  select("INSTNM", "SAT_AVG", "ADM_RATE")

#6
college[ADM_RATE < 0.2 & SAT_AVG > 1500,
        .(INSTNM, SAT_AVG, ADM_RATE)][1:5]
