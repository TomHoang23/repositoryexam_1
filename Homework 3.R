#Homework 2
library(tidyverse)    
library(dplyr)

#Q1
Vec1<-(c( 10, 19, 121, 83, 63, 7, 77, 61, 51, 97, 123, 41))

Vec1[1]
Vec1[12]

first <- head(Vec1, n = 1)
print(first)
last <- tail(Vec1, n = 1)
print(last)

#Q2
Vec1 < 60
Vec1[Vec1 < 60]    

#Q3
R1 <- c()
for (num in Vec1) {
  if (num %% 2 != 0 & num %% 3 != 0) {
    R1 <- c(R1, num)
  }
}
R1

#Q9
tribble(~x,   ~y,  ~z,
       1,   10,  5,
       2,    9,  4.5,
       3,    8,  4,
       4,    7,  3.5, 
       5,    6,  3, 
       6,    5,  2.5, 
       7,    4,  2, 
       8,    3,  1.5, 
       9,    2,  1, 
       10,   1,  0.5, 
) -> tib
tib

#Q10
find_iqr <- function(col) {
  q1 <- quantile(col, probs = 0.25)
  q3 <- quantile(col, probs = 0.75)
  IQR <- q3 - q1
  return(IQR)
}

IQRs <- map_dbl(tib, find_iqr)
IQRs



