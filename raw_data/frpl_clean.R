# frpl.R
#
# this script is used to transform the raw excel files from the school report
# cards website and create the following dataframes in the kysrc package:
#
# frpl_state
# frpl_dist
# frpl_sch
#
# this script is included in .Rbuildignore along with all of
# the assocaited excel files.
#
# 11-12 thru 15-16 data obtained on 2016-10-13 and
# 16-17 data obtained on 2017-09-28 from:
# https://applications.education.ky.gov/src/

# load data ####

# load packages
library(devtools)
library(readxl)
library(dplyr)
library(tidyr)
library(magrittr)
library(stringr)

source("raw_data/select_level.R")

# create function to convert chars to nums, handling "," in 1000+ numbers
char_to_num <- function(string = ""){
  as.numeric(str_replace_all(string, ",", ""))
}

# load data
frpl12 <- read_excel("raw_data/data12/LEARNING_ENVIRONMENT_STUDENTS-TEACHERS.xlsx")
frpl13 <- read_excel("raw_data/data13/LEARNING_ENVIRONMENT_STUDENTS-TEACHERS.xlsx")
frpl14 <- read_excel("raw_data/data14/LEARNING_ENVIRONMENT_STUDENTS-TEACHERS.xlsx")
frpl15 <- read_excel("raw_data/data15/LEARNING_ENVIRONMENT_STUDENTS-TEACHERS.xlsx")
frpl16 <- read_excel("raw_data/data16/LEARNING_ENVIRONMENT_STUDENTS-TEACHERS.xlsx")
frpl17 <- read_excel("raw_data/data17/LEARNING_ENVIRONMENT_STUDENTS-TEACHERS.xlsx", sheet = 2)

# clean data ####

frpl12_clean <- frpl12 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR, MEMBERSHIP_TOTAL,
         MEMBERSHIP_FREE_LUNCH_CNT, MEMBERSHIP_REDUCED_LUNCH_CNT) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, enroll = MEMBERSHIP_TOTAL,
         free_lunch = MEMBERSHIP_FREE_LUNCH_CNT,
         red_lunch = MEMBERSHIP_REDUCED_LUNCH_CNT) %>%
  mutate(enroll = char_to_num(enroll),
         free_lunch = char_to_num(free_lunch),
         red_lunch = char_to_num(red_lunch),
         frpl_total = free_lunch + red_lunch,
         frpl_pct = frpl_total / enroll)

frpl13_clean <- frpl13 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR, ENROLLMENT_TOTAL,
         ENROLLMENT_FREE_LUNCH_CNT, ENROLLMENT_REDUCED_LUNCH_CNT) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, enroll = ENROLLMENT_TOTAL,
         free_lunch = ENROLLMENT_FREE_LUNCH_CNT,
         red_lunch = ENROLLMENT_REDUCED_LUNCH_CNT) %>%
  mutate(enroll = char_to_num(enroll),
         free_lunch = char_to_num(free_lunch),
         red_lunch = char_to_num(red_lunch),
         frpl_total = free_lunch + red_lunch,
         frpl_pct = frpl_total / enroll)

frpl14_clean <- frpl14 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR, MEMBERSHIP_TOTAL,
         ENROLLMENT_FREE_LUNCH_CNT, ENROLLMENT_REDUCED_LUNCH_CNT) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, enroll = MEMBERSHIP_TOTAL,
         free_lunch = ENROLLMENT_FREE_LUNCH_CNT,
         red_lunch = ENROLLMENT_REDUCED_LUNCH_CNT) %>%
  mutate(enroll = char_to_num(enroll),
         free_lunch = char_to_num(free_lunch),
         red_lunch = char_to_num(red_lunch),
         frpl_total = free_lunch + red_lunch,
         frpl_pct = frpl_total / enroll)

frpl15_clean <- frpl15 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR, MEMBERSHIP_TOTAL,
         ENROLLMENT_FREE_LUNCH_CNT, ENROLLMENT_REDUCED_LUNCH_CNT) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, enroll = MEMBERSHIP_TOTAL,
         free_lunch = ENROLLMENT_FREE_LUNCH_CNT,
         red_lunch = ENROLLMENT_REDUCED_LUNCH_CNT) %>%
  mutate(enroll = char_to_num(enroll),
         free_lunch = char_to_num(free_lunch),
         red_lunch = char_to_num(red_lunch),
         frpl_total = free_lunch + red_lunch,
         frpl_pct = frpl_total / enroll)

frpl16_clean <- frpl16 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR, MEMBERSHIP_TOTAL,
         ENROLLMENT_FREE_LUNCH_CNT, ENROLLMENT_REDUCED_LUNCH_CNT) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, enroll = MEMBERSHIP_TOTAL,
         free_lunch = ENROLLMENT_FREE_LUNCH_CNT,
         red_lunch = ENROLLMENT_REDUCED_LUNCH_CNT) %>%
  mutate(enroll = char_to_num(enroll),
         free_lunch = char_to_num(free_lunch),
         red_lunch = char_to_num(red_lunch),
         frpl_total = free_lunch + red_lunch,
         frpl_pct = frpl_total / enroll)

frpl17_clean <- frpl17 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR, MEMBERSHIP_TOTAL,
         ENROLLMENT_FREE_LUNCH_CNT, ENROLLMENT_REDUCED_LUNCH_CNT) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, enroll = MEMBERSHIP_TOTAL,
         free_lunch = ENROLLMENT_FREE_LUNCH_CNT,
         red_lunch = ENROLLMENT_REDUCED_LUNCH_CNT) %>%
  mutate(enroll = char_to_num(enroll),
         free_lunch = char_to_num(free_lunch),
         red_lunch = char_to_num(red_lunch),
         frpl_total = free_lunch + red_lunch,
         frpl_pct = frpl_total / enroll)

# join all frpl data
# convert year to factor
# remove free/red standalone columns
frpl_data <- bind_rows(frpl12_clean, frpl13_clean, frpl14_clean,
                       frpl15_clean, frpl16_clean, frpl17_clean) %>%
  mutate(year = factor(year, levels = c("20112012", "20122013", "20132014",
                                        "20142015", "20152016", "20162017"),
                       labels = c("2011-2012", "2012-2013", "2013-2014",
                                  "2014-2015", "2015-2016", "2016-2017"))) %>%
  select(-free_lunch, -red_lunch)

# remove old files
rm(frpl12, frpl12_clean, frpl13, frpl13_clean, frpl14, frpl14_clean,
   frpl15, frpl15_clean, frpl16, frpl16_clean, frpl17, frpl17_clean)

# select state, dist, and sch level frpl data ####

frpl_state <- select_state(frpl_data)

frpl_dist <- select_dist(frpl_data)

frpl_sch <- select_sch(frpl_data)


# use frpl data for package ####
use_data(frpl_state, overwrite = TRUE)
use_data(frpl_dist, overwrite = TRUE)
use_data(frpl_sch, overwrite = TRUE)
