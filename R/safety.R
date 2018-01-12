#' State Behavior Event Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with behavior event data at the state level
#'
#' @format A dataframe with 605 rows and 7 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name - in this case, it is always "State Total"}
#'   \item{year}{School year}
#'   \item{category}{Behavior event type, total behavior events, or violations per 1,000 ADA}
#'   \item{group_type}{Student group type, either race, gender, or total}
#'   \item{student_group}{Student group}
#'   \item{n_students}{Number of students}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"behavior_events_state"

#' District Behavior Event Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with behavior event data at the district level
#'
#' @format A dataframe with 106,315 rows and 7 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{year}{School year}
#'   \item{category}{Behavior event type, total behavior events, or violations per 1,000 ADA}
#'   \item{group_type}{Student group type, either race, gender, or total}
#'   \item{student_group}{Student group}
#'   \item{n_students}{Number of students}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}
"behavior_events_dist"

#' School Behavior Event Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with behavior event data at the school level
#'
#' @format A dataframe with 816,277 rows and 8 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{sch_name}{School name}
#'   \item{year}{School year}
#'   \item{category}{Behavior event type, total behavior events, or violations per 1,000 ADA}
#'   \item{group_type}{Student group type, either race, gender, or total}
#'   \item{student_group}{Student group}
#'   \item{n_students}{Number of students}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}
"behavior_events_sch"

#' State Behavior Event Location Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with behavior event location data at the state level
#'
#' @format A dataframe with 693 rows and 7 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name - in this case, it is always "State Total"}
#'   \item{year}{School year}
#'   \item{category}{Behavior event location}
#'   \item{group_type}{Student group type, either race, gender, or total}
#'   \item{student_group}{Student group}
#'   \item{n_students}{Number of students}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"behavior_location_state"

#' District Behavior Event Location Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with behavior event location data at the district level
#'
#' @format A dataframe with 121,759 rows and 7 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{year}{School year}
#'   \item{category}{Behavior event location}
#'   \item{group_type}{Student group type, either race, gender, or total}
#'   \item{student_group}{Student group}
#'   \item{n_students}{Number of students}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"behavior_location_dist"


#' School Behavior Event Location Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with behavior event location data at the school level
#'
#' @format A dataframe with 1,060,334 rows and 8 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{sch_name}{School name}
#'   \item{year}{School year}
#'   \item{category}{Behavior event location}
#'   \item{group_type}{Student group type, either race, gender, or total}
#'   \item{student_group}{Student group}
#'   \item{n_students}{Number of students}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"behavior_location_sch"

#' State Behavior Event Context Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with behavior event context data at the state level
#'
#' @format A dataframe with 264 rows and 7 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{year}{School year}
#'   \item{category}{Behavior event context}
#'   \item{group_type}{Student group type, either race, gender, or total}
#'   \item{student_group}{Student group}
#'   \item{n_students}{Number of students}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}


"behavior_context_state"

#' District Behavior Event Context Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with behavior event context data at the district level
#'
#' @format A dataframe with 46,376 rows and 7 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name - in this case, it is always "State Total"}
#'   \item{year}{School year}
#'   \item{category}{Behavior event context}
#'   \item{group_type}{Student group type, either race, gender, or total}
#'   \item{student_group}{Student group}
#'   \item{n_students}{Number of students}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"behavior_context_dist"

#' School Behavior Event Context Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with behavior event context data at the school level
#'
#' @format A dataframe with 355,036 rows and 8 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{sch_name}{School name}
#'   \item{year}{School year}
#'   \item{category}{Behavior event context}
#'   \item{group_type}{Student group type, either race, gender, or total}
#'   \item{student_group}{Student group}
#'   \item{n_students}{Number of students}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"behavior_context_sch"


#' State Behavior Event Socioeconomic Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with behavior event socioeconomic data at the state level
#'
#' @format A dataframe with 198 rows and 7 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{year}{School year}
#'   \item{category}{Student lunch program status}
#'   \item{group_type}{Student group type, either race, gender, or total}
#'   \item{student_group}{Student group}
#'   \item{n_students}{Number of students}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}


"behavior_ses_state"

