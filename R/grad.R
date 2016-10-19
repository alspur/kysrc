#' State 4-Year Cohort Graduation Rate Data for Kentucky Public Schools, 2013-2016
#'
#' A dataset with graduation rate data
#'
#' @format A dataframe with 60 rows and 5 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name - in this case, it is always "State Total"}
#'   \item{student_group}{Student subgroup}
#'   \item{year}{School year}
#'   \item{grad_rate}{4-year cohort graduation rate}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"grad_state"

#' District 4-Year Cohort Graduation Rate Data for Kentucky Public Schools, 2013-2016
#'
#' A dataset with graduation rate data
#'
#' @format A dataframe with 10620 rows and 5 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{student_group}{Student subgroup}
#'   \item{year}{School year}
#'   \item{grad_rate}{4-year cohort graduation rate}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"grad_dist"

#' School 4-Year Cohort Graduation Rate Data for Kentucky Public Schools, 2013-2016
#'
#' A dataset with graduation rate data
#'
#' @format A dataframe with 13680 rows and 6 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{sch_name}{School name}
#'   \item{student_group}{Student subgroup}
#'   \item{year}{School year}
#'   \item{grad_rate}{4-year cohort graduation rate}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"grad_sch"
