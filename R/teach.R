#' State Teacher Data for Kentucky Public Schools, 2012-2015
#'
#' A dataset with teacher data
#'
#' @format A dataframe with 4 rows and 8 variables:
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

"state_teach_stats"

#' District Teacher Data for Kentucky Public Schools, 2012-2015
#'
#' A dataset with teacher data
#'
#' @format A dataframe with 705 rows and 8 variables:
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

"dist_teach_stats"

#' School Teacher Data for Kentucky Public Schools, 2012-2015
#'
#' A dataset with teacher data
#'
#' @format A dataframe with 5721 rows and 9 variables:
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

"sch_teach_stats"

#' State Teacher Race Count Data for Kentucky Public Schools, 2014-2015
#'
#' A dataset with teacher race count data
#'
#' @format A dataframe with 13 rows and 5 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name - in this case, it is always "State Total"}
#'   \item{year}{School year}
#'   \item{t_race}{Teacher racial group}
#'   \item{count}{Number of teachers}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"state_teach_race_count"

#' District Teacher Race Count Data for Kentucky Public Schools, 2014-2015
#'
#' A dataset with teacher race count data
#'
#' @format A dataframe with 2249 rows and 5 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{year}{School year}
#'   \item{t_race}{Teacher racial group}
#'   \item{count}{Number of teachers}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"dist_teach_race_count"

#' School Teacher Race Count Data for Kentucky Public Schools, 2014-2015
#'
#' A dataset with teacher race count data
#'
#' @format A dataframe with 17860 rows and 6 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{sch_name}{School name}
#'   \item{year}{School year}
#'   \item{t_race}{Teacher racial group}
#'   \item{count}{Number of teachers}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"sch_teach_race_count"

#' State Teacher Race Percent Data for Kentucky Public Schools, 2014-2015
#'
#' A dataset with teacher race percent data
#'
#' @format A dataframe with 13 rows and 5 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name - in this case, it is always "State Total"}
#'   \item{year}{School year}
#'   \item{t_race}{Teacher racial group}
#'   \item{pct}{Percent of teachers}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"state_teach_race_pct"

#' District Teacher Race Percent Data for Kentucky Public Schools, 2014-2015
#'
#' A dataset with teacher race percent data
#'
#' @format A dataframe with 2249 rows and 5 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{year}{School year}
#'   \item{t_race}{Teacher racial group}
#'   \item{pct}{Percent of teachers}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"dist_teach_race_pct"

#' School Teacher Race Percent Data for Kentucky Public Schools, 2014-2015
#'
#' A dataset with teacher race percent data
#'
#' @format A dataframe with 17517 rows and 6 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{sch_name}{School name}
#'   \item{year}{School year}
#'   \item{t_race}{Teacher racial group}
#'   \item{pct}{Percent of teachers}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"sch_teach_race_pct"

#' State Teacher Gender Count Data for Kentucky Public Schools, 2014-2015
#'
#' A dataset with teacher gender count data
#'
#' @format A dataframe with 4 rows and 5 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name - in this case, it is always "State Total"}
#'   \item{year}{School year}
#'   \item{t_gender}{Teacher gender}
#'   \item{count}{Number of teachers}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"state_teach_gender_count"

#' District Teacher Gender Count Data for Kentucky Public Schools, 2013-2015
#'
#' A dataset with teacher gender count data
#'
#' @format A dataframe with 1040 rows and 5 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{year}{School year}
#'   \item{t_gender}{Teacher gender}
#'   \item{count}{Number of teachers}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"dist_teach_gender_count"

#' School Teacher Gender Count Data for Kentucky Public Schools, 2013-2015
#'
#' A dataset with teacher gender count data
#'
#' @format A dataframe with 8074 rows and 6 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{sch_name}{School name}
#'   \item{year}{School year}
#'   \item{t_gender}{Teacher gender}
#'   \item{count}{Number of teachers}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"sch_teach_gender_count"

#' State Teacher Gender Percent Data for Kentucky Public Schools, 2013-2014
#'
#' A dataset with teacher gender percent data
#'
#' @format A dataframe with 4 rows and 5 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name - in this case, it is always "State Total"}
#'   \item{year}{School year}
#'   \item{t_gender}{Teacher gender}
#'   \item{pct}{Percent of teachers}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"state_teach_gender_pct"

#' District Teacher Gender Percent Data for Kentucky Public Schools, 2013-2015
#'
#' A dataset with teacher gender percent data
#'
#' @format A dataframe with 1040 rows and 5 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{year}{School year}
#'   \item{t_gender}{Teacher gender}
#'   \item{pct}{Percent of teachers}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"dist_teach_gender_pct"

#' School Teacher Gender Percent Data for Kentucky Public Schools, 2013-2015
#'
#' A dataset with teacher gender percent data
#'
#' @format A dataframe with 7874 rows and 6 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{sch_name}{School name}
#'   \item{year}{School year}
#'   \item{t_gender}{Teacher gender}
#'   \item{pct}{Percent of teachers}
#' }
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"sch_teach_gender_pct"
