# demographics.R
#
# this script is used to transform the raw excel files from the school report
# cards website and create the following dataframes in the kysrc package:
#
# s_race
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
library(magrittr)
library(stringr)

demographics12 <- read_excel("raw_data/data12/LEARNING_ENVIRONMENT_STUDENTS-TEACHERS.xlsx")
demographics13 <- read_excel("raw_data/data13/LEARNING_ENVIRONMENT_STUDENTS-TEACHERS.xlsx")
demographics14 <- read_excel("raw_data/data14/LEARNING_ENVIRONMENT_STUDENTS-TEACHERS.xlsx")
demographics15 <- read_excel("raw_data/data15/LEARNING_ENVIRONMENT_STUDENTS-TEACHERS.xlsx")

# clean race count data ####

# filter out unneeded columns, rename columns
race12 <- demographics12 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR,
         MEMBERSHIP_WHITE_CNT, MEMBERSHIP_BLACK_CNT, MEMBERSHIP_HISPANIC_CNT,
         MEMBERSHIP_ASIAN_CNT,  MEMBERSHIP_AIAN_CNT, MEMBERSHIP_HAWAIIAN_CNT,
         MEMBERSHIP_OTHER_CNT) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, White = MEMBERSHIP_WHITE_CNT,
         Black = MEMBERSHIP_BLACK_CNT, Hispanic = MEMBERSHIP_HISPANIC_CNT,
         Asian = MEMBERSHIP_ASIAN_CNT, AIAN = MEMBERSHIP_AIAN_CNT,
         Hawaiian = MEMBERSHIP_HAWAIIAN_CNT, Other = MEMBERSHIP_OTHER_CNT)

race13 <- demographics13 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR,
         ENROLLMENT_WHITE_CNT, ENROLLMENT_BLACK_CNT, ENROLLMENT_HISPANIC_CNT,
         ENROLLMENT_ASIAN_CNT, ENROLLMENT_AIAN_CNT, ENROLLMENT_HAWAIIAN_CNT,
         ENROLLMENT_OTHER_CNT) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, White = ENROLLMENT_WHITE_CNT,
         Black = ENROLLMENT_BLACK_CNT, Hispanic = ENROLLMENT_HISPANIC_CNT,
         Asian = ENROLLMENT_ASIAN_CNT, AIAN = ENROLLMENT_AIAN_CNT,
         Hawaiian = ENROLLMENT_HAWAIIAN_CNT, Other = ENROLLMENT_OTHER_CNT)

race14 <- demographics14 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR,
         MEMBERSHIP_WHITE_CNT, MEMBERSHIP_BLACK_CNT, MEMBERSHIP_HISPANIC_CNT,
         MEMBERSHIP_ASIAN_CNT,  MEMBERSHIP_AIAN_CNT, MEMBERSHIP_HAWAIIAN_CNT,
         MEMBERSHIP_TWO_OR_MORE_CNT) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR,  White = MEMBERSHIP_WHITE_CNT,
         Black = MEMBERSHIP_BLACK_CNT, Hispanic = MEMBERSHIP_HISPANIC_CNT,
         Asian = MEMBERSHIP_ASIAN_CNT, AIAN = MEMBERSHIP_AIAN_CNT,
         Hawaiian = MEMBERSHIP_HAWAIIAN_CNT, TwoPlus = MEMBERSHIP_TWO_OR_MORE_CNT)

race15 <- demographics15 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR,
         MEMBERSHIP_WHITE_CNT, MEMBERSHIP_BLACK_CNT, MEMBERSHIP_HISPANIC_CNT,
         MEMBERSHIP_ASIAN_CNT,  MEMBERSHIP_AIAN_CNT, MEMBERSHIP_HAWAIIAN_CNT,
         MEMBERSHIP_TWO_OR_MORE_CNT) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR,  White = MEMBERSHIP_WHITE_CNT,
         Black = MEMBERSHIP_BLACK_CNT, Hispanic = MEMBERSHIP_HISPANIC_CNT,
         Asian = MEMBERSHIP_ASIAN_CNT, AIAN = MEMBERSHIP_AIAN_CNT,
         Hawaiian = MEMBERSHIP_HAWAIIAN_CNT, TwoPlus = MEMBERSHIP_TWO_OR_MORE_CNT)

# bind data from all years together
race_count <- bind_rows(race12, race13, race14, race15)

# remove unneeded dataframes
rm(demographics12, demographics13, demographics14, demographics15,
   race12, race13, race14, race15)

# convert to long data & reformat data
race_count %<>%
  gather(race, count, -sch_id, -dist_name, -sch_name, -year) %>%
  # combine TwoPlus and Other - term changed in 2014, convert to factor
  mutate(year = factor(year, levels = c("20112012", "20122013", "20132014", "20142015"),
                       labels = c("2011-2012", "2012-2013", "2013-2014", "2014-2015")),
         race = factor(str_replace_all(race, "Other", "TwoPlus"),
                      levels = c("White", "Black", "Hispanic", "TwoPlus", "Asian",
                                  "AIAN", "Hawaiian"),
                      labels = c("White","Black", "Hispanic", "Two or More/Other",
                                 "Asian","American Indian/Alaska Native",
                                 "Hawaiian/Pacific Islander")),
         count = as.numeric(str_replace_all(count, ",", ""))) %>%
  filter(!is.na(count))

# select state data
state_race <- race_count %>%
  filter(sch_id == 999) %>% # filter for state id number
  select(-sch_name) %>% # this is redudndant - just reads "state total"
  mutate(dist_name = "State") # make this label consistent

dist_race <- race_count %>%
  filter(sch_id != 999) %>% # exclude state id number
  filter(str_length(sch_id) == 3) %>% # only include id numbers w/ 3 chars
  select(-sch_name) # remove redundant col - all values are "District Total"

sch_race <- race_count %>%
  filter(str_length(sch_id) == 6) # only include id numbers w/ 6 chars

# use data for package ####
use_data(state_race, overwrite = TRUE)
use_data(dist_race, overwrite = TRUE)
use_data(sch_race, overwrite = TRUE)
