# accountabiltiy_data.R
#
# this script is used to transform the raw excel files from the kde open
# house website and create the following dataframes in the kysrc package:
#
# accountablity_sch
#
# this script is included in .Rbuildignore along with all of
# the assocaited excel files.
#
# 17-18 data obtained on 2018-10-08 from:
# http://openhouse.education.ky.gov

# load data ------------

# load packages
library(devtools)
library(readxl)
library(dplyr)
library(tidyr)
library(stringr)
library(magrittr)

# load data

acct_raw <- read_excel("raw_data/data18/Accountability Summary_20180926.xlsx")

# source helper functions
source("raw_data/function_help.R")

# clean -----------

acct_clean <- acct_raw %>%
  rename(sch_id = Code, dist_name = `District Name`, sch_name = `School Name`,
         title1 = `Title I`, level = Level, feeder = Feeder, acctbly_label = `CSI or TSI`,
         prof_indicator = `Proficiency Indicator`,
         sep_acad_indicator = `Separate Academic Indicator`,
         growth_indicator = `Growth Indicator`, transition_indicator = `Transition Readiness Indicator`,
         grad_indicator = `Graduation Indicator`, grad_rate = `4 Yr Cohort Graduation Rate`) %>%
  select(-feeder)

# fix colname w/ backslash
colnames(acct_clean)[7] <- "acctbly_label_reason"

# fix formatting
acct_clean <- acct_clean %>%
  mutate(title1 = factor(title1, levels = c("No", "Yes"))) %>%
  mutate(level = str_replace_all(level, "ES", "Elementary School"),
         level = str_replace_all(level, "MS", "Middle School"),
         level = str_replace_all(level, "HS", "High School")) %>%
  mutate(acctbly_label = str_replace_na(acctbly_label, "None"),
         acctbly_label = factor(acctbly_label, levels = c("None", "TSI", "CSI"))) %>%
  mutate(prof_indicator = char_to_num(prof_indicator)/100,
         sep_acad_indicator = char_to_num(sep_acad_indicator)/100,
         growth_indicator = char_to_num(growth_indicator)/100,
         transition_indicator = char_to_num(transition_indicator)/100,
         grad_indicator = char_to_num(grad_indicator)/100,
         grad_rate = char_to_num(grad_rate)/100) %>%
  mutate(year = "2017-2018") %>%
  select(sch_id, dist_name, sch_name, year, everything())


# save data ----------------

# select state data
acctbly_essa_state <- select_state(acct_clean) %>%
  select(-title1, -acctbly_label, -acctbly_label_reason)

# select district data
acctbly_essa_dist <- select_dist(acct_clean) %>%
  select(-title1, -acctbly_label, -acctbly_label_reason)

# select school data
acctbly_essa_sch <- select_sch(acct_clean)

# use data for package ####
use_data(acctbly_essa_sch, overwrite = TRUE)
use_data(acctbly_essa_dist, overwrite = TRUE)
use_data(acctbly_essa_state, overwrite = TRUE)
