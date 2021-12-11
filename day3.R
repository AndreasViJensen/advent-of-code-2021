####################################
# Day 3 of Advent of Code 2021
# Author: AVJ
####################################
library(tidyverse)

## PART 1 ##
diagnostic_report <- read_table("input_day_3.txt", col_names = "binary_number") #Read input

diagnostic_report %<>% 
  separate(binary_number, paste0("d", 1:12), 1:12, convert = TRUE) #create variable for each digit

# nth digit of gamma is equal to median of nth digit in report
gamma <- floor(2*summarise(diagnostic_report, across(everything(), mean)))
epsilon <- abs(gamma-1) # epsilon is the bitwise negation of gamma.

gamma <- strtoi(paste(as.character(gamma),collapse = ""),2) #convert to int
epsilon <- strtoi(paste(as.character(epsilon),collapse = ""),2)

gamma*epsilon # Calculate product

## PART 2 ##

