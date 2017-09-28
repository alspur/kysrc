#' State AP Data for Kentucky Public Schools, 2013-2017
#'
#' A dataset with AP data
#'
#' @format A dataframe with 75 rows and 9 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name - in this case, it is always "State Total"}
#'   \item{year}{School year}
#'   \item{student_group}{Student subgroup}
#'   \item{ap_n_tested}{Number of students taking an AP exam}
#'   \item{ap_pct_tested}{Student group as a percent of all AP exam takers}
#'   \item{exam_cnt}{Number of AP exams taken}
#'   \item{exam_3plus}{Number of AP exams with scores of 3, 4, or 5}
#'   \item{exam_3plus_pct}{Percent of AP exams with scores of 3, 4, or 5}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"ap_state"

#' District AP Data for Kentucky Public Schools, 2013-2017
#'
#' A dataset with AP data
#'
#' @format A dataframe with 10,250 rows and 9 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{year}{School year}
#'   \item{student_group}{Student subgroup}
#'   \item{ap_n_tested}{Number of students taking an AP exam}
#'   \item{ap_pct_tested}{Student group as a percent of all AP exam takers}
#'   \item{exam_cnt}{Number of AP exams taken}
#'   \item{exam_3plus}{Number of AP exams with scores of 3, 4, or 5}
#'   \item{exam_3plus_pct}{Percent of AP exams with scores of 3, 4, or 5}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"ap_dist"

#' School AP Data for Kentucky Public Schools, 2013-2017
#'
#' A dataset with AP data
#'
#' @format A dataframe with 22,896 rows and 10 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{sch_name}{School name}
#'   \item{year}{School year}
#'   \item{student_group}{Student subgroup}
#'   \item{ap_n_tested}{Number of students taking an AP exam}
#'   \item{ap_pct_tested}{Student group as a percent of all AP exam takers}
#'   \item{exam_cnt}{Number of AP exams taken}
#'   \item{exam_3plus}{Number of AP exams with scores of 3, 4, or 5}
#'   \item{exam_3plus_pct}{Percent of AP exams with scores of 3, 4, or 5}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"ap_sch"
