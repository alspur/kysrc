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

source("raw_data/select_level.R")


# create function to convert chars to nums, handling "," in 1000+ numbers
char_to_num <- function(string = ""){
  as.numeric(str_replace_all(string, ",", ""))
}


demographics12 <- read_excel("raw_data/data12/LEARNING_ENVIRONMENT_STUDENTS-TEACHERS.xlsx")
demographics13 <- read_excel("raw_data/data13/LEARNING_ENVIRONMENT_STUDENTS-TEACHERS.xlsx")
demographics14 <- read_excel("raw_data/data14/LEARNING_ENVIRONMENT_STUDENTS-TEACHERS.xlsx")
demographics15 <- read_excel("raw_data/data15/LEARNING_ENVIRONMENT_STUDENTS-TEACHERS.xlsx")
demographics16 <- read_excel("raw_data/data16/LEARNING_ENVIRONMENT_STUDENTS-TEACHERS.xlsx",
                             sheet = 2)


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
         Hawaiian = MEMBERSHIP_HAWAIIAN_CNT, TwoPlus = MEMBERSHIP_TWO_OR_MORE_CNT)

race15_count <- demographics15 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR,
         MEMBERSHIP_WHITE_CNT, MEMBERSHIP_BLACK_CNT, MEMBERSHIP_HISPANIC_CNT,
         MEMBERSHIP_ASIAN_CNT,  MEMBERSHIP_AIAN_CNT, MEMBERSHIP_HAWAIIAN_CNT,
         MEMBERSHIP_TWO_OR_MORE_CNT) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR,  White = MEMBERSHIP_WHITE_CNT,
         Black = MEMBERSHIP_BLACK_CNT, Hispanic = MEMBERSHIP_HISPANIC_CNT,
         Asian = MEMBERSHIP_ASIAN_CNT, AIAN = MEMBERSHIP_AIAN_CNT,
         Hawaiian = MEMBERSHIP_HAWAIIAN_CNT, TwoPlus = MEMBERSHIP_TWO_OR_MORE_CNT)

race16_count <- demographics16 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR,
         MEMBERSHIP_WHITE_CNT, MEMBERSHIP_BLACK_CNT, MEMBERSHIP_HISPANIC_CNT,
         MEMBERSHIP_ASIAN_CNT,  MEMBERSHIP_AIAN_CNT, MEMBERSHIP_HAWAIIAN_CNT,
         MEMBERSHIP_TWO_OR_MORE_CNT) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR,  White = MEMBERSHIP_WHITE_CNT,
         Black = MEMBERSHIP_BLACK_CNT, Hispanic = MEMBERSHIP_HISPANIC_CNT,
         Asian = MEMBERSHIP_ASIAN_CNT, AIAN = MEMBERSHIP_AIAN_CNT,
         Hawaiian = MEMBERSHIP_HAWAIIAN_CNT, TwoPlus = MEMBERSHIP_TWO_OR_MORE_CNT)

# bind race count data from all years together
# convert to long format
# mutate columns
race_count <- bind_rows(race12_count, race13_count, race14_count,
                        race15_count, race16_count) %>%
  gather(race, s_count, -sch_id, -dist_name, -sch_name, -year) %>%
  # combine TwoPlus and Other - term changed in 2014, convert to factor
  mutate(s_count = char_to_num(s_count),
         year = factor(year, levels = c("20112012", "20122013", "20132014",
                                        "20142015", "20152016"),
                       labels = c("2011-2012", "2012-2013", "2013-2014",
                                  "2014-2015", "2015-2016")),
         race = factor(str_replace_all(race, "Other", "TwoPlus"),
                       levels = c("White", "Black", "Hispanic", "TwoPlus", "Asian",
                                  "AIAN", "Hawaiian"),
                       labels = c("White","Black", "Hispanic", "Two or More/Other",
                                  "Asian","American Indian/Alaska Native",
                                  "Hawaiian/Pacific Islander"))) %>%
  filter(!is.na(s_count)) %>%
  group_by(sch_id, dist_name, sch_name, year) %>%
  mutate(calc_pct = s_count/sum(s_count)) %>%
  ungroup()

