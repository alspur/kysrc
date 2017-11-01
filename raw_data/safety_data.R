# safety_clean.R
#
# this script is used to transform the raw excel files from the school report
# cards website and create the following dataframes in the kysrc package:
#
# saftey_state
# saftey_dist
# saftey_sch
#
# this script is included in .Rbuildignore along with all of
# the assocaited excel files.
#
# 11-12 thru 16-17 data obtained on 2017-10-31 from:
# https://applications.education.ky.gov/src/

# load data ####

# load packages
library(devtools)
library(readxl)
library(dplyr)
library(tidyr)
library(magrittr)
library(stringr)

# load helper functions
source("raw_data/function_help.R")

# read safety data
safe12 <- read_excel("raw_data/data12/LEARNING_ENVIRONMENT_SAFETY.xlsx")
safe13 <- read_excel("raw_data/data13/LEARNING_ENVIRONMENT_SAFETY.xlsx")
safe14 <- read_excel("raw_data/data14/LEARNING_ENVIRONMENT_SAFETY.xlsx")
safe15 <- read_excel("raw_data/data15/LEARNING_ENVIRONMENT_SAFETY.xlsx")
safe16 <- read_excel("raw_data/data16/LEARNING_ENVIRONMENT_SAFETY.xlsx")
safe17 <- read_excel("raw_data/data17/LEARNING_ENVIRONMENT_SAFETY.xlsx")

# convert colnames to lowercase
colnames(safe12) <- col_lower(safe12)
colnames(safe13) <- col_lower(safe13)
colnames(safe14) <- col_lower(safe14)
colnames(safe15) <- col_lower(safe15)
colnames(safe16) <- col_lower(safe16)
colnames(safe17) <- col_lower(safe17)

# function to tidy report header column
label_tidy <- function(x){

  # convert to lower
  # remove any punctuation mark
  # replace "incidents" with "events"
  tidy_label <- x %>%
    tolower() %>%
    stringr::str_replace_all("[:punct:]", "") %>%
    stringr::str_replace_all("incidents", "events")


  return(tidy_label)

}

# tidy raw data
# remove unneeded columns
# clean up report label column

safe12_clean <- safe12 %>%
  mutate(rpt_header = label_tidy(rpt_header))
safe13_clean <- safe13 %>%
  mutate(rpt_header = label_tidy(rpt_header))
safe14_clean <- safe14 %>%
  mutate(rpt_header = label_tidy(rpt_header)) %>%
  select(-cntyno, -cntyname, -dist_number, -sch_number,
         -state_sch_id, -ncesid, -coop, -coop_code)
safe15_clean <- safe15 %>%
  mutate(rpt_header = label_tidy(rpt_header)) %>%
  select(-cntyno, -cntyname, -dist_number, -sch_number,
         -state_sch_id, -ncesid, -coop, -coop_code)
safe16_clean <- safe16 %>%
  mutate(rpt_header = label_tidy(rpt_header)) %>%
  select(-cntyno, -cntyname, -dist_number, -sch_number,
         -state_sch_id, -ncesid, -coop, -coop_code)
safe17_clean <- safe17 %>%
  mutate(rpt_header = label_tidy(rpt_header)) %>%
  select(-cntyno, -cntyname, -dist_number, -sch_number,
         -state_sch_id, -ncesid, -coop, -coop_code)

# unify data
safety_data <- bind_rows(safe12_clean, safe13_clean, safe14_clean,
                        safe15_clean, safe16_clean, safe17_clean)

# remove unneded df's
rm(safe12, safe12_clean, safe13, safe13_clean, safe14, safe14_clean,
   safe15, safe15_clean, safe16, safe16_clean, safe17, safe17_clean)

# clean safety data
safety_clean <- safety_data %>%
  mutate(year = factor(sch_year, levels = c("20112012", "20122013",
                                               "20132014", "20142015",
                                               "20152016", "20162017"),
                              labels = c("2011-2012", "2012-2013",
                                         "2013-2014", "2014-2015",
                                         "2015-2016", "2016-2017"))) %>%
  select(-sch_year,-rpt_header_order, -rpt_line_order) %>%
  rename(sch_id = sch_cd, report_header = rpt_header)


