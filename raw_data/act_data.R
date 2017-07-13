# act_data.R
#
# this script is used to transform the raw excel files from the school report
# cards website and create the following dataframes in the kysrc package:
#
# act_sch
# act_dist
# act_state
#
# this script is included in .Rbuildignore along with all of
# the assocaited excel files.
#
# data obtained on 2016-07-22 from:
# https://applications.education.ky.gov/src/

# load data ####

# load packages
library(devtools)
library(readxl)
library(dplyr)
library(tidyr)
library(stringr)
library(magrittr)

source("raw_data/function_help.R")

# profile data for state, dist, and school levels

act12 <- read_excel("raw_data/data12/ASSESSMENT_ACT.xlsx", sheet = 2)
act13 <- read_excel("raw_data/data13/ASSESSMENT_ACT.xlsx", sheet = 2)
act14 <- read_excel("raw_data/data14/ASSESSMENT_ACT.xlsx")
act15 <- read_excel("raw_data/data15/ASSESSMENT_ACT.xlsx")
act16 <- read_excel("raw_data/data16/ASSESSMENT_ACT.xlsx")

# clean data ####

clean_act <- function(df){
  df %>%
    select(SCH_CD, SCH_YEAR, DIST_NAME,
           SCH_NAME, DISAGG_LABEL, STDNT_TESTED_CNT,
           ENGLISH_MEAN_SCORE, ENGLISH_BNCHMRK_PCT,
           MATHEMATICS_MEAN_SCORE, MATHEMATICS_BNCHMRK_PCT,
           READING_MEAN_SCORE, READING_BNCHMRK_PCT,
           SCIENCE_MEAN_SCORE, COMPOSITE_MEAN_SCORE) %>%
    rename(sch_id = SCH_CD, year = SCH_YEAR,
           dist_name = DIST_NAME, sch_name = SCH_NAME,
           student_group = DISAGG_LABEL, act_n_tested = STDNT_TESTED_CNT,
           act_eng_mean = ENGLISH_MEAN_SCORE,
           act_eng_bench_pct = ENGLISH_BNCHMRK_PCT,
           act_math_mean = MATHEMATICS_MEAN_SCORE,
           act_math_bench_pct = MATHEMATICS_BNCHMRK_PCT,
           act_read_mean = READING_MEAN_SCORE,
           act_read_bench_pct = READING_BNCHMRK_PCT,
           act_science_mean = SCIENCE_MEAN_SCORE,
           act_comp_mean = COMPOSITE_MEAN_SCORE)

}

# clean act data
act12_clean <- clean_act(act12)
act13_clean <- clean_act(act13)
act14_clean <- clean_act(act14)
act15_clean <- clean_act(act15)
act16_clean <- clean_act(act16)

# bind dfs
act_data <- bind_rows(act12_clean, act13_clean, act14_clean,
                      act15_clean, act16_clean)

# remove old files
rm(act12, act12_clean, act13, act13_clean, act14, act14_clean,
   act15, act15_clean, act16, act16_clean)

# format columns

act_data %<>%
  mutate(year = factor(year, levels = c("20112012", "20122013",
                                        "20132014", "20142015",
                                        "20152016"),
                       labels = c("2011-2012", "2012-2013",
                                  "2013-2014", "2014-2015",
                                  "2015-2016")),
         student_group = factor(student_group),
         act_n_tested = char_to_num(act_n_tested),
         act_comp_mean = char_to_num(act_comp_mean),
         act_eng_mean = char_to_num(act_eng_mean),
         act_math_mean = char_to_num(act_math_mean),
         act_read_mean = char_to_num(act_read_mean),
         act_science_mean = char_to_num(act_science_mean),
         act_eng_bench_pct = pct_to_num(act_eng_bench_pct),
         act_math_bench_pct = pct_to_num(act_math_bench_pct),
         act_read_bench_pct = pct_to_num(act_read_bench_pct)) %>%
  select(sch_id, dist_name, sch_name, year, student_group, act_n_tested,
         act_comp_mean, act_eng_mean, act_math_mean,
         act_read_mean, act_science_mean,
         act_eng_bench_pct, act_math_bench_pct, act_read_bench_pct)


# select state data
act_state <-act_data %>%
  filter(sch_id == 999) %>% # filter for state id number
  select(-sch_name) # remove redundant column - all values are "State Total"


# select district data
act_dist <- act_data %>%
  filter(sch_id != 999) %>% # exclude state id number
  filter(str_length(sch_id) == 3) %>% # only include id numbers w/ 3 chars
  select(-sch_name) # remove redundant col - all values are "District Total"

# select school data
act_sch <- act_data %>%
  filter(str_length(sch_id) == 6) # only include id numbers w/ 6 chars

# use data for package ####
use_data(act_sch, overwrite = TRUE)
use_data(act_dist, overwrite = TRUE)
use_data(act_state, overwrite = TRUE)

