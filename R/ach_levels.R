#' State KPREP Levels Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with KPREP performance level data
#'
#' @format A dataframe with 1,904 rows and 14 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name - in this case, it is always "State Total"}
#'   \item{year}{School year}
#'   \item{school_level}{Indicates an elementary, middle, or high school}
#'   \item{subject}{Specific subject assessed by KPREP}
#'   \item{student_group}{Student subgroup}
#'   \item{n_tested}{Number of students tested}
#'   \item{novice_pct}{Percent of students scoring "Novice" on KPREP}
#'   \item{apprentice_pct}{Percent of students scoring "Apprentice" on KPREP}
#'   \item{proficient_pct}{Percent of students scoring "Proficient" on KPREP}
#'   \item{distinguished_pct}{Percent of students scoring "Distinguished" on KPREP}
#'   \item{prof_dist_pct}{Percent of students scoring "Proficient" or "Distinguished" on KPREP}
#'   \item{bonus_pct}{Percent difference between "Distinguished" and "Novice" if the "Novice" rate is lower.}
#'   \item{napd_calc}{Aggregation of score granting .5 points per student at "Apprentice", 1 point per student at/above "Proficient" and .5 points for the value of the "Bonus" amount.}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"ach_level_state"

#' District KPREP Levels Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with KPREP performance level data
#'
#' @format A dataframe with 336,422 rows and 14 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{year}{School year}
#'   \item{school_level}{Indicates an elementary, middle, or high school}
#'   \item{subject}{Specific subject assessed by KPREP}
#'   \item{student_group}{Student subgroup}
#'   \item{n_tested}{Number of students tested}
#'   \item{novice_pct}{Percent of students scoring "Novice" on KPREP}
#'   \item{apprentice_pct}{Percent of students scoring "Apprentice" on KPREP}
#'   \item{proficient_pct}{Percent of students scoring "Proficient" on KPREP}
#'   \item{distinguished_pct}{Percent of students scoring "Distinguished" on KPREP}
#'   \item{prof_dist_pct}{Percent of students scoring "Proficient" or "Distinguished" on KPREP}
#'   \item{bonus_pct}{Percent difference between "Distinguished" and "Novice" if the "Novice" rate is lower.}
#'   \item{napd_calc}{Aggregation of score granting .5 points per student at "Apprentice", 1 point per student at/above "Proficient" and .5 points for the value of the "Bonus" amount.}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"ach_level_dist"

#' School KPREP Levels Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with KPREP performance level data
#'
#' @format A dataframe with 782,005 rows and 15 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{sch_name}{School name}
#'   \item{year}{School year}
#'   \item{school_level}{Indicates an elementary, middle, or high school}
#'   \item{subject}{Specific subject assessed by KPREP}
#'   \item{student_group}{Student subgroup}
#'   \item{n_tested}{Number of students tested}
#'   \item{novice_pct}{Percent of students scoring "Novice" on KPREP}
#'   \item{apprentice_pct}{Percent of students scoring "Apprentice" on KPREP}
#'   \item{proficient_pct}{Percent of students scoring "Proficient" on KPREP}
#'   \item{distinguished_pct}{Percent of students scoring "Distinguished" on KPREP}
#'   \item{prof_dist_pct}{Percent of students scoring "Proficient" or "Distinguished" on KPREP}
#'   \item{bonus_pct}{Percent difference between "Distinguished" and "Novice" if the "Novice" rate is lower.}
#'   \item{napd_calc}{Aggregation of score granting .5 points per student at "Apprentice", 1 point per student at/above "Proficient" and .5 points for the value of the "Bonus" amount.}
#'   \item{perf_index}{Aggregation of performance levels, granting weights of 0 to percent "Novice", .5 to percent "Apprentice", 1 to percent "Proficient", and 1.25 to percent "Distinguished".}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"ach_level_sch"
