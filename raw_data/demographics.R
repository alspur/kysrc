# demographics.R
#
# this script is used to transform the raw excel files from the school report
# cards website and create the following dataframes in the kysrc package:
#
# state_race
# dist_race
# sch_race
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


demographics12 <- read_excel("raw_data/data12/LEARNING_ENVIRONMENT_STUDENTS-TEACHERS.xlsx")
demographics13 <- read_excel("raw_data/data13/LEARNING_ENVIRONMENT_STUDENTS-TEACHERS.xlsx")
demographics14 <- read_excel("raw_data/data14/LEARNING_ENVIRONMENT_STUDENTS-TEACHERS.xlsx")
demographics15 <- read_excel("raw_data/data15/LEARNING_ENVIRONMENT_STUDENTS-TEACHERS.xlsx")
demographics16 <- read_excel("raw_data/data16/LEARNING_ENVIRONMENT_STUDENTS-TEACHERS.xlsx")
demographics17 <- read_excel("raw_data/data17/LEARNING_ENVIRONMENT_STUDENTS-TEACHERS.xlsx")


# clean race count data ####

# filter out unneeded columns, rename columns
race12_count <- demographics12 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR,
         MEMBERSHIP_WHITE_CNT, MEMBERSHIP_BLACK_CNT, MEMBERSHIP_HISPANIC_CNT,
         MEMBERSHIP_ASIAN_CNT,  MEMBERSHIP_AIAN_CNT, MEMBERSHIP_HAWAIIAN_CNT,
         MEMBERSHIP_OTHER_CNT) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, White = MEMBERSHIP_WHITE_CNT,
         Black = MEMBERSHIP_BLACK_CNT, Hispanic = MEMBERSHIP_HISPANIC_CNT,
         Asian = MEMBERSHIP_ASIAN_CNT, AIAN = MEMBERSHIP_AIAN_CNT,
         Hawaiian = MEMBERSHIP_HAWAIIAN_CNT, Other = MEMBERSHIP_OTHER_CNT)

race13_count <- demographics13 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR,
         ENROLLMENT_WHITE_CNT, ENROLLMENT_BLACK_CNT, ENROLLMENT_HISPANIC_CNT,
         ENROLLMENT_ASIAN_CNT, ENROLLMENT_AIAN_CNT, ENROLLMENT_HAWAIIAN_CNT,
         ENROLLMENT_OTHER_CNT) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, White = ENROLLMENT_WHITE_CNT,
         Black = ENROLLMENT_BLACK_CNT, Hispanic = ENROLLMENT_HISPANIC_CNT,
         Asian = ENROLLMENT_ASIAN_CNT, AIAN = ENROLLMENT_AIAN_CNT,
         Hawaiian = ENROLLMENT_HAWAIIAN_CNT, Other = ENROLLMENT_OTHER_CNT)

race14_count <- demographics14 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR,
         MEMBERSHIP_WHITE_CNT, MEMBERSHIP_BLACK_CNT, MEMBERSHIP_HISPANIC_CNT,
         MEMBERSHIP_ASIAN_CNT,  MEMBERSHIP_AIAN_CNT, MEMBERSHIP_HAWAIIAN_CNT,
         MEMBERSHIP_TWO_OR_MORE_CNT) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR,  White = MEMBERSHIP_WHITE_CNT,
         Black = MEMBERSHIP_BLACK_CNT, Hispanic = MEMBERSHIP_HISPANIC_CNT,
         Asian = MEMBERSHIP_ASIAN_CNT, AIAN = MEMBERSHIP_AIAN_CNT,
         Hawaiian = MEMBERSHIP_HAWAIIAN_CNT,
         TwoPlus = MEMBERSHIP_TWO_OR_MORE_CNT)

race15_count <- demographics15 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR,
         MEMBERSHIP_WHITE_CNT, MEMBERSHIP_BLACK_CNT, MEMBERSHIP_HISPANIC_CNT,
         MEMBERSHIP_ASIAN_CNT,  MEMBERSHIP_AIAN_CNT, MEMBERSHIP_HAWAIIAN_CNT,
         MEMBERSHIP_TWO_OR_MORE_CNT) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR,  White = MEMBERSHIP_WHITE_CNT,
         Black = MEMBERSHIP_BLACK_CNT, Hispanic = MEMBERSHIP_HISPANIC_CNT,
         Asian = MEMBERSHIP_ASIAN_CNT, AIAN = MEMBERSHIP_AIAN_CNT,
         Hawaiian = MEMBERSHIP_HAWAIIAN_CNT,
         TwoPlus = MEMBERSHIP_TWO_OR_MORE_CNT)

