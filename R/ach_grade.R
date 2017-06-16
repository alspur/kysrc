#' State KPREP Grade Level Data for Kentucky Public Schools, 2012-2016
#'
#' A dataset with KPREP performance level data by grade
#'
#' @format A dataframe with 2,474 rows and 14 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name - in this case, it is always "State Total"}
#'   \item{year}{School year}
#'   \item{grade}{Grade level - "EO" indicates high school end-of-course exam that may be administered to students in various grades}
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

"ach_grade_state"

#' District KPREP Grade Level Data for Kentucky Public Schools, 2012-2016
#'
#' A dataset with KPREP performance level data by grade
#'
#' @format A dataframe with 438,947 rows and 14 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{year}{School year}
#'   \item{grade}{Grade level - "EO" indicates high school end-of-course exam that may be administered to students in various grades}
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

"ach_grade_dist"

#' School KPREP Grade Level Data for Kentucky Public Schools, 2012-2016
#'
#' A dataset with KPREP performance level data by grade
#'
#' @format A dataframe with 1,100,892 rows and 15 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{sch_name}{School name}
#'   \item{year}{School year}
#'   \item{grade}{Grade level - "EO" indicates high school end-of-course exam that may be administered to students in various grades}
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

"ach_grade_sch"
