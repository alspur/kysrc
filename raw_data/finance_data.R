# finance_data.R
#
# this script is used to transform the raw excel files from the school report
# cards website and create the following dataframes in the kysrc package:
#
# fin_summary_state
# fin_summary_dist
# tax_state
# tax_dist
# rev_exp_state
# rev_exp_dist
# pp_rev_exp_state
# pp_rev_exp_dist
# seek_state
# seed_dist
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

source("raw_data/function_help.R")

# profile data for state, dist, and school levels

finance12 <- read_excel("raw_data/data14/FINANCE.xlsx", sheet = 1)
finance13 <- read_excel("raw_data/data14/FINANCE.xlsx", sheet = 2)
finance14 <- read_excel("raw_data/data14/FINANCE.xlsx", sheet = 3)
finance15 <- read_excel("raw_data/data15/FINANCE.xlsx")
finance16 <- read_excel("raw_data/data16/FINANCE.xlsx")

# clean data ####

# function to clean select needed columns from raw dfs
fin_clean <- function(df){

  colnames(df) <- tolower(colnames(df))

  df %>%
    select(sch_cd, dist_name, sch_name, sch_year, finance_type, finance_label,
           finance_value)

}

# run raw dfs through fin_clean function
fin12 <- fin_clean(finance12)
fin13 <- fin_clean(finance13)
fin14 <- fin_clean(finance14)
fin15 <- fin_clean(finance15)
fin16 <- fin_clean(finance16)

# join dfs into one df, rename cols
finance_data <- bind_rows(fin12, fin13, fin14, fin15, fin16) %>%
  rename(sch_id = sch_cd, year = sch_year)

# remove old dfs
rm(fin12, fin13, fin14, fin15, fin16,
   finance12, finance13, finance14, finance15, finance16)

# convert year to factor
finance_clean <- finance_data %>%
  mutate(year = factor(year, levels = c("20112012", "20122013",
                                            "20132014", "20142015",
                                            "20152016"),
                           labels = c("2011-2012", "2012-2013",
                                      "2013-2014", "2014-2015",
                                      "2015-2016")))

# select df of percentage-based data
finance_pcts <- finance_clean %>%
  filter(str_detect(finance_label, "Percent")) %>%
  mutate(finance_value = pct_to_num(finance_value))

# select df of integer-based data
finance_amounts <-  finance_clean %>%
  filter(!str_detect(finance_label, "Percent") &
           !str_detect(finance_label, "Ratio") &
           !str_detect(finance_label, "Above Adopted Rate")) %>%
  mutate(finance_value = char_to_num(finance_value))

# parse salary data
salary_data <- finance_amounts %>%
  filter(str_detect(finance_type, "SALARIES")) %>%
  rename(type = finance_type,
         category = finance_label,
         value = finance_value) %>%
  mutate(category = str_replace_all(tolower(category),
                                            "average ",
                                            "avg_"),
         category = str_replace_all(category,
                                    " salary",
                                    "_sal"),
         category = str_replace_all(category,
                                    "teacher",
                                    "t"),
         category = str_replace_all(category,
                                    "principal",
                                    "p"),
         type = "salary",
         category = str_replace_all(category, "total substitute t expenditures",
                                    "sub_exp"),
         category = str_replace_all(category, "substitute t expenditures per pupil",
                                    "sub_exp_pp"))

# parse summary data
finance_summary <- finance_amounts %>%
  filter(finance_type == "FINANCIAL SUMMARY") %>%
  rename(type = finance_type,
         category = finance_label,
         value = finance_value) %>%
  mutate(category = str_replace_all(category,
                                    "Average Daily Attendance \\(ADA\\) no adjustments",
                                    "ada"),
         category = str_replace_all(category,
                                    "SEEK Average Daily Attendance \\(SEEK ADA\\)",
                                    "ada_seek"),
         category = str_replace_all(category,
                                    "Average Daily Membership \\(ADM\\)",
                                    "adm"),
         category = str_replace_all(category,
                                    "FTE Certified Staff - Teachers",
                                    "fte_teachers"),
         category = str_replace_all(category,
                                    "FTE Certified Staff",
                                    "fte_staff"),
         category = str_replace_all(category,
                                    "FTE Classified Staff",
                                    "fte_classified"),
         category = str_replace_all(category,
                                    "Fund Balance",
                                    "fund_balance"),
         type = "summary")
# parse tax data
tax <- finance_amounts %>%
  filter(finance_type == "TAX") %>%
  select(-finance_type) %>%
  rename(category = finance_label, value = finance_value) %>%
  mutate(category = str_replace_all(category,
                                    "30-cent Local Effort",
                                    "thirty_cent"),
         category = str_replace_all(category,
                                    "Assessment per Pupil",
                                    "assessment_pp"),
         category = str_replace_all(category,
                                    "Assessment",
                                    "assessment"),
         category = str_replace_all(category,
                                    "Levied Equivalent Rate",
                                    "levied_eqv_rate"),
         category = str_replace_all(category,
                                    "Real Estate Tax",
                                    "real_estate"),
         category = str_replace_all(category,
                                    "Tangible \\/ Personal Property Tax",
                                    "property"))

# parse revenue & expenditure data
rev_exp <- finance_amounts %>%
  filter(finance_type == "REVENUES AND EXPENDITURES") %>%
  select(-finance_type) %>%
  rename(category = finance_label, value = finance_value) %>%
  mutate(type = ifelse(str_detect(category, "Revenue"), "revenue",
                       "expenditure"),
         level = ifelse(str_detect(category, "per Pupil"),
                        "per_pupil",
                        "total"))

