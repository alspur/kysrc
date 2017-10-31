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

source("raw_data/function_help.R")