# remove unneeded dataframes
rm(race12_count, race13_count, race14_count,
   race15_count, race16_count)

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

# clean teacher data ####

# filter out unneeded columns, rename columns
teach12 <- demographics12 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR,
         STDNT_TCH_RATIO, FULLTIME_TCH_TOTAL, NATIONAL_BOARD_CERT_TCH_CNT,
         AVG_YRS_TCH_EXP) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, s_t_ratio = STDNT_TCH_RATIO, t_fte = FULLTIME_TCH_TOTAL,
         nbct_count = NATIONAL_BOARD_CERT_TCH_CNT, avg_t_exp = AVG_YRS_TCH_EXP)

teach13 <- demographics13 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR,
         STDNT_TCH_RATIO, FTE_TCH_TOTAL, NATIONAL_BOARD_CERT_TCH_CNT,
         AVG_YRS_TCH_EXP) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, s_t_ratio = STDNT_TCH_RATIO, t_fte = FTE_TCH_TOTAL,
         nbct_count = NATIONAL_BOARD_CERT_TCH_CNT, avg_t_exp = AVG_YRS_TCH_EXP)

teach14 <- demographics14 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR,
         STDNT_TCH_RATIO, FTE_TCH_TOTAL, NATIONAL_BOARD_CERT_TCH_CNT,
         AVG_YRS_TCH_EXP) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, s_t_ratio = STDNT_TCH_RATIO, t_fte = FTE_TCH_TOTAL,
         nbct_count = NATIONAL_BOARD_CERT_TCH_CNT, avg_t_exp = AVG_YRS_TCH_EXP)

teach15 <- demographics15 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR,
         STDNT_TCH_RATIO, FTE_TCH_TOTAL, NATIONAL_BOARD_CERT_TCH_CNT,
         AVG_YRS_TCH_EXP) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, s_t_ratio = STDNT_TCH_RATIO, t_fte = FTE_TCH_TOTAL,
         nbct_count = NATIONAL_BOARD_CERT_TCH_CNT, avg_t_exp = AVG_YRS_TCH_EXP)

# bind teacher data from all years together
teach <- bind_rows(teach12, teach13, teach14, teach15)

# remove unneeded dataframes
rm(teach12, teach13, teach14, teach15)

# reformat teacher data
teach %<>%
  mutate(year = factor(year, levels = c("20112012", "20122013", "20132014", "20142015"),
                       labels = c("2011-2012", "2012-2013", "2013-2014", "2014-2015")),
         s_t_ratio = as.numeric(str_replace_all(s_t_ratio, ":1", "")),
         t_fte = as.numeric(str_replace_all(t_fte, ",", "")),
         nbct_count = as.numeric(str_replace_all(nbct_count, ",", "")),
         nbct_pct = nbct_count / t_fte,
         avg_t_exp = as.numeric(avg_t_exp)) %>%
  select(sch_id, dist_name, sch_name, year, s_t_ratio, t_fte, nbct_count,
         nbct_pct, avg_t_exp)

# select state data
state_teach_stats <- select_state(teach)

# select district data
dist_teach_stats <- select_dist(teach)

# select school data
sch_teach_stats <- select_sch(teach)

# use teacher data for package ####
use_data(state_teach_stats, overwrite = TRUE)
use_data(dist_teach_stats, overwrite = TRUE)
use_data(sch_teach_stats, overwrite = TRUE)

# clean teacher race data ####

# filter out unneeded columns, rename columns
teach_race14 <- demographics14 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR,
         WHITE_FTE_TOTAL, BLACK_FTE_TOTAL, HISPANIC_FTE_TOTAL,
         ASIAN_FTE_TOTAL, AIAN_FTE_TOTAL, HAWAIIAN_FTE_TOTAL,
         TWO_OR_MORE_FTE_TOTAL, RACE_FTE_TOTAL) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, t_white = WHITE_FTE_TOTAL, t_black = BLACK_FTE_TOTAL,
         t_hispanic = HISPANIC_FTE_TOTAL, t_asian = ASIAN_FTE_TOTAL,
         t_aian = AIAN_FTE_TOTAL, t_hawaiian = HAWAIIAN_FTE_TOTAL,
         t_two_plus = TWO_OR_MORE_FTE_TOTAL, t_total = RACE_FTE_TOTAL)