# create df of rev/exp totals
rev_exp_total <- rev_exp %>%
  filter(level == "total") %>%
  select(-level) %>%
  mutate(category = tolower(category),
         category = str_replace_all(category, "expenditures", ""),
         category = str_replace_all(category, "revenue", ""),
         category = str_replace_all(category, " on ", ""),
         category = str_replace_all(category, "administration", "admin"),
         category = str_replace_all(category, "capital outlay [ a-z]+", "capital_outlay"),
         category = str_replace_all(category, "operations", "ops"),
         category = str_replace_all(category, "transportation", "transport"),
         category = str_replace_all(category, "instructional staff support",
                                    "instr_staff_support"),
         category = str_replace_all(category, "and maintenance", "maint"),
         category = str_replace_all(str_trim(category), " ", "_"),
         tot_pp = "total") %>%
  select(sch_id, dist_name, sch_name, year, type, tot_pp, category, value)

# create df of per-pupil rev/exp data
rev_exp_pp <- rev_exp %>%
  filter(level == "per_pupil") %>%
  select(-level) %>%
  mutate(category = str_replace_all(tolower(category),
                                    "per pupil", ""),
         category = str_replace_all(category, "expenditures", ""),
         category = str_replace_all(category, "revenue", ""),
         category = str_replace_all(category, " on ", ""),
         category = str_replace_all(category, "administration", "admin"),
         category = str_replace_all(category, "capital outlay [ a-z]+", "capital_outlay"),
         category = str_replace_all(category, "operations", "ops"),
         category = str_replace_all(category, "transportation", "transport"),
         category = str_replace_all(category, "instructional staff support",
                                    "instr_staff_support"),
         category = str_replace_all(category, "and maintenance", "maint"),
         category = str_replace_all(str_trim(category), " ", "_"),
         tot_pp = "pp") %>%
  select(sch_id, dist_name, sch_name, year, type, tot_pp, category, value)

# parse seek data
seek <- finance_amounts %>%
  filter(finance_type == "SEEK") %>%
  select(-finance_type) %>%
  rename(category = finance_label, value = finance_value) %>%
  mutate(category = str_trim(tolower(category)),
         category = str_replace_all(category,
                                    "net general fund seek",
                                    "net_gen_fund"),
         category = str_replace_all(category,
                                    "building fund - state",
                                    "building_state"),
         category = str_replace_all(category,
                                    "building fund - local",
                                    "building_local"),
         category = str_replace_all(category,
                                    "actual_transportation_expenditures",
                                    "transport_exp"),
         category = str_replace_all(category,
                                    "transportation_seek_funding",
                                    "transport_seek"),
         category = str_replace_all(category, " ", "_"))

# separate percentage data by type: summary, rev/exp, seek
summary_pct <- finance_pcts %>%
  filter(finance_type == "FINANCIAL SUMMARY") %>%
  rename(type = finance_type,
         category = finance_label,
         value = finance_value) %>%
  mutate(category = str_replace_all(category,
                                    "Fund Balance Percentage",
                                    "fund_bal_pct"),
         category = str_replace_all(category,
                                    "Percent of Salaries and Benefits to Total Expenditures",
                                    "salary_bene_pct"),
         type = "summary")

rev_exp_pct <- finance_pcts %>%
  filter(finance_type == "REVENUES AND EXPENDITURES") %>%
  select(-finance_type) %>%
  rename(category = finance_label,
         value = finance_value) %>%
  mutate(type = "expenditure", category = "admin_pct",
         tot_pp = "total pp") %>%
  select(sch_id, dist_name, sch_id, year, type, tot_pp, category, value)

seek_pct <- finance_pcts %>%
  filter(finance_type == "SEEK") %>%
  select(-finance_type) %>%
  rename(category = finance_label,
         value = finance_value) %>%
  mutate(category = "transp_funded_pct")

# bind pct data to integer data
seek <- bind_rows(seek, seek_pct)
rev_exp_all <- bind_rows(rev_exp_total, rev_exp_pp, rev_exp_pct)
finance_summary <- bind_rows(finance_summary, summary_pct)

# prep data for export by selecting state/dist data
fin_summary_state <- select_state(finance_summary)
fin_summary_dist <- select_dist(finance_summary)
salary_state <- select_state(salary_data)
salary_dist <- select_dist(salary_data)
tax_state <- select_state(tax) %>% filter(!is.na(value))
tax_dist <- select_dist(tax)
rev_exp_state <- select_state(rev_exp_all)
rev_exp_dist <- select_dist(rev_exp_all)
seek_state <- select_state(seek)
seek_dist <- select_dist(seek)

# join summary and salary_info
fin_summary_state <- bind_rows(fin_summary_state, salary_state)
fin_summary_dist <- bind_rows(fin_summary_dist, salary_dist)


# save data
use_data(fin_summary_state, overwrite = TRUE)
use_data(fin_summary_dist, overwrite = TRUE)

use_data(tax_state, overwrite = TRUE)
use_data(tax_dist, overwrite = TRUE)

use_data(rev_exp_state, overwrite = TRUE)
use_data(rev_exp_dist, overwrite = TRUE)

use_data(rev_exp_pp_state, overwrite = TRUE)
use_data(rev_exp_pp_dist, overwrite = TRUE)

use_data(seek_state, overwrite = TRUE)
use_data(seek_dist, overwrite = TRUE)
