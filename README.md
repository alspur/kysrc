# kysrc

[![Travis-CI Build Status](https://travis-ci.org/alspur/kysrc.svg?branch=master)](https://travis-ci.org/alspur/kysrc)

This package contains Kentucky public school data for 2012-2017 from the [Kentucky School Report Card website](https://applications.education.ky.gov/src/DataSets.aspx). 

### Installation

Install from Github with [devtools](https://github.com/hadley/devtools):

```r
library(devtools)
install_github("alspur/kysrc")
```

### What's inside

This package contains nine different kinds of datasets with data at three different levels: state, district, and school. To reference a table for a particular level, you will need to append the suffix `state`, `dist`, or `sch`, respectively. For example, `ach_grade_state` would provide summary data for the entire state of Kentucky, while `ach_grade_sch` would provide the same data for each public school in Kentucky.

The datasets included in this package are:

- `acctbly_...`: Accountabilty system scores and labels.
- `ach_grade_...`: K-PREP test data by grade level (3-8, HS).
- `ach_level_...`: K-PREP test data by school level (Elementary School, Middle School, High School).
- `act_...`: ACT test data.
- `ap_...`: AP test data.
- `ccr_...`: College/Career Readiness data.
- `fin_summary_...`: Financial summary data (district & state only).
- `frpl_...`: Free/Reduced Price Lunch Eligibility data.
- `grad_...`: Four-year cohort graduation rate data.
- `iep_...`: Individualized Education Plan (IEP) counts and rates.
- `lep_...`: Limited English Proficiency (LEP) counts and rates.
- `profile_...`: Enrollment, Title 1 status, longitude, latitude, and NCES ID
- `race_...`: Racial demographic data.
- `rev_exp_...`: Revenue and expenditure data (district & state only).
- `seek_...`: SEEK funding data (district & state only).
- `tax_...`: Tax data (district & state only).
- `teach_...`: Teacher data.

Each dataset includes a unique identifier for the school/district/state, `sch_id`. This variable is helpful for joining data from multiple tables, as is `year`, which indicates the school year during which the data was generated.

There are currently 2,941,990 rows of data in this package and a total of 40,212,592 data points.
