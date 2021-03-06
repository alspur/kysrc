#' State Teacher Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with teacher data
#'
#' @format A dataframe with 6 rows and 24 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name - in this case, it is always "State Total"}
#'   \item{year}{School year}
#'   \item{fte_total}{Number of full-time equivalent teachers}
#'   \item{fte_male}{Number of full-time equivalent male teachers}
#'   \item{fte_female}{Number of full-time equivalent female teachers}
#'   \item{fte_white}{Number of full-time equivalent White teachers}
#'   \item{fte_black}{Number of full-time equivalent Black teachers}
#'   \item{fte_hispanic}{Number of full-time equivalent Hispanic teachers}
#'   \item{fte_asian}{Number of full-time equivalent Asian teachers}
#'   \item{fte_aian}{Number of full-time equivalent American Indian/Alaska Native teachers}
#'   \item{fte_hawaiian}{Number of full-time equivalent Hawaiian teachers}
#'   \item{fte_2more}{Number of full-time equivalent 2 or more race teachers}
#'   \item{fte_race_total}{Number of full-time equivalent teachers reporting race}
#'   \item{ba_pct}{Percent of teachers wtih a BA}
#'   \item{ma_pct}{Percent of teachers wtih a MA}
#'   \item{rank1_pct}{Percent of teachers wtih a Rank 1}
#'   \item{special_pct}{Percent of teachers wtih a Specialist degree}
#'   \item{dr_pct}{Percent of teachers wtih a Doctorate}
#'   \item{t_degree_pct}{Percent of teachers wtih a degree}
#'   \item{prov_pct}{Percent of teachers wtih provisional certification}
#'   \item{s_per_t}{Number of students per teacher, excluding administrators, guidance counselors, media specialists, and resource teachers}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"teach_state"

#' District Teacher Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with teacher data
#'
#' @format A dataframe with 1,059 rows and 24 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{year}{School year}
#'   \item{fte_total}{Number of full-time equivalent teachers}
#'   \item{fte_male}{Number of full-time equivalent male teachers}
#'   \item{fte_female}{Number of full-time equivalent female teachers}
#'   \item{fte_white}{Number of full-time equivalent White teachers}
#'   \item{fte_black}{Number of full-time equivalent Black teachers}
#'   \item{fte_hispanic}{Number of full-time equivalent Hispanic teachers}
#'   \item{fte_asian}{Number of full-time equivalent Asian teachers}
#'   \item{fte_aian}{Number of full-time equivalent American Indian/Alaska Native teachers}
#'   \item{fte_hawaiian}{Number of full-time equivalent Hawaiian teachers}
#'   \item{fte_2more}{Number of full-time equivalent 2 or more race teachers}
#'   \item{fte_race_total}{Number of full-time equivalent teachers reporting race}
#'   \item{ba_pct}{Percent of teachers wtih a BA}
#'   \item{ma_pct}{Percent of teachers wtih a MA}
#'   \item{rank1_pct}{Percent of teachers wtih a Rank 1}
#'   \item{special_pct}{Percent of teachers wtih a Specialist degree}
#'   \item{dr_pct}{Percent of teachers wtih a Doctorate}
#'   \item{t_degree_pct}{Percent of teachers wtih a degree}
#'   \item{prov_pct}{Percent of teachers wtih provisional certification}
#'   \item{s_per_t}{Number of students per teacher, excluding administrators, guidance counselors, media specialists, and resource teachers}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"teach_dist"

#' School Teacher Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with teacher data
#'
#' @format A dataframe with 8,594 rows and 25 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{sch_name}{School name}
#'   \item{year}{School year}
#'   \item{fte_total}{Number of full-time equivalent teachers}
#'   \item{fte_male}{Number of full-time equivalent male teachers}
#'   \item{fte_female}{Number of full-time equivalent female teachers}
#'   \item{fte_white}{Number of full-time equivalent White teachers}
#'   \item{fte_black}{Number of full-time equivalent Black teachers}
#'   \item{fte_hispanic}{Number of full-time equivalent Hispanic teachers}
#'   \item{fte_asian}{Number of full-time equivalent Asian teachers}
#'   \item{fte_aian}{Number of full-time equivalent American Indian/Alaska Native teachers}
#'   \item{fte_hawaiian}{Number of full-time equivalent Hawaiian teachers}
#'   \item{fte_2more}{Number of full-time equivalent 2 or more race teachers}
#'   \item{fte_race_total}{Number of full-time equivalent teachers reporting race}
#'   \item{ba_pct}{Percent of teachers wtih a BA}
#'   \item{ma_pct}{Percent of teachers wtih a MA}
#'   \item{rank1_pct}{Percent of teachers wtih a Rank 1}
#'   \item{special_pct}{Percent of teachers wtih a Specialist degree}
#'   \item{dr_pct}{Percent of teachers wtih a Doctorate}
#'   \item{t_degree_pct}{Percent of teachers wtih a degree}
#'   \item{prov_pct}{Percent of teachers wtih provisional certification}
#'   \item{s_per_t}{Number of students per teacher, excluding administrators, guidance counselors, media specialists, and resource teachers}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"teach_sch"
