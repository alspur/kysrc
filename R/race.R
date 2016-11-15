#' State Student Race Count Data for Kentucky Public Schools, 2012-2016
#'
#' A dataset with student racial group count data
#'
#' @format A dataframe with 35 rows and 6 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name - in this case, it is always "State Total"}
#'   \item{year}{School year}
#'   \item{race}{Racial subgroup}
#'   \item{s_count}{Number of students enrolled of a particular race}
#'   \item{calc_pct}{Calculated relative percentage of student enrollment}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"race_state"

#' District Student Race Count Data for Kentucky Public Schools, 2012-2016
#'
#' A dataset with student racial group count data
#'
#' @format A dataframe with 6146 rows and 6 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{year}{School year}
#'   \item{race}{Racial subgroup}
#'   \item{s_count}{Number of students enrolled of a particular race}
#'   \item{calc_pct}{Calculated relative percentage of student enrollment}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"race_dist"

#' School Student Race Count Data for Kentucky Public Schools, 2012-2016
#'
#' A dataset with student racial group count data
#'
#' @format A dataframe with 48006 rows and 7 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{sch_name}{School name}
#'   \item{year}{School year}
#'   \item{race}{Racial subgroup}
#'   \item{s_count}{Number of students enrolled of a particular race}
#'   \item{calc_pct}{Calculated relative percentage of student enrollment}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"race_sch"
