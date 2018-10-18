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

#' School Accountability Data for Kentucky Public Schools, 2017-18
#'
#' A dataset with accountabiltiy data under the reauthorized ESSA
#'
#' @format A dataframe with 1272 rows and 14 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{sch_name}{School name}
#'   \item{year}{School year}
#'   \item{title1}{Title I status}
#'   \item{school_level}{School level (Elementary, Middle, or High School)}
#'   \item{acctbly_label}{Accountability label}
#'   \item{acctbly_label_reason}{Reason or reasons for accountability label}
#'   \item{prof_indicator}{Proficiency indicator for accountability. Includes reading and mathematics.}
#'   \item{sep_acad_indicator}{Separate academic indicator for accountability. Includes writing, social studies, and science.}
#'   \item{growth_indicator}{Student growth indicator for accountability. Based on growth in reading and mathematics.}
#'   \item{transition_indicator}{Transition readiness indicator for accountability}
#'   \item{grad_indicator}{Graduation indicator for accountability}
#'   \item{grad_rate}{4-year cohort graduation rate}
#' }
#' @source \url{http://openhouse.education.ky.gov}

"acctbly_essa_sch"

#' District Accountability Data for Kentucky Public Schools, 2017-18
#'
#' A dataset with accountabiltiy data under the reauthorized ESSA
#'
#' @format A dataframe with 541 rows and 10 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{year}{School year}
#'   \item{school_level}{School level (Elementary, Middle, or High School)}
#'   \item{prof_indicator}{Proficiency indicator for accountability. Includes reading and mathematics.}
#'   \item{sep_acad_indicator}{Separate academic indicator for accountability. Includes writing, social studies, and science.}
#'   \item{growth_indicator}{Student growth indicator for accountability. Based on growth in reading and mathematics.}
#'   \item{transition_indicator}{Transition readiness indicator for accountability}
#'   \item{grad_indicator}{Graduation indicator for accountability}
#'   \item{grad_rate}{4-year cohort graduation rate}
#' }
#' @source \url{http://openhouse.education.ky.gov}

"acctbly_essa_dist"


#' State Accountability Data for Kentucky Public Schools, 2017-18
#'
#' A dataset with accountabiltiy data under the reauthorized ESSA
#'
#' @format A dataframe with 3 rows and 10 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{year}{School year}
#'   \item{school_level}{School level (Elementary, Middle, or High School)}
#'   \item{prof_indicator}{Proficiency indicator for accountability. Includes reading and mathematics.}
#'   \item{sep_acad_indicator}{Separate academic indicator for accountability. Includes writing, social studies, and science.}
#'   \item{growth_indicator}{Student growth indicator for accountability. Based on growth in reading and mathematics.}
#'   \item{transition_indicator}{Transition readiness indicator for accountability}
#'   \item{grad_indicator}{Graduation indicator for accountability}
#'   \item{grad_rate}{4-year cohort graduation rate}
#' }
#' @source \url{http://openhouse.education.ky.gov}

"acctbly_essa_state"
