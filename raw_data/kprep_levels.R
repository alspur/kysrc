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

# load data
levels12 <- read_excel("raw_data/data12/ASSESSMENT_KPREP_LEVEL.xlsx")
levels13 <- read_excel("raw_data/data13/ASSESSMENT_KPREP_LEVEL.xlsx", sheet = 2)
levels14 <- read_excel("raw_data/data14/ASSESSMENT_KPREP_LEVEL.xlsx")
levels15 <- read_excel("raw_data/data15/ASSESSMENT_KPREP_LEVEL.xlsx")

# clean data ####


# filter out unneeded columns, rename columns
levels12_clean <- levels12 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR, CONTENT_LEVEL, CONTENT_TYPE,
         DISAGG_LABEL, NBR_TESTED, PCT_NOVICE, PCT_APPRENTICE, PCT_PROFICIENT,
         PCT_DISTINGUISHED, PCT_PROFICIENT_DISTINGUISHED) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, school_level = CONTENT_LEVEL, subject = CONTENT_TYPE,
         student_group = DISAGG_LABEL, n_tested = NBR_TESTED,
         novice_pct = PCT_NOVICE, apprentice_pct = PCT_APPRENTICE,
         proficient_pct = PCT_PROFICIENT, distinguished_pct = PCT_DISTINGUISHED,
         prof_dist_pct = PCT_PROFICIENT_DISTINGUISHED)

levels13_clean <- levels13 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR, CONTENT_LEVEL, CONTENT_TYPE,
         DISAGG_LABEL, NBR_TESTED, PCT_NOVICE, PCT_APPRENTICE, PCT_PROFICIENT,
         PCT_DISTINGUISHED, PCT_PROFICIENT_DISTINGUISHED) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, school_level = CONTENT_LEVEL, subject = CONTENT_TYPE,
         student_group = DISAGG_LABEL, n_tested = NBR_TESTED,
         novice_pct = PCT_NOVICE, apprentice_pct = PCT_APPRENTICE,
         proficient_pct = PCT_PROFICIENT, distinguished_pct = PCT_DISTINGUISHED,
         prof_dist_pct = PCT_PROFICIENT_DISTINGUISHED)

levels14_clean <- levels14 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR, CONTENT_LEVEL, CONTENT_TYPE,
         DISAGG_LABEL, NBR_TESTED, PCT_NOVICE, PCT_APPRENTICE, PCT_PROFICIENT,
         PCT_DISTINGUISHED, PCT_PROFICIENT_DISTINGUISHED) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, school_level = CONTENT_LEVEL, subject = CONTENT_TYPE,
         student_group = DISAGG_LABEL, n_tested = NBR_TESTED,
         novice_pct = PCT_NOVICE, apprentice_pct = PCT_APPRENTICE,
         proficient_pct = PCT_PROFICIENT, distinguished_pct = PCT_DISTINGUISHED,
         prof_dist_pct = PCT_PROFICIENT_DISTINGUISHED)

levels15_clean <- levels15 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR, CONTENT_LEVEL, CONTENT_TYPE,
         DISAGG_LABEL, NBR_TESTED, PCT_NOVICE, PCT_APPRENTICE, PCT_PROFICIENT,
         PCT_DISTINGUISHED, PCT_PROFICIENT_DISTINGUISHED) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, school_level = CONTENT_LEVEL, subject = CONTENT_TYPE,
         student_group = DISAGG_LABEL, n_tested = NBR_TESTED,
         novice_pct = PCT_NOVICE, apprentice_pct = PCT_APPRENTICE,
         proficient_pct = PCT_PROFICIENT, distinguished_pct = PCT_DISTINGUISHED,
         prof_dist_pct = PCT_PROFICIENT_DISTINGUISHED)

# bind kprep level data from all years into one dataframe
kprep_levels <- bind_rows(levels12_clean, levels13_clean,
                          levels14_clean, levels15_clean)

# remove old dataframes
rm(levels12, levels13, levels14, levels15, levels12_clean, levels13_clean,
   levels14_clean, levels15_clean)

# clean data formatting
kprep_levels %<>%
  mutate(year = factor(year, levels = c("20112012", "20122013", "20132014", "20142015"),
                       labels = c("2011-2012", "2012-2013", "2013-2014", "2014-2015")),
         school_level = factor(school_level, levels = c("Elementary School",
                                                        "Middle School",
                                                        "High School")),
         subject = factor(subject),
         student_group = factor(student_group),
         n_tested = as.numeric(n_tested),
         novice_pct = as.numeric(novice_pct) / 100,
         apprentice_pct = as.numeric(apprentice_pct) / 100,
         proficient_pct = as.numeric(proficient_pct) / 100,
         distinguished_pct = as.numeric(distinguished_pct) / 100,
         prof_dist_pct = as.numeric(prof_dist_pct) / 100)

# select state data
state_kprep_levels <- kprep_levels %>%
  filter(sch_id == 999) %>% # filter for state id number
  select(-sch_name) # remove redundant column - all values are "State Total"


# select district data
dist_kprep_levels <- kprep_levels %>%
  filter(sch_id != 999) %>% # exclude state id number
  filter(str_length(sch_id) == 3) %>% # only include id numbers w/ 3 chars
  select(-sch_name) # remove redundant col - all values are "District Total"

# select school data
sch_kprep_levels <- kprep_levels %>%
  filter(str_length(sch_id) == 6) # only include id numbers w/ 6 chars

# use data for package ####
use_data(sch_kprep_levels, overwrite = TRUE)
use_data(dist_kprep_levels, overwrite = TRUE)
use_data(state_kprep_levels, overwrite = TRUE)
