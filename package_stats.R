# calulate table stats

# load packages

library(tidyverse)
library(kysrc)


# analyze data

#create vector of dataset names

table_names <- list(ach_grade_state,
                    ach_grade_dist,
                    ach_grade_sch,
                    ach_level_state,
                    ach_level_dist,
                    ach_level_sch,
                    ccr_state,
                    ccr_dist,
                    ccr_sch,
                    frpl_state,
                    frpl_dist,
                    frpl_sch,
                    grad_state,
                    grad_dist,
                    grad_sch,
                    iep_state,
                    iep_dist,
                    iep_sch,
                    lep_state,
                    lep_dist,
                    lep_sch,
                    profile_state,
                    profile_dist,
                    profile_sch,
                    race_state,
                    race_dist,
                    race_sch
)

table_names_chr <- c("ach_grade_state",
                     "ach_grade_dist",
                     "ach_grade_sch",
                     "ach_level_state",
                     "ach_level_dist",
                     "ach_level_sch",
                     "ccr_state",
                     "ccr_dist",
                     "ccr_sch",
                     "frpl_state",
                     "frpl_dist",
                     "frpl_sch",
                     "grad_state",
                     "grad_dist",
                     "grad_sch",
                     "iep_state",
                     "iep_dist",
                     "iep_sch",
                     "lep_state",
                     "lep_dist",
                     "lep_sch",
                     "profile_state",
                     "profile_dist",
                     "profile_sch",
                     "race_state",
                     "race_dist",
                     "race_sch"
)

get_length <- function(df){

  dim(df)[1]

}
get_width <- function(df){

  dim(df)[2]

}

src_width <- table_names %>% map_dbl(get_width)
src_length <- table_names %>% map_dbl(get_length)

src_data <- tibble(table = table_names_chr,
                   width = src_width,
                   length = src_length) %>%
  mutate(obs = width * length)

src_data_summary <- src_data %>%
  select(-table) %>%
  map_dbl(sum)
