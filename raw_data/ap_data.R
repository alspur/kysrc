# ap_data.R
#
# this script is used to transform the raw excel files from the school report
# cards website and create the following dataframes in the kysrc package:
#
# ap_state
# ap_dist
# ap_sch
#
# this script is included in .Rbuildignore along with all of
# the assocaited excel files.
#
# 11-12 thru 15-16 data obtained on 2016-10-13 and
# 16-17 data obtained on 2017-09-28 from:
# https://applications.education.ky.gov/src/

# load data --------------

# load packages
library(devtools)
library(readxl)
library(dplyr)
library(tidyr)
library(stringr)
library(magrittr)

# load data
ap13 <- read_excel("raw_data/data13/ASSESSMENT_ADVANCE_PLACEMENT.xlsx")
ap14 <- read_excel("raw_data/data14/ASSESSMENT_ADVANCE_PLACEMENT.xlsx")
ap15 <- read_excel("raw_data/data15/ASSESSMENT_ADVANCE_PLACEMENT.xlsx")
ap16 <- read_excel("raw_data/data16/ASSESSMENT_ADVANCE_PLACEMENT.xlsx")
ap17 <- read_excel("raw_data/data17/ASSESSMENT_ADVANCE_PLACEMENT.xlsx",
                   col_types = "text")

# load helper functions
source("raw_data/function_help.R")

# clean data ------------

ap_clean <- function(df){

  colnames(df) <- tolower(colnames(df))

  df %>%
    rename(year = sch_year,
           sch_id = sch_cd,
           student_group = disagg_label,
           ap_n_tested = test_takers_cnt,
           ap_pct_tested = test_takers_pct,
           exam_cnt = exam_taken_cnt,
           exam_3plus = exam_taken_grade3to5_cnt,
           exam_3plus_pct = exam_taken_grade3to5_pct) %>%
    select(sch_id, dist_name, sch_name, year, student_group,
           ap_n_tested, ap_pct_tested, exam_cnt, exam_3plus,
           exam_3plus_pct)

}

# clean ap data
ap13_clean <- ap_clean(ap13)
ap14_clean <- ap_clean(ap14)
ap15_clean <- ap_clean(ap15)
ap16_clean <- ap_clean(ap16)
ap17_clean <- ap_clean(ap17) %>%
  mutate(year = as.numeric(year))

# join ap data
ap_data <- bind_rows(ap13_clean, ap14_clean, ap15_clean, ap16_clean, ap17_clean)

# remove old dfs
rm(ap13, ap14, ap15, ap16, ap17,
   ap13_clean, ap14_clean, ap15_clean, ap16_clean, ap17_clean)

# clean up variable types
ap <- ap_data %>%
  mutate(year = factor(year, levels = c("20112012", "20122013",
                                       "20132014", "20142015",
                                       "20152016", "20162017"),
                      labels = c("2011-2012", "2012-2013",
                                 "2013-2014", "2014-2015",
                                 "2015-2016", "2016-2017")),
         student_group = factor(student_group),
         ap_n_tested = char_to_num(ap_n_tested),
         ap_pct_tested = pct_to_num(ap_pct_tested),
         exam_cnt = char_to_num(exam_cnt),
         exam_3plus = char_to_num(exam_3plus),
         exam_3plus_pct = pct_to_num(exam_3plus_pct))

# prep data for export
ap_state <- select_state(ap)
ap_dist <- select_dist(ap)
ap_sch <- select_sch(ap)

# export data -----------

use_data(ap_state, overwrite = TRUE)
use_data(ap_dist, overwrite = TRUE)
use_data(ap_sch, overwrite = TRUE)
