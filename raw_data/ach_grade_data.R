# kprep_grade.R
#
# this script is used to transform the raw excel files from the school report
# cards website and create the following dataframes in the kysrc package:
#
# kprep_grade
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
library(stringr)
library(magrittr)

# load data
grade12 <- read_excel("raw_data/data12/ACCOUNTABILITY_ACHIEVEMENT_GRADE.xlsx")
grade13 <- read_excel("raw_data/data13/ACCOUNTABILITY_ACHIEVEMENT_GRADE.xlsx")
grade14 <- read_excel("raw_data/data14/ACCOUNTABILITY_ACHIEVEMENT_GRADE.xlsx")
grade15 <- read_excel("raw_data/data15/ACCOUNTABILITY_ACHIEVEMENT_GRADE.xlsx")
grade16 <- read_excel("raw_data/data16/ACCOUNTABILITY_ACHIEVEMENT_GRADE.xlsx")
grade17 <- read_excel("raw_data/data17/ACCOUNTABILITY_ACHIEVEMENT_GRADE.xlsx")

source("raw_data/function_help.R")

# clean data ####

# convert colnames to lower
colnames(grade12) <- col_lower(grade12)
colnames(grade13) <- col_lower(grade13)
colnames(grade14) <- col_lower(grade14)
colnames(grade15) <- col_lower(grade15)
colnames(grade16) <- col_lower(grade16)
colnames(grade17) <- col_lower(grade17)


# filter out unneeded columns, rename columns
grade12_clean <- grade12 %>%
  select(sch_cd, dist_name, sch_name, sch_year, grade_level, content_type,
         disagg_label, nbr_tested, pct_novice, pct_apprentice, pct_proficient,
         pct_distinguished, pct_proficient_distinguished,
         pct_bonus, napd_calculation)

grade13_clean <- grade13 %>%
  select(sch_cd, dist_name, sch_name, sch_year, grade_level, content_type,
         disagg_label, nbr_tested, pct_novice, pct_apprentice, pct_proficient,
         pct_distinguished, pct_proficient_distinguished,
         pct_bonus, napd_calculation)

grade14_clean <- grade14 %>%
  select(sch_cd, dist_name, sch_name, sch_year, grade_level, content_type,
         disagg_label, nbr_tested, pct_novice, pct_apprentice, pct_proficient,
         pct_distinguished, pct_proficient_distinguished,
         pct_bonus, napd_calculation)

grade15_clean <- grade15 %>%
  select(sch_cd, dist_name, sch_name, sch_year, grade_level, content_type,
         disagg_label, nbr_tested, pct_novice, pct_apprentice, pct_proficient,
         pct_distinguished, pct_proficient_distinguished,
         pct_bonus, napd_calculation)

grade16_clean <- grade16 %>%
  select(sch_cd, dist_name, sch_name, sch_year, grade_level, content_type,
         disagg_label, nbr_tested, pct_novice, pct_apprentice, pct_proficient,
         pct_distinguished, pct_proficient_distinguished,
         pct_bonus, napd_calculation) %>%
  mutate(sch_year = as.character(sch_year))

grade17_clean <- grade17 %>%
  select(sch_cd, dist_name, sch_name, sch_year, grade_level, content_type,
         disagg_label, nbr_tested, pct_novice, pct_apprentice, pct_proficient,
         pct_distinguished, pct_proficient_distinguished,
         pct_bonus, napd_calculation) %>%
  mutate(sch_year = as.character(sch_year))

# bind kprep grade data from all years into one dataframe
ach_grade <- bind_rows(grade12_clean, grade13_clean,
                        grade14_clean, grade15_clean,
                        grade16_clean, grade17_clean) %>%
  rename(sch_id = sch_cd, year = sch_year,
         grade = grade_level, subject = content_type,
         student_group = disagg_label, n_tested = nbr_tested,
         novice_pct = pct_novice, apprentice_pct = pct_apprentice,
         proficient_pct = pct_proficient, distinguished_pct = pct_distinguished,
         prof_dist_pct = pct_proficient_distinguished,
         bonus_pct = pct_bonus, napd_calc = napd_calculation) %>%
  mutate(year = factor(year, levels = c("20112012", "20122013",
                                        "20132014", "20142015",
                                        "20152016", "20162017"),
                       labels = c("2011-2012", "2012-2013",
                                  "2013-2014", "2014-2015",
                                  "2015-2016", "2016-2017")),
         grade = factor(grade,
                          levels = c("03", "04", "05", "06", "07", "08",
                                   "09", "10", "11", "EO"),
                           labels = c("3", "4", "5", "6", "7", "8",
                                      "9", "10", "11", "EO")),
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

# remove old dataframes
rm(grade12, grade13, grade14, grade15, grade12_clean, grade13_clean,
   grade14_clean, grade15_clean, grade16, grade16_clean)

# select state data
ach_grade_state <- select_state(ach_grade)

# select district data
ach_grade_dist <- select_dist(ach_grade)

# select school data
ach_grade_sch <- select_sch(ach_grade)

# use data for package ####
use_data(ach_grade_sch, overwrite = TRUE)
use_data(ach_grade_dist, overwrite = TRUE)
use_data(ach_grade_state, overwrite = TRUE)
