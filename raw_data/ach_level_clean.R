# kprep_levels.R
#
# this script is used to transform the raw excel files from the school report
# cards website and create the following dataframes in the kysrc package:
#
# kprep_levels
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

# load data
levels12 <- read_excel("raw_data/data12/ACCOUNTABILITY_ACHIEVEMENT_LEVEL.xlsx", sheet = 2)
levels13 <- read_excel("raw_data/data13/ACCOUNTABILITY_ACHIEVEMENT_LEVEL.xlsx", sheet = 2)
levels14 <- read_excel("raw_data/data14/ACCOUNTABILITY_ACHIEVEMENT_LEVEL.xlsx")
levels15 <- read_excel("raw_data/data15/ACCOUNTABILITY_ACHIEVEMENT_LEVEL.xlsx")
levels16 <- read_excel("raw_data/data16/ACCOUNTABILITY_ACHIEVEMENT_LEVEL.xlsx")

# clean data ####

# create function to convert chars to nums, handling "," in 1000+ numbers
char_to_num <- function(string = ""){
  as.numeric(str_replace_all(string, ",", ""))
}


# filter out unneeded columns, rename columns
levels12_clean <- levels12 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR, CONTENT_LEVEL, CONTENT_TYPE,
         DISAGG_LABEL, NBR_TESTED, PCT_NOVICE, PCT_APPRENTICE, PCT_PROFICIENT,
         PCT_DISTINGUISHED, PCT_PROFICIENT_DISTINGUISHED,
         PCT_BONUS, NAPD_CALCULATION) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, school_level = CONTENT_LEVEL, subject = CONTENT_TYPE,
         student_group = DISAGG_LABEL, n_tested = NBR_TESTED,
         novice_pct = PCT_NOVICE, apprentice_pct = PCT_APPRENTICE,
         proficient_pct = PCT_PROFICIENT, distinguished_pct = PCT_DISTINGUISHED,
         prof_dist_pct = PCT_PROFICIENT_DISTINGUISHED,
         bonus_pct = PCT_BONUS, napd_calc = NAPD_CALCULATION)

levels13_clean <- levels13 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR, CONTENT_LEVEL, CONTENT_TYPE,
         DISAGG_LABEL, NBR_TESTED, PCT_NOVICE, PCT_APPRENTICE, PCT_PROFICIENT,
         PCT_DISTINGUISHED, PCT_PROFICIENT_DISTINGUISHED,
         PCT_BONUS, NAPD_CALCULATION) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, school_level = CONTENT_LEVEL, subject = CONTENT_TYPE,
         student_group = DISAGG_LABEL, n_tested = NBR_TESTED,
         novice_pct = PCT_NOVICE, apprentice_pct = PCT_APPRENTICE,
         proficient_pct = PCT_PROFICIENT, distinguished_pct = PCT_DISTINGUISHED,
         prof_dist_pct = PCT_PROFICIENT_DISTINGUISHED,
         bonus_pct = PCT_BONUS, napd_calc = NAPD_CALCULATION)

levels14_clean <- levels14 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR, CONTENT_LEVEL, CONTENT_TYPE,
         DISAGG_LABEL, NBR_TESTED, PCT_NOVICE, PCT_APPRENTICE, PCT_PROFICIENT,
         PCT_DISTINGUISHED, PCT_PROFICIENT_DISTINGUISHED,
         PCT_BONUS, NAPD_CALCULATION) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, school_level = CONTENT_LEVEL, subject = CONTENT_TYPE,
         student_group = DISAGG_LABEL, n_tested = NBR_TESTED,
         novice_pct = PCT_NOVICE, apprentice_pct = PCT_APPRENTICE,
         proficient_pct = PCT_PROFICIENT, distinguished_pct = PCT_DISTINGUISHED,
         prof_dist_pct = PCT_PROFICIENT_DISTINGUISHED,
         bonus_pct = PCT_BONUS, napd_calc = NAPD_CALCULATION)