race16_count <- demographics16 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR,
         MEMBERSHIP_WHITE_CNT, MEMBERSHIP_BLACK_CNT, MEMBERSHIP_HISPANIC_CNT,
         MEMBERSHIP_ASIAN_CNT,  MEMBERSHIP_AIAN_CNT, MEMBERSHIP_HAWAIIAN_CNT,
         MEMBERSHIP_TWO_OR_MORE_CNT) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR,  White = MEMBERSHIP_WHITE_CNT,
         Black = MEMBERSHIP_BLACK_CNT, Hispanic = MEMBERSHIP_HISPANIC_CNT,
         Asian = MEMBERSHIP_ASIAN_CNT, AIAN = MEMBERSHIP_AIAN_CNT,
         Hawaiian = MEMBERSHIP_HAWAIIAN_CNT,
         TwoPlus = MEMBERSHIP_TWO_OR_MORE_CNT)

race17_count <- demographics17 %>%
  filter(GRADE != "Grade 14") %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR,
         WHITE_TOTAL, BLACK_TOTAL, HISPANIC_TOTAL,
         ASIAN_TOTAL, AIAN_TOTAL, HAWAIIAN_TOTAL,
         TWO_OR_MORE_RACE_TOTAL) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR,  White = WHITE_TOTAL,
         Black = BLACK_TOTAL, Hispanic = HISPANIC_TOTAL,
         Asian = ASIAN_TOTAL, AIAN = AIAN_TOTAL,
         Hawaiian = HAWAIIAN_TOTAL,
         TwoPlus = TWO_OR_MORE_RACE_TOTAL)  %>%
  group_by(sch_id, dist_name, sch_name, year) %>%
  summarise(White = as.character(sum(White, na.rm = TRUE)),
            Black = as.character(sum(Black, na.rm = TRUE)),
            Hispanic = as.character(sum(Hispanic, na.rm = TRUE)),
            Asian = as.character(sum(Asian, na.rm = TRUE)),
            AIAN = as.character(sum(AIAN, na.rm = TRUE)),
            Hawaiian = as.character(sum(Hawaiian, na.rm = TRUE)),
            TwoPlus = as.character(sum(TwoPlus, na.rm = TRUE)))

# bind race count data from all years together
# convert to long format
# mutate columns
race_count <- bind_rows(race12_count, race13_count, race14_count,
                        race15_count, race16_count, race17_count) %>%
  gather(race, s_count, -sch_id, -dist_name, -sch_name, -year) %>%
  # combine TwoPlus and Other - term changed in 2014, convert to factor
  mutate(s_count = char_to_num(s_count),
         year = factor(year, levels = c("20112012", "20122013", "20132014",
                                        "20142015", "20152016", "20162017"),
                       labels = c("2011-2012", "2012-2013", "2013-2014",
                                  "2014-2015", "2015-2016", "2016-2017")),
         race = factor(str_replace_all(race, "Other", "TwoPlus"),
                       levels = c("White", "Black", "Hispanic",
                                  "TwoPlus", "Asian",
                                  "AIAN", "Hawaiian"),
                       labels = c("White","Black", "Hispanic",
                                  "Two or More/Other",
                                  "Asian","American Indian/Alaska Native",
                                  "Hawaiian/Pacific Islander"))) %>%
  filter(!is.na(s_count)) %>%
  group_by(sch_id, dist_name, sch_name, year) %>%
  mutate(calc_pct = s_count/sum(s_count)) %>%
  ungroup()

# remove unneeded dataframes
rm(race12_count, race13_count, race14_count,
   race15_count, race16_count, race17_count)

# select state, dist, and sch level race data ####

# select state data
race_state <- select_state(race_count)

# select district data
race_dist <- select_dist(race_count)

# select school data
race_sch <- select_sch(race_count)

# use race data for package ####
use_data(race_state, overwrite = TRUE)
use_data(race_dist, overwrite = TRUE)
use_data(race_sch, overwrite = TRUE)