teach_race15 <- demographics15 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR,
         WHITE_FTE_TOTAL, BLACK_FTE_TOTAL, HISPANIC_FTE_TOTAL,
         ASIAN_FTE_TOTAL, AIAN_FTE_TOTAL, HAWAIIAN_FTE_TOTAL,
         TWO_OR_MORE_FTE_TOTAL, RACE_FTE_TOTAL) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, t_white = WHITE_FTE_TOTAL, t_black = BLACK_FTE_TOTAL,
         t_hispanic = HISPANIC_FTE_TOTAL, t_asian = ASIAN_FTE_TOTAL,
         t_aian = AIAN_FTE_TOTAL, t_hawaiian = HAWAIIAN_FTE_TOTAL,
         t_two_plus = TWO_OR_MORE_FTE_TOTAL, t_total = RACE_FTE_TOTAL) %>%
  mutate(t_two_plus = as.numeric(t_two_plus))

# bind teacher data from all years together
teach_race <- bind_rows(teach_race14, teach_race15)

# remove unneeded dataframes
rm(teach_race14, teach_race15)

# reformat teacher data
teach_race %<>%
  mutate(year = factor(year, levels = c("20132014", "20142015"),
                       labels = c("2013-2014", "2014-2015")),
         t_white = as.numeric(str_replace_all(t_white, ",", "")),
         t_black = as.numeric(str_replace_all(t_black, ",", "")),
         t_hispanic = as.numeric(str_replace_all(t_hispanic, ",", "")),
         t_asian = as.numeric(str_replace_all(t_asian, ",", "")),
         t_aian = as.numeric(str_replace_all(t_aian, ",", "")),
         t_hawaiian = as.numeric(str_replace_all(t_hawaiian, ",", "")),
         t_total = as.numeric(str_replace_all(t_total, ",", "")),
         t_white_pct = t_white / t_total,
         t_black_pct = t_black / t_total,
         t_hispanic_pct = t_hispanic / t_total,
         t_asian_pct = t_asian / t_total,
         t_aian_pct = t_aian / t_total,
         t_hawaiian_pct = t_hawaiian / t_total,
         t_two_plus_pct = t_two_plus / t_total)

# create teacher race count data
teach_race_count <- teach_race %>%
  select(sch_id, dist_name, sch_name, year, t_white, t_black, t_hispanic,
         t_asian, t_aian, t_hawaiian, t_two_plus) %>%
  gather(t_race, count, -sch_id, -dist_name, -sch_name, -year) %>%
  mutate(t_race = factor(t_race,
                         levels = c("t_white", "t_black", "t_hispanic",
                                    "t_asian", "t_aian", "t_hawaiian",
                                    "t_two_plus"),
                         labels = c("White","Black", "Hispanic", "Asian",
                                    "American Indian/Alaska Native",
                                    "Hawaiian/Pacific Islander",
                                    "Two or More/Other"))) %>%
  filter(!is.na(count))

# create teacher race pct data
teach_race_pct <- teach_race %>%
  select(sch_id, dist_name, sch_name, year, t_white_pct, t_black_pct,
         t_hispanic_pct, t_asian_pct, t_aian_pct, t_hawaiian_pct,
         t_two_plus_pct) %>%
  gather(t_race, pct, -sch_id, -dist_name, -sch_name, -year) %>%
  mutate(t_race = factor(t_race,
                         levels = c("t_white_pct", "t_black_pct",
                                    "t_hispanic_pct", "t_asian_pct",
                                    "t_aian_pct", "t_hawaiian_pct",
                                    "t_two_plus_pct"),
                         labels = c("White","Black", "Hispanic", "Asian",
                                    "American Indian/Alaska Native",
                                    "Hawaiian/Pacific Islander",
                                    "Two or More/Other"))) %>%
  filter(!is.na(pct))

