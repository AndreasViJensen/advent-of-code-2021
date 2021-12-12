####################################
# Day 2 of Advent of Code 2021 /avj 
####################################

library(tidyverse)

## PART 1 ##
plan <- read_table("input_day_2.txt", col_names = c("direction", "magnitude")) #Read input
head(plan)
sums <- summarize(group_by(plan, direction), sum(magnitude)) #sum magnitudes of moves for each direction
sums <- column_to_rownames(sums, var = "direction") #rownames enable dictionary-like lookups
(sums["down",] - sums["up",]) * sums["forward",] #calculate product of final depth and horizontal position

## PART 2 ##
plan <- mutate(plan,
               aim_change = case_when(direction == "up" ~ -magnitude,
                                      direction == "down" ~ magnitude,
                                      T ~ 0), 
               cum_aim = cumsum(aim_change),
               depth_change = if_else(direction == "forward", magnitude*cum_aim, 0)
)   # Calculate cumulative aim variable, and depth_change variable.
head(plan)

summarize(plan, sum(depth_change)) * sums["forward",] #Product of final depth and horizontal position

