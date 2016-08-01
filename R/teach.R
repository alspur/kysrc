#' State Teacher Data for Kentucky Public Schools, 2012-2015
#'
#' A dataset with teacher data
#'
#' @format A dataframe with 28 rows and 5 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name - in this case, it is always "State Total"}
#'   \item{year}{School year}
#'   \item{s_t_ratio}{Number of students per teacher}
#'   \item{t_fte}{Full Time Equivelent Teachers}
#'   \item{nbct_count}{Number of National Board Certified Teachers}
#'   \item{nbct_pct}{Percent of National Board Certified Teachers}
#'   \item{avg_t_exp}{Average years of experience}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"state_teach"

#' District Student Race Data for Kentucky Public Schools, 2012-2015
#'
#' A dataset with student racial group data
#'
#' @format A dataframe with 28 rows and 5 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{year}{School year}
#'   \item{s_t_ratio}{Number of students per teacher}
#'   \item{t_fte}{Full Time Equivelent Teachers}
#'   \item{nbct_count}{Number of National Board Certified Teachers}
#'   \item{nbct_pct}{Percent of National Board Certified Teachers}
#'   \item{avg_t_exp}{Average years of experience}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"dist_teach"

#' School Student Race Data for Kentucky Public Schools, 2012-2015
#'
#' A dataset with student racial group data
#'
#' @format A dataframe with 28 rows and 5 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{sch_name}{School name}
#'   \item{year}{School year}
#'   \item{s_t_ratio}{Number of students per teacher}
#'   \item{t_fte}{Full Time Equivelent Teachers}
#'   \item{nbct_count}{Number of National Board Certified Teachers}
#'   \item{nbct_pct}{Percent of National Board Certified Teachers}
#'   \item{avg_t_exp}{Average years of experience}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"sch_teach"
