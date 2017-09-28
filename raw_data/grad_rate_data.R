# grad_rate_data.R
#
# this script is used to transform the raw excel files from the school report
# cards website and create the following dataframes in the kysrc package:
#
# kprep_levels
#
# this script is included in .Rbuildignore along with all of
# the assocaited excel files.
#
# 12-13 thru 15-16 data obtained on 2016-10-13 and
# 16-17 data obtained on 2017-09-28 from:
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
grad1315 <- read_excel("raw_data/data15/DELIVERY_TARGET_GRADUATION_RATE_COHORT.xlsx")
grad16 <- read_excel("raw_data/data16/DELIVERY_TARGET_GRADUATION_RATE_COHORT.xlsx")
grad17 <- read_excel("raw_data/data17/DELIVERY_TARGET_GRADUATION_RATE_COHORT.xlsx")

# clean data ####

# convert colnames to lowercase
colnames(grad1315) <- col_lower(grad1315)
colnames(grad16) <- col_lower(grad16)
colnames(grad17) <- col_lower(grad17)

# clean df columns
grad1315_clean <- grad1315 %>%
  filter(cohort_type == "FOUR YEAR") %>%
  filter(target_label == "Actual Score") %>%
  select(sch_cd, dist_name, sch_name, disagg_label,
         cohort_2013, cohort_2014, cohort_2015) %>%
  rename(sch_id = sch_cd, student_group = disagg_label) %>%
  gather(year, grad_rate, -sch_id, -dist_name, -sch_name, -student_group)

grad16_clean <- grad16 %>%
  filter(cohort_type == "FOUR YEAR") %>%
  filter(target_label == "Actual Score") %>%
  select(sch_cd, dist_name, sch_name, disagg_label, reportyear_2016) %>%
  rename(sch_id = sch_cd, student_group = disagg_label) %>%
  gather(year, grad_rate, -sch_id, -dist_name, -sch_name, -student_group)

grad17_clean <- grad17 %>%
  filter(cohort_type == "FOUR YEAR") %>%
  filter(target_label == "Actual Score") %>%
  select(sch_cd, dist_name, sch_name, disagg_label, reportyear_2017) %>%
  rename(sch_id = sch_cd, student_group = disagg_label) %>%
  gather(year, grad_rate, -sch_id, -dist_name, -sch_name, -student_group)

# join data
grad_data <- bind_rows(grad1315_clean, grad16_clean, grad17_clean) %>%
  mutate(year = factor(str_replace_all(str_replace_all(year,
                                                       "reportyear_",""), "cohort_", ""),
                          levels = c("2013", "2014", "2015", "2016", "2017"),
                          labels = c("2012-2013", "2013-2014",
                                     "2014-2015", "2015-2016",
                                     "2016-2017")),
         grad_rate = char_to_num(grad_rate)/100)

# select state data
grad_state <- select_state(grad_data)

# select district data
grad_dist <- select_dist(grad_data)

# select school data
grad_sch <- select_sch(grad_data)

# use data for package ####
use_data(grad_state, overwrite = TRUE)
use_data(grad_dist, overwrite = TRUE)
use_data(grad_sch, overwrite = TRUE)
