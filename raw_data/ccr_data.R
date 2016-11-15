# ccr_data.R
#
# this script is used to transform the raw excel files from the school report
# cards website and create the following dataframes in the kysrc package:
#
# ccr_state
# ccr_dist
# ccr_sch
#
# this script is included in .Rbuildignore along with all of
# the assocaited excel files.
#
# data obtained on 2016-10-13 from:
# https://applications.education.ky.gov/src/

# load data ####

# load packages
library(devtools)
library(readxl)
library(dplyr)
library(tidyr)
library(stringr)
library(magrittr)

# load helper functions
source("raw_data/function_help.R")

# load data
ccr12 <- read_excel("raw_data/data12/ACCOUNTABILITY_CCR_HIGHSCHOOL.xlsx", sheet = 2)
ccr13 <- read_excel("raw_data/data13/ACCOUNTABILITY_CCR_HIGHSCHOOL.xlsx", sheet = 2)
ccr14 <- read_excel("raw_data/data14/ACCOUNTABILITY_CCR_HIGHSCHOOL.xlsx")
ccr15 <- read_excel("raw_data/data15/ACCOUNTABILITY_CCR_HIGHSCHOOL.xlsx")
ccr16 <- read_excel("raw_data/data16/ACCOUNTABILITY_CCR_HIGHSCHOOL.xlsx")


# clean data ####

# convert colnames to lowercase
colnames(ccr12) <- col_lower(ccr12)
colnames(ccr13) <- col_lower(ccr13)
colnames(ccr14) <- col_lower(ccr14)
colnames(ccr15) <- col_lower(ccr15)
colnames(ccr16) <- col_lower(ccr16)

# clean columns
ccr12_clean <- ccr12 %>%
  select(sch_cd, dist_name, sch_name, sch_year, disagg_label,
         nbr_graduates_with_diploma, college_ready, career_ready_total,
         nbr_ccr_regular, pct_ccr_no_bonus) %>%
  rename(sch_id = sch_cd, year = sch_year, student_group = disagg_label,
         career_ready = career_ready_total)

ccr13_clean <- ccr13 %>%
  select(sch_cd, dist_name, sch_name, sch_year, disagg_label,
         nbr_graduates_with_diploma, college_ready, career_ready_total,
         nbr_ccr_regular, pct_ccr_no_bonus) %>%
  rename(sch_id = sch_cd, year = sch_year, student_group = disagg_label,
         career_ready = career_ready_total)

ccr14_clean <- ccr14 %>%
  select(sch_cd, dist_name, sch_name, sch_year, disagg_label,
         nbr_graduates_with_diploma, college_ready, career_ready_total,
         nbr_ccr_regular,pct_ccr_no_bonus) %>%
  rename(sch_id = sch_cd, year = sch_year, student_group = disagg_label,
         career_ready = career_ready_total)

ccr15_clean <- ccr15 %>%
  select(sch_cd, dist_name, sch_name, sch_year, disagg_label,
         nbr_graduates_with_diploma, college_ready, career_ready_total,
         nbr_ccr_regular, pct_ccr_no_bonus) %>%
  rename(sch_id = sch_cd, year = sch_year, student_group = disagg_label,
         career_ready = career_ready_total)

ccr16_clean <- ccr16 %>%
  select(sch_cd, dist_name, sch_name, sch_year, disagg_label,
         nbr_graduates_with_diploma, college_ready, career_ready_total,
         nbr_ccr_regular, pct_ccr_no_bonus) %>%
  rename(sch_id = sch_cd, year = sch_year, student_group = disagg_label,
         career_ready = career_ready_total)

# join data
ccr_data <- bind_rows(ccr12_clean, ccr13_clean, ccr14_clean,
                      ccr15_clean, ccr16_clean) %>%
  rename(n_grads = nbr_graduates_with_diploma,
         ccr_total = nbr_ccr_regular,
         ccr_pct = pct_ccr_no_bonus) %>%
  mutate(year = factor(year, levels = c(20112012, 20122013, 20132014,
                                           20142015, 20152016),
                          labels = c("2011-2012", "2012-2013",
                                           "2013-2014", "2014-2015",
                                           "2015-2016")),
         student_group = as.factor(student_group),
         n_grads = char_to_num(n_grads),
         college_ready = char_to_num(college_ready),
         career_ready = char_to_num(career_ready),
         ccr_total = char_to_num(ccr_total),
         college_only = ccr_total - career_ready,
         career_only = ccr_total - college_ready,
         both_college_career = college_ready - college_only,
         ccr_pct = as.numeric(ccr_pct) / 100,
         college_only_pct = college_only / n_grads,
         career_only_pct = career_only / n_grads,
         both_college_career_pct = both_college_career / n_grads,
         no_ccr_pct = (n_grads - ccr_total) / n_grads) %>%
  select(-n_grads, -ccr_total, -college_ready, -career_ready, -college_only,
         -career_only, -both_college_career)

# select state data
ccr_state <- select_state(ccr_data)

# select district data
ccr_dist <- select_dist(ccr_data)

# select school data
ccr_sch <- select_sch(ccr_data)

# save data for use in package #####
use_data(ccr_state, overwrite = TRUE)
use_data(ccr_dist, overwrite = TRUE)
use_data(ccr_sch, overwrite = TRUE)
