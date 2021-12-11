####################################
# Day 1 of Advent of Code 2021
# Author: AVJ
####################################

library(dplyr)
library(readr)

## PART 1 ##
sweep_report <- read_table("input_day_1.txt", col_names = "depth")
sweep_report <- mutate(sweep_report, is_increase = depth>lag(depth))
sum(sweep_report$is_increase, na.rm = TRUE)

## PART 2 ##
sweep_report <- mutate(sweep_report, 
                       window_mean = depth+lead(depth)+lead(lead(depth)),
                       is_increase = window_mean>lag(window_mean))
sum(sweep_report$is_increase, na.rm = TRUE)