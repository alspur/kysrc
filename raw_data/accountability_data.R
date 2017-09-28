# accountabiltiy_data.R
#
# this script is used to transform the raw excel files from the school report
# cards website and create the following dataframes in the kysrc package:
#
# sch_acctbly
# dist_acctbly
# state_acctbly
#
# this script is included in .Rbuildignore along with all of
# the assocaited excel files.
#
# 11-12 thru 15-16 data obtained on 2016-07-22 from:
# https://applications.education.ky.gov/src/

# load data ####

# load packages
library(devtools)
library(readxl)
library(dplyr)
library(tidyr)
library(magrittr)
library(stringr)

source("raw_data/function_help.R")

# accountability data for state, dist, and school levels

acctbly12 <- read_excel("raw_data/data12/ACCOUNTABILITY_PROFILE.xlsx", sheet = 2)
acctbly13 <- read_excel("raw_data/data13/ACCOUNTABILITY_PROFILE.xlsx", sheet = 2)
acctbly14 <- read_excel("raw_data/data14/ACCOUNTABILITY_PROFILE.xlsx")
acctbly15 <- read_excel("raw_data/data15/ACCOUNTABILITY_PROFILE.xlsx")
acctbly16 <- read_excel("raw_data/data16/ACCOUNTABILITY_PROFILE.xlsx")

# clean data ####

acctbly_clean <- function(df){
  df %>%
    select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR, CONTENT_LEVEL, OVERALL_SCORE,
           CLASSIFICATION, REWARD_RECOGNITION) %>%
    rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
           year = SCH_YEAR, school_level = CONTENT_LEVEL,
           acctbly_score = OVERALL_SCORE, acctbly_label = CLASSIFICATION,
           reward_assist = REWARD_RECOGNITION)
}

# filter out unneeded columns
acctbly12 <- acctbly_clean(acctbly12)
acctbly13 <- acctbly_clean(acctbly13)
acctbly14 <- acctbly_clean(acctbly14)
acctbly15 <- acctbly_clean(acctbly15)
acctbly16 <- acctbly_clean(acctbly16)

# bind rows
acctbly_data <- bind_rows(acctbly12, acctbly13, acctbly14,
                          acctbly15, acctbly16)

# remove old dfs
rm(acctbly12, acctbly13, acctbly14, acctbly15, acctbly16)

# tidy up columns
acctbly_data %<>%
  mutate(year = factor(year, levels = c("20112012", "20122013", "20132014",
                                        "20142015", "20152016"),
                       labels = c("2011-2012", "2012-2013", "2013-2014",
                                  "2014-2015", "2015-2016")),
         school_level = factor(school_level, levels = c("Elementary School",
                                                        "Middle School",
                                                        "High School")),
         acctbly_score = char_to_num(acctbly_score),
         reward_assist = str_replace_all(reward_assist,
                                         "[[:punct:]]Monitoring Only[[:punct:]]",
                                         "/Monitoring Only")) %>%
  separate(acctbly_label,
           into = c("acctbly_label", "prog_label"), sep = "/") %>%
  separate(reward_assist,
           into = c("reward_assist", "reward_assist_note"), sep = "/") %>%
  mutate(acctbly_label = factor(acctbly_label, levels = c("Needs Improvement",
                                                          "Proficient",
                                                          "Distinguished")),
         prog_label = factor(prog_label))

# select state data
acctbly_state <- acctbly_data %>%
  filter(sch_id == 999) %>% # filter for state id number
  select(sch_id, dist_name, year, acctbly_score, acctbly_label,
         prog_label) # remove redundant columns


# select district data
acctbly_dist <- acctbly_data %>%
  filter(sch_id != 999) %>% # exclude state id number
  filter(str_length(sch_id) == 3) %>% # only include id numbers w/ 3 chars
  select(-sch_name) %>% # remove redundant col - all values are "District Total"
  mutate(high_progress = NA)

for(i in seq_along(acctbly_dist$sch_id)){
  if("High Progress District" %in% acctbly_dist$reward_assist_note[i]){
    acctbly_dist$high_progress[i] <- "High Progress District"
  } else if("High Progress District" %in% acctbly_dist$reward_assist[i]){
    acctbly_dist$high_progress[i] <- "High Progress District"
    acctbly_dist$reward_assist[i] <- NA
  }

}

acctbly_dist %<>%
  select(-school_level, -reward_assist_note) %>%
  mutate(reward_assist = factor(reward_assist,
                                levels = c("Focus District",
                                           "High Performing District",
                                           "District of Distinction")),
         high_progress = factor(high_progress)) %>%
  select(sch_id, dist_name, year, acctbly_score, acctbly_label,
         reward_assist, prog_label, high_progress)

# select school data
acctbly_sch <- acctbly_data %>%
  filter(str_length(sch_id) == 6) %>% # only include id numbers w/ 6 chars
  mutate(high_progress = NA)

for(i in seq_along(acctbly_sch$sch_id)){
  if("High Progress School" %in% acctbly_sch$reward_assist_note[i]){
    acctbly_sch$high_progress[i] <- "High Progress School"
    acctbly_sch$reward_assist_note[i] <- NA
  } else if("High Progress School" %in% acctbly_sch$reward_assist[i]){
    acctbly_sch$high_progress[i] <- "High Progress School"
    acctbly_sch$reward_assist[i] <- NA
  }

}

acctbly_sch %<>%
  mutate(reward_assist = factor(reward_assist,
                                levels = c("Priority School",
                                           "Focus School",
                                           "High Performing School",
                                           "School of Distinction")),
         high_progress = factor(high_progress),
         monitor_only = factor(reward_assist_note)) %>%
  select(sch_id, dist_name, sch_name, year, school_level,
         acctbly_score, acctbly_label,
         reward_assist, prog_label, high_progress, monitor_only)

# use data for package ####
use_data(acctbly_state, overwrite = TRUE)
use_data(acctbly_dist, overwrite = TRUE)
use_data(acctbly_sch, overwrite = TRUE)
