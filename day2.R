####################################
# Day 2 of Advent of Code 2021
# Author: AVJ
####################################

library(dplyr)
library(readr)
library(tibble)

## PART 1 ##
plan <- read_table("input_day_2.txt", col_names = c("direction", "magnitude"))

sums <- summarize(group_by(plan,direction),sum(magnitude))
sums <- column_to_rownames(sums, var = "direction")
(sums["down",]-sums["up",])*sums["forward",]



