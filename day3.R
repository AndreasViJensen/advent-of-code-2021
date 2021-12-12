####################################
# Day 3 of Advent of Code 2021 /avj 
####################################

library(magrittr)
library(tidyverse)


## PART 1 ##
diagnostic_report <- read_table("input_day_3.txt", col_names = "binary_number") #Read input
diagnostic_report %<>% 
  separate(binary_number, paste0("d", 1:12), 1:12, convert = TRUE) #create variable for each digit

# most common bit is 1 iff the average is larger than .5
most_common_bit <- function(var) {
  floor(2*mean(var))
}
gamma <-summarize(diagnostic_report, across(everything(), most_common_bit))
epsilon <- abs(gamma-1) # epsilon is the bitwise negation of gamma.

gamma_int <- strtoi(paste(as.character(gamma),collapse = ""),2) #convert to int
epsilon_int <- strtoi(paste(as.character(epsilon),collapse = ""),2)

gamma_int*epsilon_int # Calculate product

## PART 2 ##
get_oxygen_generator_rating <- function(candidates) {
  for (digit in colnames(candidates)) {
    if (nrow(candidates) > 1) {
      candidates <-
        filter(candidates, candidates[[digit]] == most_common_bit(candidates[[digit]]))
    }
  }
  return(candidates)
}

get_CO2_scrubber_rating <- function(candidates) {
  for (digit in colnames(candidates)) {
    if (nrow(candidates) > 1) {
      candidates <-
        filter(candidates, candidates[[digit]] == abs(-1 + most_common_bit(candidates[[digit]])))
    }
  }
  return(candidates)
}

ox_gen_rat <- get_oxygen_generator_rating(diagnostic_report)
c02_scr_rat <- get_CO2_scrubber_rating(diagnostic_report)

ox_gen_rat_int <- strtoi(paste(as.character(ox_gen_rat),collapse = ""),2) #convert to int'
c02_scr_rat_int <- strtoi(paste(as.character(c02_scr_rat),collapse = ""),2)

ox_gen_rat_int*c02_scr_rat_int
