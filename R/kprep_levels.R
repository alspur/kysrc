#' State KPREP Levels Data for Kentucky Public Schools, 2012-2015
#'
#' A dataset with KPREP performance level data
#'
#' @format A dataframe with 972 rows and 12 variables:
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
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"state_kprep_levels"

#' District KPREP Levels Data for Kentucky Public Schools, 2012-2015
#'
#' A dataset with KPREP performance level data
#'
#' @format A dataframe with 173088 rows and 12 variables:
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
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"dist_kprep_levels"

#' School KPREP Levels Data for Kentucky Public Schools, 2012-2015
#'
#' A dataset with KPREP performance level data
#'
#' @format A dataframe with 517320 rows and 13 variables:
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
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"sch_kprep_levels"
