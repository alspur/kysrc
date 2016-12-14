# program_data
#
#
# this script is used to transform the raw excel files from the school report
# cards website and create the following dataframes in the kysrc package:
#
# lep_state
# lep_dist
# lep_sch
#
# iep_state
# iep_dist
# iep_sch
#
# lep and iep rates
# 12-13 thru 15-16
# data not available for 11-12 school year
#
# this script is included in .Rbuildignore along with all of
# the assocaited excel files.

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



# load helper functions
source("raw_data/function_help.R")


# read lep data
lep13 <- read_excel("raw_data/data13/LEARNING_ENVIRONMENT_PROGRAMS.xlsx", sheet = 1)
lep14 <- read_excel("raw_data/data14/LEARNING_ENVIRONMENT_PROGRAMS.xlsx", sheet = 1)
lep15 <- read_excel("raw_data/data15/LEARNING_ENVIRONMENT_PROGRAMS.xlsx", sheet = 1)
lep16 <- read_excel("raw_data/data16/LEARNING_ENVIRONMENT_PROGRAMS.xlsx", sheet = 1)

# read iep data
iep13 <- read_excel("raw_data/data13/LEARNING_ENVIRONMENT_PROGRAMS.xlsx", sheet = 3)
iep14 <- read_excel("raw_data/data14/LEARNING_ENVIRONMENT_PROGRAMS.xlsx", sheet = 3)
iep15 <- read_excel("raw_data/data15/LEARNING_ENVIRONMENT_PROGRAMS.xlsx", sheet = 3)
iep16 <- read_excel("raw_data/data16/LEARNING_ENVIRONMENT_PROGRAMS.xlsx", sheet = 5)



# clean data ####

# convert colnames to lowercase
colnames(lep13) <- col_lower(lep13)
colnames(lep13)[9] <- "total_pct"
colnames(lep14) <- col_lower(lep14)
colnames(lep15) <- col_lower(lep15)
colnames(lep16) <- col_lower(lep16)

colnames(iep13) <- col_lower(iep13)
colnames(iep13)[9] <- "total_pct"
colnames(iep14) <- col_lower(iep14)
colnames(iep15) <- col_lower(iep15)
colnames(iep16) <- col_lower(iep16)

# clean columns
lep13_clean <- lep13 %>%
  select(sch_cd, dist_name, sch_name, sch_year, disagg_label,
         total_cnt, total_pct) %>%
  rename(sch_id = sch_cd, year = sch_year,
         student_group = disagg_label, lep_total = total_cnt,
         lep_pct = total_pct)


lep14_clean <- lep14 %>%
  select(sch_cd, dist_name, sch_name, sch_year, disagg_label,
         total_cnt, total_pct) %>%
  rename(sch_id = sch_cd, year = sch_year,
         student_group = disagg_label, lep_total = total_cnt,
         lep_pct = total_pct)

lep15_clean <- lep15 %>%
  select(sch_cd, dist_name, sch_name, sch_year, disagg_label,
         total_cnt, total_pct) %>%
  rename(sch_id = sch_cd, year = sch_year,
         student_group = disagg_label, lep_total = total_cnt,
         lep_pct = total_pct)

lep16_clean <- lep16 %>%
  select(sch_cd, dist_name, sch_name, sch_year, disagg_label,
         total_cnt, total_pct) %>%
  rename(sch_id = sch_cd, year = sch_year,
         student_group = disagg_label, lep_total = total_cnt,
         lep_pct = total_pct)

iep13_clean <- iep13 %>%
  select(sch_cd, dist_name, sch_name, sch_year, disagg_label,
         total_cnt, total_pct) %>%
  rename(sch_id = sch_cd, year = sch_year,
         student_group = disagg_label, iep_total = total_cnt,
         iep_pct = total_pct)


iep14_clean <- iep14 %>%
  select(sch_cd, dist_name, sch_name, sch_year, disagg_label,
         total_cnt, total_pct) %>%
  rename(sch_id = sch_cd, year = sch_year,
         student_group = disagg_label, iep_total = total_cnt,
         iep_pct = total_pct)

iep15_clean <- iep15 %>%
  select(sch_cd, dist_name, sch_name, sch_year, disagg_label,
         total_cnt, total_pct) %>%
  rename(sch_id = sch_cd, year = sch_year,
         student_group = disagg_label, iep_total = total_cnt,
         iep_pct = total_pct)

iep16_clean <- iep16 %>%
  select(sch_cd, dist_name, sch_name, sch_year, disagg_label,
         total_cnt, total_pct) %>%
  rename(sch_id = sch_cd, year = sch_year,
         student_group = disagg_label, iep_total = total_cnt,
         iep_pct = total_pct)

# join data
lep_data <- bind_rows(lep13_clean, lep14_clean, lep15_clean, lep16_clean) %>%
  mutate(year = factor(year, levels = c(20112012, 20122013, 20132014,
                                        20142015, 20152016),
                       labels = c("2011-2012", "2012-2013",
                                  "2013-2014", "2014-2015",
                                  "2015-2016")),
         student_group = as.factor(student_group),
         lep_total = char_to_num(lep_total),
         lep_pct = pct_to_num(lep_pct))


iep_data <- bind_rows(iep13_clean, iep14_clean, iep15_clean, iep16_clean) %>%
  mutate(year = factor(year, levels = c(20112012, 20122013, 20132014,
                                        20142015, 20152016),
                       labels = c("2011-2012", "2012-2013",
                                  "2013-2014", "2014-2015",
                                  "2015-2016")),
         student_group = as.factor(student_group),
         iep_total = char_to_num(iep_total),
         iep_pct = pct_to_num(iep_pct))

# select state data
lep_state <- select_state(lep_data)
iep_state <- select_state(iep_data)

# select district data
lep_dist <- select_dist(lep_data)
iep_dist <- select_dist(iep_data)

# select school data
lep_sch <- select_sch(lep_data)
iep_sch <- select_sch(iep_data)

# save data ####

use_data(lep_state, overwrite = TRUE)
use_data(lep_dist, overwrite = TRUE)
use_data(lep_sch, overwrite = TRUE)


use_data(iep_state, overwrite = TRUE)
use_data(iep_dist, overwrite = TRUE)
use_data(iep_sch, overwrite = TRUE)