#' District Behavior Event Socioeconomic Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with behavior event socioeconomic data at the district level
#'
#' @format A dataframe with 34,782 rows and 7 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name - in this case, it is always "State Total"}
#'   \item{year}{School year}
#'   \item{category}{Student lunch program status}
#'   \item{group_type}{Student group type, either race, gender, or total}
#'   \item{student_group}{Student group}
#'   \item{n_students}{Number of students}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"behavior_ses_dist"

#' School Behavior Event Socioeconomic Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with behavior event socioeconomic data at the school level
#'
#' @format A dataframe with 266,277 rows and 8 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{sch_name}{School name}
#'   \item{year}{School year}
#'   \item{category}{Student lunch program status}
#'   \item{group_type}{Student group type, either race, gender, or total}
#'   \item{student_group}{Student group}
#'   \item{n_students}{Number of students}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"behavior_ses_sch"

#' State Discipline Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with discipline data at the state level
#'
#' @format A dataframe with 539 rows and 7 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name - in this case, it is always "State Total"}
#'   \item{year}{School year}
#'   \item{category}{Discipline type}
#'   \item{group_type}{Student group type, either race, gender, or total}
#'   \item{student_group}{Student group}
#'   \item{n_students}{Number of students}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"discipline_state"


#' District Discipline Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with discipline data at the district level
#'
#' @format A dataframe with 94,787 rows and 7 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{year}{School year}
#'   \item{category}{Discipline type}
#'   \item{group_type}{Student group type, either race, gender, or total}
#'   \item{student_group}{Student group}
#'   \item{n_students}{Number of students}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"discipline_dist"

#' School Discipline Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with discipline data at the school level
#'
#' @format A dataframe with 731,918 rows and 8 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{sch_name}{School name}
#'   \item{year}{School year}
#'   \item{category}{Discipline type}
#'   \item{group_type}{Student group type, either race, gender, or total}
#'   \item{student_group}{Student group}
#'   \item{n_students}{Number of students}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"discipline_sch"


#' State Legal Action Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with legal action data at the state level
#'
#' @format A dataframe with 330 rows and 7 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name - in this case, it is always "State Total"}
#'   \item{year}{School year}
#'   \item{category}{Legal action type}
#'   \item{group_type}{Student group type, either race, gender, or total}
#'   \item{student_group}{Student group}
#'   \item{n_students}{Number of students}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"legal_state"


#' District Legal Action Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with legal action data at the district level
#'
#' @format A dataframe with 58,014 rows and 7 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{year}{School year}
#'   \item{category}{Legal action type}
#'   \item{group_type}{Student group type, either race, gender, or total}
#'   \item{student_group}{Student group}
#'   \item{n_students}{Number of students}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}


"legal_dist"


#' School Legal Action Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with legal action data at the school level
#'
#' @format A dataframe with 446,160 rows and 8 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{sch_name}{School name}
#'   \item{year}{School year}
#'   \item{category}{Legal action type}
#'   \item{group_type}{Student group type, either race, gender, or total}
#'   \item{student_group}{Student group}
#'   \item{n_students}{Number of students}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"legal_sch"


#' State Behavior Data by Grade Level for Kentucky Public Schools, 2014-2017
#'
#' A dataset with legal action data at the state level
#'
#' @format A dataframe with 682 rows and 7 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name - in this case, it is always "State Total"}
#'   \item{year}{School year}
#'   \item{grade}{Grade level}
#'   \item{group_type}{Student group type, either race, gender, or total}
#'   \item{student_group}{Student group}
#'   \item{n_students}{Number of students}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"legal_state"


#' State Behavior Data by Grade Level for Kentucky Public Schools, 2014-2017
#'
#' A dataset with legal action data at the district level
#'
#' @format A dataframe with 112,915 rows and 7 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{year}{School year}
#'   \item{grade}{Grade level}
#'   \item{group_type}{Student group type, either race, gender, or total}
#'   \item{student_group}{Student group}
#'   \item{n_students}{Number of students}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}


"legal_dist"


#' State Behavior Data by Grade Level for Kentucky Public Schools, 2014-2017
#'
#' A dataset with legal action data at the school level
#'
#' @format A dataframe with 456,368 rows and 8 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{sch_name}{School name}
#'   \item{year}{School year}
#'   \item{grade}{Grade level}
#'   \item{group_type}{Student group type, either race, gender, or total}
#'   \item{student_group}{Student group}
#'   \item{n_students}{Number of students}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"legal_sch"
