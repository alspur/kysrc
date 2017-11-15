# calulate table stats

# load packages

library(tidyverse)
library(kysrc)


# analyze data

#create vector of dataset names

table_names <- list(acctbly_state,
                    acctbly_dist,
                    acctbly_sch,
                    ach_grade_state,
                    ach_grade_dist,
                    ach_grade_sch,
                    ach_level_state,
                    ach_level_dist,
                    ach_level_sch,
                    act_state,
                    act_dist,
                    act_sch,
                    ap_state,
                    ap_dist,
                    ap_sch,
                    ccr_state,
                    ccr_dist,
                    ccr_sch,
                    fin_summary_state,
                    fin_summary_dist,
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
                    race_sch,
                    rev_exp_state,
                    rev_exp_dist,
                    seek_state,
                    seek_dist,
                    tax_state,
                    tax_dist,
                    teach_state,
                    teach_dist,
                    teach_sch,
                    legal_state,
                    legal_dist,
                    legal_sch,
                    discipline_state,
                    discipline_dist,
                    discipline_sch,
                    behavior_events_state,
                    behavior_events_dist,
                    behavior_events_sch,
                    behavior_context_state,
                    behavior_context_dist,
                    behavior_context_sch,
                    behavior_location_state,
                    behavior_location_dist,
                    behavior_location_sch,
                    behavior_ses_state,
                    behavior_ses_dist,
                    behavior_ses_sch
)

table_names_chr <- c("acctbly_state",
                     "acctbly_dist",
                     "acctbly_sch",
                     "ach_grade_state",
                     "ach_grade_dist",
                     "ach_grade_sch",
                     "ach_level_state",
                     "ach_level_dist",
                     "ach_level_sch",
                     "act_state",
                     "act_dist",
                     "act_scl",
                     "ap_state",
                     "ap_dist",
                     "ap_sch",
                     "ccr_state",
                     "ccr_dist",
                     "ccr_sch",
                     "fin_summary_state",
                     "fin_summary_dist",
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
                     "race_sch",
                     "rev_exp_state",
                     "rev_exp_dist",
                     "seek_state",
                     "seek_dist",
                     "tax_state",
                     "tax_dist",
                     "teach_state",
                     "teach_dist",
                     "teach_sch",
                     "legal_state",
                     "legal_dist",
                     "legal_sch",
                     "discipline_state",
                     "discipline_dist",
                     "discipline_sch",
                     "behavior_events_state",
                     "behavior_events_dist",
                     "behavior_events_sch",
                     "behavior_context_state",
                     "behavior_context_dist",
                     "behavior_context_sch",
                     "behavior_location_state",
                     "behavior_location_dist",
                     "behavior_location_sch",
                     "behavior_ses_state",
                     "behavior_ses_dist",
                     "behavior_ses_sch"
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

src_data_summary
