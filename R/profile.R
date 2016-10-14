#' State Profile Data for Kentucky Public Schools, 2012-2015
#'
#' A dataset with basic location and enrollment data
#'
#' @format A dataframe with 4 rows and 6 variables:
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

#' District Profile Data for Kentucky Public Schools, 2012-2015
#'
#' A dataset with basic location and enrollment data
#'
#' @format A dataframe with 704 rows and 6 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{long}{Longitude}
#'   \item{lat}{Latitude}
#'   \item{year}{A factor containing the school year}
#'   \item{enroll}{Number of students enrolled on October 1 of that school year}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"profile_dist"

#' School Profile Data for Kentucky Public Schools, 2012-2015
#'
#' A dataset with basic location and enrollment data
#'
#' @format A dataframe with 5722 rows and 7 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{sch_name}{School name}
#'   \item{long}{Longitude}
#'   \item{lat}{Latitude}
#'   \item{year}{School year}
#'   \item{enroll}{Number of students enrolled on October 1 of that school year}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"profile_sch"
