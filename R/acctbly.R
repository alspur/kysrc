#' State Accountability Data for Kentucky Public Schools, 2012-2015
#'
#' A dataset with accountabiltiy data
#'
#' @format A dataframe with 5 rows and 6 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name - in this case, it is always "State Total"}
#'   \item{year}{School year}
#'   \item{acctbly_score}{Total accountabiltiy score}
#'   \item{acctbly_label}{Accountability label}
#'   \item{prog_label}{Indicates "Progressing" addition to accountabiltiy label}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"acctbly_state"

#' District Accountability Data for Kentucky Public Schools, 2012-2015
#'
#' A dataset with accountabiltiy data
#'
#' @format A dataframe with 894 rows and 8 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{year}{School year}
#'   \item{acctbly_score}{Total accountabiltiy score}
#'   \item{acctbly_label}{Accountability label}
#'   \item{reward_assist}{Reward/assistance label}
#'   \item{prog_label}{Indicates "Progressing" addition to accountabiltiy label}
#'   \item{high_progress}{Indicates high progress}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"acctbly_dist"

#' School Accountability Data for Kentucky Public Schools, 2012-2015
#'
#' A dataset with accountabiltiy data
#'
#' @format A dataframe with 894 rows and 8 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{sch_name}{School name}
#'   \item{year}{School year}
#'   \item{school_level}{School level (Elementary, Middle, or High School)}
#'   \item{acctbly_score}{Total accountabiltiy score}
#'   \item{acctbly_label}{Accountability label}
#'   \item{reward_assist}{Reward/assistance label}
#'   \item{prog_label}{Indicates "Progressing" addition to accountabiltiy label}
#'   \item{high_progress}{Indicates high progress}
#'   \item{monitor_only}{Indicates a Priority School is only being monitored}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"acctbly_sch"
