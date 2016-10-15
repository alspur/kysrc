#' State FRPL Data for Kentucky Public Schools, 2012-2016
#'
#' A dataset with student FRPL data
#'
#' @format A dataframe with 5 rows and 6 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name - in this case, it is always "State Total"}
#'   \item{year}{School year}
#'   \item{enroll}{Total student enrollment}
#'   \item{frpl_total}{Number of students qualifying for free or reduced-price lunch}
#'   \item{frpl_pct}{Percent of students qualifying for free or reduced-price lunch}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"frpl_state"

#' District FRPL Data for Kentucky Public Schools, 2012-2016
#'
#' A dataset with student FRPL data
#'
#' @format A dataframe with 882 rows and 6 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{year}{School year}
#'   \item{enroll}{Total student enrollment}
#'   \item{frpl_total}{Number of students qualifying for free or reduced-price lunch}
#'   \item{frpl_pct}{Percent of students qualifying for free or reduced-price lunch}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"frpl_dist"

#' School FRPL Data for Kentucky Public Schools, 2012-2016
#'
#' A dataset with student FRPL data
#'
#' @format A dataframe with 7159 rows and 7 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{sch_name}{School name}
#'   \item{year}{School year}
#'   \item{enroll}{Total student enrollment}
#'   \item{frpl_total}{Number of students qualifying for free or reduced-price lunch}
#'   \item{frpl_pct}{Percent of students qualifying for free or reduced-price lunch}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"frpl_sch"