levels15_clean <- levels15 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR, CONTENT_LEVEL, CONTENT_TYPE,
         DISAGG_LABEL, NBR_TESTED, PCT_NOVICE, PCT_APPRENTICE, PCT_PROFICIENT,
         PCT_DISTINGUISHED, PCT_PROFICIENT_DISTINGUISHED,
         PCT_BONUS, NAPD_CALCULATION) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, school_level = CONTENT_LEVEL, subject = CONTENT_TYPE,
         student_group = DISAGG_LABEL, n_tested = NBR_TESTED,
         novice_pct = PCT_NOVICE, apprentice_pct = PCT_APPRENTICE,
         proficient_pct = PCT_PROFICIENT, distinguished_pct = PCT_DISTINGUISHED,
         prof_dist_pct = PCT_PROFICIENT_DISTINGUISHED,
         bonus_pct = PCT_BONUS, napd_calc = NAPD_CALCULATION)

levels16_clean <- levels16 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR, CONTENT_LEVEL, CONTENT_TYPE,
         DISAGG_LABEL, NBR_TESTED, PCT_NOVICE, PCT_APPRENTICE, PCT_PROFICIENT,
         PCT_DISTINGUISHED, PCT_PROFICIENT_DISTINGUISHED,
         PCT_BONUS, NAPD_CALCULATION) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, school_level = CONTENT_LEVEL, subject = CONTENT_TYPE,
         student_group = DISAGG_LABEL, n_tested = NBR_TESTED,
         novice_pct = PCT_NOVICE, apprentice_pct = PCT_APPRENTICE,
         proficient_pct = PCT_PROFICIENT, distinguished_pct = PCT_DISTINGUISHED,
         prof_dist_pct = PCT_PROFICIENT_DISTINGUISHED,
         bonus_pct = PCT_BONUS, napd_calc = NAPD_CALCULATION) %>%
  mutate(year = as.character(year))

# bind kprep level data from all years into one dataframe
ach_levels <- bind_rows(levels12_clean, levels13_clean,
                          levels14_clean, levels15_clean,
                          levels16_clean)

# remove old dataframes
rm(levels12, levels13, levels14, levels15, levels12_clean, levels13_clean,
   levels14_clean, levels15_clean, levels16, levels16_clean)

# clean data formatting
ach_levels %<>%
  mutate(year = factor(year, levels = c("20112012", "20122013",
                                        "20132014", "20142015",
                                        "20152016"),
                       labels = c("2011-2012", "2012-2013",
                                  "2013-2014", "2014-2015",
                                  "2015-2016")),
         school_level = factor(school_level, levels = c("Elementary School",
                                                        "Middle School",
                                                        "High School")),
         subject = factor(subject),
         student_group = factor(student_group),
         n_tested = char_to_num(n_tested),
         novice_pct = as.numeric(novice_pct) / 100,
         apprentice_pct = as.numeric(apprentice_pct) / 100,
         proficient_pct = as.numeric(proficient_pct) / 100,
         distinguished_pct = as.numeric(distinguished_pct) / 100,
         prof_dist_pct = as.numeric(prof_dist_pct) / 100,
         bonus_pct = as.numeric(bonus_pct) / 100,
         napd_calc = as.numeric(napd_calc) / 100)

# select state data
ach_level_state <-ach_levels %>%
  filter(sch_id == 999) %>% # filter for state id number
  select(-sch_name) # remove redundant column - all values are "State Total"


# select district data
ach_level_dist <- ach_levels %>%
  filter(sch_id != 999) %>% # exclude state id number
  filter(str_length(sch_id) == 3) %>% # only include id numbers w/ 3 chars
  select(-sch_name) # remove redundant col - all values are "District Total"

# select school data
ach_level <- ach_levels %>%
  filter(str_length(sch_id) == 6) # only include id numbers w/ 6 chars

# use data for package ####
use_data(ach_level, overwrite = TRUE)
use_data(ach_level_dist, overwrite = TRUE)
use_data(ach_level_state, overwrite = TRUE)
