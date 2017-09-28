# profile_data.R
#
# this script is used to transform the raw excel files from the school report
# cards website and create the following dataframes in the kysrc package:
#
# sch_profile
# dist_profile
# state_profile
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

# profile data for state, dist, and school levels

profile12 <- read_excel("raw_data/data12/PROFILE.xlsx", sheet = 2)
profile13 <- read_excel("raw_data/data13/PROFILE.xlsx", sheet = 2)
profile14 <- read_excel("raw_data/data14/PROFILE.xlsx")
profile15 <- read_excel("raw_data/data15/PROFILE.xlsx")
profile16 <- read_excel("raw_data/data16/PROFILE.xlsx")
profile17 <- read_excel("raw_data/data17/PROFILE.xlsx")

# clean data ####

# filter out unneeded columns
prof12 <- profile12 %>%
  select(SCH_CD, NCES_CD, DIST_NAME, SCH_NAME, LONGITUDE, LATITUDE,
         TITLE1_STATUS, SCH_YEAR, ENROLLMENT) %>%
  rename(sch_id = SCH_CD, nces_id = NCES_CD, dist_name = DIST_NAME,
         sch_name = SCH_NAME, long = LONGITUDE,
         lat = LATITUDE, year = SCH_YEAR,
         title1 = TITLE1_STATUS, enroll = ENROLLMENT) %>%
  mutate(nces_id = as.character(nces_id))

prof13 <- profile13 %>%
  select(SCH_CD, NCES_CD, DIST_NAME, SCH_NAME, LONGITUDE, LATITUDE,
         TITLE1_STATUS, SCH_YEAR, ENROLLMENT) %>%
  rename(sch_id = SCH_CD, nces_id = NCES_CD, dist_name = DIST_NAME,
         sch_name = SCH_NAME, long = LONGITUDE,
         lat = LATITUDE, year = SCH_YEAR,
         title1 = TITLE1_STATUS, enroll = ENROLLMENT) %>%
  mutate(nces_id = as.character(nces_id))

prof14 <- profile14 %>%
  select(SCH_CD, NCESID, DIST_NAME, SCH_NAME, LONGITUDE, LATITUDE,
         TITLE1_STATUS, SCH_YEAR, MEMBERSHIP) %>%
  rename(sch_id = SCH_CD, nces_id = NCESID, dist_name = DIST_NAME,
         sch_name = SCH_NAME, long = LONGITUDE,
         lat = LATITUDE, year = SCH_YEAR,
         title1 = TITLE1_STATUS, enroll = MEMBERSHIP)

prof15 <- profile15 %>%
  select(SCH_CD, NCESID, DIST_NAME, SCH_NAME, LONGITUDE, LATITUDE,
         TITLE1_STATUS, SCH_YEAR, MEMBERSHIP) %>%
  rename(sch_id = SCH_CD, nces_id = NCESID, dist_name = DIST_NAME,
         sch_name = SCH_NAME, long = LONGITUDE,
         lat = LATITUDE, year = SCH_YEAR,
         title1 = TITLE1_STATUS, enroll = MEMBERSHIP)

prof16 <- profile16 %>%
  select(SCH_CD, NCESID, DIST_NAME, SCH_NAME, LONGITUDE, LATITUDE,
         TITLE1_STATUS, SCH_YEAR, MEMBERSHIP) %>%
  rename(sch_id = SCH_CD, nces_id = NCESID, dist_name = DIST_NAME,
         sch_name = SCH_NAME, long = LONGITUDE,
         lat = LATITUDE, year = SCH_YEAR,
         title1 = TITLE1_STATUS, enroll = MEMBERSHIP)

prof17 <- profile17 %>%
  select(SCH_CD, NCESID, DIST_NAME, SCH_NAME, LONGITUDE, LATITUDE,
         TITLE1_STATUS, SCH_YEAR, MEMBERSHIP) %>%
  rename(sch_id = SCH_CD, nces_id = NCESID, dist_name = DIST_NAME,
         sch_name = SCH_NAME, long = LONGITUDE,
         lat = LATITUDE, year = SCH_YEAR,
         title1 = TITLE1_STATUS, enroll = MEMBERSHIP)

# bind profile data from all years into one dataframe
prof_data <- bind_rows(prof12, prof13, prof14, prof15, prof16, prof17)

# get coop data
coop_info <- profile16 %>%
  select(DIST_NAME, COOP) %>%
  distinct()

colnames(coop_info) <- tolower(colnames(coop_info))

# remove old dataframes
rm(profile12, profile13, profile14, profile15, profile16, profile17,
   prof12, prof13, prof14, prof15, prof16, prof17)

# clean data formatting
prof_data_clean <- prof_data %>%
  mutate(long = as.numeric(str_trim(long)),
         lat = as.numeric(str_trim(lat)),
         year = factor(year, levels = c("20112012", "20122013", "20132014",
                                        "20142015", "20152016", "20162017"),
                          labels = c("2011-2012", "2012-2013", "2013-2014",
                                     "2014-2015", "2015-2016", "2016-2017")),
         enroll = as.integer(str_replace_all(enroll, ",",""))) %>%
  mutate(type = ifelse(str_detect(title1, "No Program"),
                       "Title 1 eligible, no program",
                       ifelse(str_detect(title1, "Not a "),
                              "Not Title 1 eligible",
                              "Title 1"))) %>%
  mutate(type = ifelse(is.na(title1), "Not Title 1 eligible", type)) %>%
  mutate(title1 = factor(type, levels = c("Title 1",
                                          "Title 1 eligible, no program",
                                          "Not Title 1 eligible"))) %>%
  select(-type)

prof_data_coop <- prof_data_clean %>%
  left_join(coop_info) %>%
  select(sch_id, nces_id, dist_name, sch_name,
         coop, long, lat, year, title1, enroll) %>%
  mutate(coop = as.factor(coop))

# select state profile data
profile_state <- prof_data_coop %>%
  filter(sch_id == 999) %>% # filter for state id number
  mutate(dist_name = "State Total") %>% # clean labels
  select(-sch_name, -coop, -title1, -nces_id) # remove redundant columns

# select district profile data
profile_dist <- prof_data_coop %>%
  filter(sch_id != 999) %>% # exclude state id number
  filter(str_length(sch_id) == 3) %>% # only include id numbers w/ 3 chars
  select(-sch_name) %>% # remove redundant col - all values are "District Total"
  mutate(long = ifelse(long < 100, long, NA),
         lat = ifelse(lat < 100, lat, NA)) %>%
  group_by(sch_id) %>%
  mutate(long = min(long, na.rm = TRUE), # impute lat and long for
         lat = min(lat, na.rm = TRUE)) %>% # years w/ missing data
  ungroup() %>%
  select(-title1, -nces_id)


# select school profile data
profile_sch <- prof_data_coop %>%
  filter(str_length(sch_id) == 6) %>% # only include id numbers w/ 6 chars
  mutate(long = ifelse(long < 100, long, NA),
         lat = ifelse(lat < 100, lat, NA)) %>%
  group_by(sch_id) %>%
  mutate(long = min(long, na.rm = TRUE), # impute lat and long for
         lat = min(lat, na.rm = TRUE)) %>% # years w/ missing data
  ungroup() %>%
  mutate(lat = ifelse(sch_name == "Bullitt County Area Technology Center",
                       38, lat)) %>%
  arrange(sch_id)

# use data for package ####
use_data(profile_state, overwrite = TRUE)
use_data(profile_dist, overwrite = TRUE)
use_data(profile_sch, overwrite = TRUE)
