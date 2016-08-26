# kprep_eoc_levels.R
#
# this script is used to transform the raw excel files from the school report
# cards website and create the following dataframes in the kysrc package:
#
# kprep_eco_levels
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
eoc12 <- read_excel("raw_data/data12/ASSESSMENT_KPREP_EOC.xlsx")
eoc13 <- read_excel("raw_data/data13/ASSESSMENT_KPREP_EOC.xlsx")
eoc14 <- read_excel("raw_data/data14/ASSESSMENT_KPREP_EOC.xlsx")
eoc15 <- read_excel("raw_data/data15/ASSESSMENT_KPREP_EOC.xlsx")


# clean data ####


# filter out unneeded columns, rename columns
# filter out unneeded columns, rename columns
eoc12_clean <- eoc12 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR, CONTENT_TYPE,
         DISAGG_LABEL, NBR_TESTED, PCT_NOVICE, PCT_APPRENTICE, PCT_PROFICIENT,
         PCT_DISTINGUISHED, PCT_PROFICIENT_DISTINGUISHED) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, subject = CONTENT_TYPE,
         student_group = DISAGG_LABEL, n_tested = NBR_TESTED,
         novice_pct = PCT_NOVICE, apprentice_pct = PCT_APPRENTICE,
         proficient_pct = PCT_PROFICIENT, distinguished_pct = PCT_DISTINGUISHED,
         prof_dist_pct = PCT_PROFICIENT_DISTINGUISHED)

eoc13_clean <- eoc13 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR, CONTENT_TYPE,
         DISAGG_LABEL, NBR_TESTED, PCT_NOVICE, PCT_APPRENTICE, PCT_PROFICIENT,
         PCT_DISTINGUISHED, PCT_PROFICIENT_DISTINGUISHED) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, subject = CONTENT_TYPE,
         student_group = DISAGG_LABEL, n_tested = NBR_TESTED,
         novice_pct = PCT_NOVICE, apprentice_pct = PCT_APPRENTICE,
         proficient_pct = PCT_PROFICIENT, distinguished_pct = PCT_DISTINGUISHED,
         prof_dist_pct = PCT_PROFICIENT_DISTINGUISHED)

eoc14_clean <- eoc14 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR, CONTENT_TYPE,
         DISAGG_LABEL, NBR_TESTED, PCT_NOVICE, PCT_APPRENTICE, PCT_PROFICIENT,
         PCT_DISTINGUISHED, PCT_PROFICIENT_DISTINGUISHED) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, subject = CONTENT_TYPE,
         student_group = DISAGG_LABEL, n_tested = NBR_TESTED,
         novice_pct = PCT_NOVICE, apprentice_pct = PCT_APPRENTICE,
         proficient_pct = PCT_PROFICIENT, distinguished_pct = PCT_DISTINGUISHED,
         prof_dist_pct = PCT_PROFICIENT_DISTINGUISHED)

eoc15_clean <- eoc15 %>%
  select(SCH_CD, DIST_NAME, SCH_NAME, SCH_YEAR, CONTENT_TYPE,
         DISAGG_LABEL, NBR_TESTED, PCT_NOVICE, PCT_APPRENTICE, PCT_PROFICIENT,
         PCT_DISTINGUISHED, PCT_PROFICIENT_DISTINGUISHED) %>%
  rename(sch_id = SCH_CD, dist_name = DIST_NAME, sch_name = SCH_NAME,
         year = SCH_YEAR, subject = CONTENT_TYPE,
         student_group = DISAGG_LABEL, n_tested = NBR_TESTED,
         novice_pct = PCT_NOVICE, apprentice_pct = PCT_APPRENTICE,
         proficient_pct = PCT_PROFICIENT, distinguished_pct = PCT_DISTINGUISHED,
         prof_dist_pct = PCT_PROFICIENT_DISTINGUISHED)

# bind kprep eoc level data from all years into one dataframe
kprep_eoc_levels <- bind_rows(eoc12_clean, eoc13_clean,
                              eoc14_clean, eoc15_clean)

# remove old dataframes
rm(eoc12, eoc13, eoc14, eoc15, eoc12_clean, eoc13_clean, eoc14_clean, eoc15_clean)

# clean data formatting
kprep_eoc_levels %<>%
  mutate(year = factor(year, levels = c("20112012", "20122013", "20132014", "20142015"),
                       labels = c("2011-2012", "2012-2013", "2013-2014", "2014-2015")),
         subject = factor(subject),
         student_group = factor(student_group),
         n_tested = as.numeric(n_tested),
         novice_pct = as.numeric(novice_pct) / 100,
         apprentice_pct = as.numeric(apprentice_pct) / 100,
         proficient_pct = as.numeric(proficient_pct) / 100,
         distinguished_pct = as.numeric(distinguished_pct) / 100,
         prof_dist_pct = as.numeric(prof_dist_pct) / 100)
