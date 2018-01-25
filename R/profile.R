#' State Profile Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with basic location and enrollment data
#'
#' @format A dataframe with 6 rows and 6 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name - in this case, it is always "State Total"}
#'   \item{long}{Longitude}
#'   \item{lat}{Latitude}
#'   \item{year}{School year}
#'   \item{enroll}{Number of students enrolled on October 1 of that school year}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"profile_state"

#' District Profile Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with basic location and enrollment data
#'
#' @format A dataframe with 1,058 rows and 7 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{coop}{Regional cooperative}
#'   \item{long}{Longitude}
#'   \item{lat}{Latitude}
#'   \item{year}{A factor containing the school year}
#'   \item{enroll}{Number of students enrolled on October 1 of that school year}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"profile_dist"

#' School Profile Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with basic location and enrollment data
#'
#' @format A dataframe with 8,595 rows and 13 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{nces_id}{NCES school identification number}
#'   \item{dist_name}{District name}
#'   \item{sch_name}{School name}
#'   \item{coop}{Regional cooperative}
#'   \item{long}{Longitude}
#'   \item{lat}{Latitude}
#'   \item{year}{School year}
#'   \item{sch_type}{School type classification: A1, A2, A4, A4, A5, A6, B1, C2, D1}
#'   \item{grade_low}{Lowest grade served}
#'   \item{grade_high}{Highest grade served}
#'   \item{title1}{School's Title 1 status}
#'   \item{enroll}{Number of students enrolled on October 1 of that school year}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"profile_sch"