# select state count data
state_teach_race_count <- select_state(teach_race_count)

# select district count data
dist_teach_race_count <- select_dist(teach_race_count)

# select school count data
sch_teach_race_count <- select_sch(teach_race_count)

# select state pct data
state_teach_race_pct <- select_state(teach_race_pct)

# select district pct data
dist_teach_race_pct <- select_dist(teach_race_pct)

# select school pct data
sch_teach_race_pct <- select_sch(teach_race_pct)

# use teacher data for package ####
use_data(state_teach_race_count, overwrite = TRUE)
use_data(dist_teach_race_count, overwrite = TRUE)
use_data(sch_teach_race_count, overwrite = TRUE)
use_data(state_teach_race_pct, overwrite = TRUE)
use_data(dist_teach_race_pct, overwrite = TRUE)
use_data(sch_teach_race_pct, overwrite = TRUE)

# clean teacher gender data ####

# filter out unneeded columns, rename columns
teach_gender13 <- demographics13 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR,
         MALE_FTE_TOTAL, FEMALE_FTE_TOTAL) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, t_male = MALE_FTE_TOTAL, t_female = FEMALE_FTE_TOTAL)

teach_gender14 <- demographics14 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR,
         MALE_FTE_TOTAL, FEMALE_FTE_TOTAL) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, t_male = MALE_FTE_TOTAL, t_female = FEMALE_FTE_TOTAL)

teach_gender15 <- demographics15 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR,
         MALE_FTE_TOTAL, FEMALE_FTE_TOTAL) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, t_male = MALE_FTE_TOTAL, t_female = FEMALE_FTE_TOTAL)

# bind teacher data from all years together
teach_gender <- bind_rows(teach_gender13, teach_gender14, teach_gender15)

# remove unneeded dataframes
rm(teach_gender13, teach_gender14, teach_gender15)

# reformat teacher data
teach_gender %<>%
  mutate(year = factor(year, levels = c("20122013", "20132014", "20142015"),
                       labels = c("2012-2013", "2013-2014", "2014-2015")),
         t_male = as.numeric(str_replace_all(t_male, ",", "")),
         t_female = as.numeric(str_replace_all(t_female, ",", "")),
         t_total = t_male + t_female,
         t_male_pct = t_male / t_total,
         t_female_pct = t_female / t_total)

# create teacher gender count data
teach_gender_count <- teach_gender %>%
  select(sch_id, dist_name, sch_name, year, t_male, t_female) %>%
  gather(t_gender, count, -sch_id, -dist_name, -sch_name, -year) %>%
  mutate(t_gender = factor(t_gender,
                           levels = c("t_male", "t_female"),
                           labels = c("Male", "Female"))) %>%
  filter(!is.na(count))

# create teacher race pct data
teach_gender_pct <- teach_gender %>%
  select(sch_id, dist_name, sch_name, year, t_male_pct, t_female_pct) %>%
  gather(t_gender, pct, -sch_id, -dist_name, -sch_name, -year) %>%
  mutate(t_gender = factor(t_gender,
                           levels = c("t_male_pct", "t_female_pct"),
                           labels = c("Male", "Female"))) %>%
  filter(!is.na(pct))

# select state count data
state_teach_gender_count <- select_state(teach_gender_count)

# select district count data
dist_teach_gender_count <- select_dist(teach_gender_count)

# select school count data
sch_teach_gender_count <- select_sch(teach_gender_count)

# select state pct data
state_teach_gender_pct <- select_state(teach_gender_pct)

# select district pct data
dist_teach_gender_pct <- select_dist(teach_gender_pct)

# select schpp; pct data
sch_teach_gender_pct <- select_sch(teach_gender_pct)

# use teacher data for package ####
use_data(state_teach_gender_count, overwrite = TRUE)
use_data(dist_teach_gender_count, overwrite = TRUE)
use_data(sch_teach_gender_count, overwrite = TRUE)
use_data(state_teach_gender_pct, overwrite = TRUE)
use_data(dist_teach_gender_pct, overwrite = TRUE)
use_data(sch_teach_gender_pct, overwrite = TRUE)
