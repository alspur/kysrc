#' IEP Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with state-level data on students with Individualized Education Plans (IEP)
#'
#' @format A dataframe with 120 rows and 6 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name - always "State Total"}
#'   \item{year}{School year}
#'   \item{student_group}{Student group}
#'   \item{iep_total}{Total number of students with an IEP}
#'   \item{iep_pct}{IEP students as percentage of state population}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"iep_state"

#' IEP Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with district-level data on students with Individualized Education Plans (IEP)
#'
#' @format A dataframe with 21,024 rows and 6 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{year}{School year}
#'   \item{student_group}{Student group}
#'   \item{iep_total}{Total number of students with an IEP}
#'   \item{iep_pct}{IEP students as percentage of district population}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}


"iep_dist"

#' IEP Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with school-level data on students with Individualized Education Plans (IEP)
#'
#' @format A dataframe with 161,712 rows and 7 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{sch_name}{School name}
#'   \item{year}{School year}
#'   \item{student_group}{Student group}
#'   \item{iep_total}{Total number of students with an IEP}
#'   \item{iep_pct}{IEP students as percentage of school population}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"iep_sch"