s_count_clean <- function(df){

  tidy_df <- df %>%
    mutate(white_cnt = char_to_num(white_cnt),
           black_cnt = char_to_num(black_cnt),
           hispanic_cnt = char_to_num(hispanic_cnt),
           asian_cnt = char_to_num(asian_cnt),
           aian_cnt = char_to_num(aian_cnt),
           hawaiian_cnt = char_to_num(hawaiian_cnt),
           other_cnt = char_to_num(other_cnt),
           male_cnt = char_to_num(male_cnt),
           female_cnt = char_to_num(female_cnt),
           total_stdnt_cnt = char_to_num(total_stdnt_cnt),
           total_unique_event_cnt = char_to_num(total_unique_event_cnt))

  return(tidy_df)
}

s_pct_clean <- function(df){

  tidy_df <- df %>%
    mutate(white_pct = pct_to_num(white_cnt),
           black_pct = pct_to_num(black_cnt),
           hispanic_pct = pct_to_num(hispanic_cnt),
           asian_pct = pct_to_num(asian_cnt),
           aian_pct = pct_to_num(aian_cnt),
           hawaiian_pct = pct_to_num(hawaiian_cnt),
           other_pct = pct_to_num(other_cnt),
           male_pct = pct_to_num(male_cnt),
           female_pct = pct_to_num(female_cnt)) %>%
    select(-white_cnt, -black_cnt, -hispanic_cnt,
           -asian_cnt, -aian_cnt, -hawaiian_cnt,
           -other_cnt, -male_cnt, -female_cnt,
           -total_stdnt_cnt, -total_unique_event_cnt)

  return(tidy_df)
}


# create legal data dfs ----------------------

legal_data <- safety_clean %>%
  filter(report_header == "legal sanctions") %>%
  s_count_clean() %>%
  select(sch_id, dist_name, sch_name, year, everything()) %>%
  rename(category = rpt_line) %>%
  select(-report_header)

legal_state <- select_state(legal_data)

legal_dist <- select_dist(legal_data)

legal_sch <- select_sch(legal_data)

# create discipline data df's --------------

discipline_data <- safety_clean %>%
  filter(str_detect(report_header,"discipline"))

discipline_pct <- discipline_data %>%
  filter(tolower(rpt_line) == "% of total") %>%
  s_pct_clean() %>%
  select(sch_id, dist_name, sch_name, year, everything()) %>%
  rename(category = rpt_line) %>%
  select(-report_header, -category)

discipline_cnt <- discipline_data %>%
  filter(!str_detect(rpt_line, "% of ")) %>%
  s_count_clean() %>%
  select(-report_header) %>%
  select(sch_id, dist_name, sch_name, year, everything()) %>%
  rename(category = rpt_line) %>%
  mutate(category = str_replace_all(category,
                                    "Student Corporal Punishment",
                                    "Corporal Punishment")) %>%
  mutate(category = str_replace_all(category, " \\(SSP5\\)", "")) %>%
  mutate(category = str_replace_all(category, ".* \\(SSP2\\)",
                                    "Expelled, no services")) %>%
  mutate(category = str_replace_all(category, ".* \\(SSP1\\)",
                                    "Expelled, receiving services")) %>%
  mutate(category = str_replace_all(category, ".* \\(SSP3\\)",
                                    "Out-of-School Suspensions")) %>%
  mutate(category = str_replace_all(category, ".*\\(IAES2\\)",
                                    "Removal by Hearing Officer")) %>%
  mutate(category = str_replace_all(category, ".*\\(IAES1\\)",
                                    "Removal by School Personnel")) %>%
  mutate(category = str_replace_all(category, " \\(.*\\)",
                                    ""))

discipline_state <- select_state(discipline_cnt)

discipline_dist <- select_dist(discipline_cnt)

discipline_sch <- select_sch(discipline_cnt)



