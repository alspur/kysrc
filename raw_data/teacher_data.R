# teacher_data.R
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

# load data ----------------------

# load packages
library(devtools)
library(readxl)
library(dplyr)
library(tidyr)
library(magrittr)
library(stringr)

source("raw_data/function_help.R")

# load raw data
teach12 <- read_excel("raw_data/data12/LEARNING_ENVIRONMENT_STUDENTS-TEACHERS.xlsx", sheet = 1)
teach13 <- read_excel("raw_data/data13/LEARNING_ENVIRONMENT_STUDENTS-TEACHERS.xlsx", sheet = 1)
teach14 <- read_excel("raw_data/data14/LEARNING_ENVIRONMENT_STUDENTS-TEACHERS.xlsx", sheet = 1)
teach15 <- read_excel("raw_data/data15/LEARNING_ENVIRONMENT_STUDENTS-TEACHERS.xlsx", sheet = 1)
teach16 <- read_excel("raw_data/data16/LEARNING_ENVIRONMENT_STUDENTS-TEACHERS.xlsx", sheet = 1)
teach17 <- read_excel("raw_data/data17/LEARNING_ENVIRONMENT_STUDENTS-TEACHERS.xlsx", sheet = 2)

# clean data ----------------------

teach_clean12 <- function(df){

  colnames(df) <- tolower(colnames(df))

  df %>%
    rename(sch_id = sch_cd,
           year = sch_year,
           fte_total = fulltime_tch_total,
           nbct_cnt = national_board_cert_tch_cnt,
           avg_t_exp = avg_yrs_tch_exp,
           ba_pct = prof_qual_ba_pct,
           ma_pct = prof_qual_ma_pct,
           rank1_pct = prof_qual_rank1_pct,
           special_pct = prof_qual_specialist_pct,
           dr_pct = prof_qual_doctorate_pct,
           t_degree_pct = prof_qual_tch_pct,
           prov_pct = tch_prov_cert_pct,
           s_per_t = stdnt_tch_ratio) %>%
    select(sch_id, dist_name, sch_name, year, fte_total, nbct_cnt, avg_t_exp,
           ba_pct, ma_pct, rank1_pct, special_pct, dr_pct,
           t_degree_pct, prov_pct, s_per_t)
}

teach_clean13 <- function(df){

  colnames(df) <- tolower(colnames(df))

  df %>%
    rename(sch_id = sch_cd,
           year = sch_year,
           fte_total = fte_tch_total,
           nbct_cnt = national_board_cert_tch_cnt,
           avg_t_exp = avg_yrs_tch_exp,
           ba_pct = prof_qual_ba_pct,
           ma_pct = prof_qual_ma_pct,
           rank1_pct = prof_qual_rank1_pct,
           special_pct = prof_qual_specialist_pct,
           dr_pct = prof_qual_doctorate_pct,
           t_degree_pct = prof_qual_tch_pct,
           prov_pct = tch_prov_cert_pct,
           s_per_t = stdnt_tch_ratio) %>%
    select(sch_id, dist_name, sch_name, year, fte_total, nbct_cnt, avg_t_exp,
           ba_pct, ma_pct, rank1_pct, special_pct, dr_pct,
           t_degree_pct, prov_pct, s_per_t)
}

teach_clean <- function(df){

  colnames(df) <- tolower(colnames(df))

  df %>%
    rename(sch_id = sch_cd,
           year = sch_year,
           fte_total = fte_tch_total,
           fte_male = male_fte_total,
           fte_female = female_fte_total,
           fte_white = white_fte_total,
           fte_black = black_fte_total,
           fte_hispanic = hispanic_fte_total,
           fte_asian = asian_fte_total,
           fte_aian = aian_fte_total,
           fte_hawaiian = hawaiian_fte_total,
           fte_2more = two_or_more_fte_total,
           fte_race_total = race_fte_total,
           nbct_cnt = national_board_cert_tch_cnt,
           avg_t_exp = avg_yrs_tch_exp,
           ba_pct = prof_qual_ba_pct,
           ma_pct = prof_qual_ma_pct,
           rank1_pct = prof_qual_rank1_pct,
           special_pct = prof_qual_specialist_pct,
           dr_pct = prof_qual_doctorate_pct,
           t_degree_pct = prof_qual_tch_pct,
           prov_pct = tch_prov_cert_pct,
           s_per_t = stdnt_tch_ratio) %>%
    select(sch_id, dist_name, sch_name, year, fte_total, fte_male, fte_female, fte_white,
           fte_black, fte_hispanic, fte_asian, fte_aian, fte_hawaiian,
           fte_2more, fte_race_total, nbct_cnt, avg_t_exp,
           ba_pct, ma_pct, rank1_pct, special_pct, dr_pct,
           t_degree_pct, prov_pct, s_per_t)
}

# rename and select columns
teach12_clean <- teach_clean12(teach12)
teach13_clean <- teach_clean13(teach13)
teach14_clean <- teach_clean(teach14)
teach15_clean <- teach_clean(teach15)
teach16_clean <- teach_clean(teach16)
teach17_clean <- teach_clean(teach17)

# join data
teach_data <- bind_rows(teach17_clean, teach16_clean, teach15_clean,
                        teach14_clean, teach13_clean, teach12_clean)

# tidy data types
teach <- teach_data %>%
  mutate(year = factor(year, levels = c("20112012", "20122013",
                                        "20132014", "20142015",
                                        "20152016", "20162017"),
                       labels = c("2011-2012", "2012-2013",
                                  "2013-2014", "2014-2015",
                                  "2015-2016", "2016-2017")),
         fte_total = char_to_num(fte_total),
         fte_male = char_to_num(fte_male),
         fte_female = char_to_num(fte_female),
         fte_white = char_to_num(fte_white),
         fte_black = char_to_num(fte_black),
         fte_hispanic = char_to_num(fte_hispanic),
         fte_asian = char_to_num(fte_asian),
         fte_aian = char_to_num(fte_aian),
         fte_hawaiian = char_to_num(fte_hawaiian),
         fte_2more = char_to_num(fte_2more),
         fte_race_total = char_to_num(fte_race_total),
         nbct_cnt = char_to_num(nbct_cnt),
         avg_t_exp = char_to_num(avg_t_exp),
         ba_pct = pct_to_num(ba_pct),
         ma_pct = pct_to_num(ma_pct),
         rank1_pct = pct_to_num(rank1_pct),
         special_pct = pct_to_num(special_pct),
         dr_pct = pct_to_num(dr_pct),
         t_degree_pct = pct_to_num(t_degree_pct),
         prov_pct = pct_to_num(prov_pct),
         s_per_t = char_to_num(str_replace_all(s_per_t, ":1", "")))

# prep data for export

teach_state <- select_state(teach)
teach_dist <- select_dist(teach)
teach_sch <- select_sch(teach)

# export data ---------------------

use_data(teach_state, overwrite = TRUE)
use_data(teach_dist, overwrite = TRUE)
use_data(teach_sch, overwrite = TRUE)
