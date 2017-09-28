#' State Financial Summary Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with financial summary data
#'
#' @format A dataframe with 78 rows and 6 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name - in this case, it is always "State Total"}
#'   \item{year}{School year}
#'   \item{type}{Type of data, either `summary` or `salary`}
#'   \item{category}{Variable name, which includes the following: `ada` - average daily attendance; `ada_seek` - average daily attendance used for SEEK formula calculations, `adm` - average daily membership; `fte_classified` - full time equivilent classified employees; `fte_staff` - full time equivilent staff; `fte_teachers` - full time equivilent teachers; `fund_bal_pct` - percent of general fund remaining; `fund_balance` - general fund balance; `salary_bene_pct` - percent of expenditures going to salaries and benefits, `avg_p_sal` - average principal salary; `avg_t_sal` - average teacher salary; `sub_exp` - expenditures on substitute teachers, `sub_exp_pp` - per pupil expentitures on substitute teachers}
#'   \item{value}{Numerical value of variable in `category` column}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"fin_summary_state"

#' District Financial Summary Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with financial summary data
#'
#' @format A dataframe with 13,520 rows and 6 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{year}{School year}
#'   \item{type}{Type of data, either `summary` or `salary`}
#'   \item{category}{Variable name, which includes the following: `ada` - average daily attendance; `ada_seek` - average daily attendance used for SEEK formula calculations, `adm` - average daily membership; `fte_classified` - full time equivilent classified employees; `fte_staff` - full time equivilent staff; `fte_teachers` - full time equivilent teachers; `fund_bal_pct` - percent of general fund remaining; `fund_balance` - general fund balance; `salary_bene_pct` - percent of expenditures going to salaries and benefits, `avg_p_sal` - average principal salary; `avg_t_sal` - average teacher salary; `sub_exp` - expenditures on substitute teachers, `sub_exp_pp` - per pupil expentitures on substitute teachers}
#'   \item{value}{Numerical value of variable in `category` column}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"fin_summary_dist"

#' State Tax Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with tax data
#'
#' @format A dataframe with 24 rows and 5 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name - in this case, it is always "State Total"}
#'   \item{year}{School year}
#'   \item{category}{Variable name, which includes the following: `assessment` - value of assessed property including real estate, tangible property, and motor vehicles; `assessment_pp` - per pupil value of assessed property; `property` - tax rate for tangible property in cents per $100; `real_estate` - tax rate for real estate in cents per $100}
#'   \item{value}{Numerical value of variable in `category` column}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"tax_state"

#' District Tax Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with tax data
#'
#' @format A dataframe with 6,240 rows and 5 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{year}{School year}
#'   \item{category}{Variable name, which includes the following: `assessment` - value of assessed property including real estate, tangible property, and motor vehicles; `assessment_pp` - per pupil value of assessed property; `levied_eqv_rate` - tax revenue divided by assessesed value in cents per $100; `property` - tax rate for tangible property in cents per $100; `real_estate` - tax rate for real estate in cents per $100; `thirty_cent` - value of 30 cents per $100 of property assessment}
#'   \item{value}{Numerical value of variable in `category` column}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"tax_dist"

#' State Revenue and Expenditure Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with revenue and expenditure data
#'
#' @format A dataframe with 174 rows and 7 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name - in this case, it is always "State Total"}
#'   \item{year}{School year}
#'   \item{type}{Indicates if variable is `revenue` or `expenditure` data}
#'   \item{tot_pp}{Indicates if varaible is `total` amount or per pupil `pp`}
#'   \item{category}{Variable name, which includes the following: `admin` - administration; `admin_pct` - percent of expenditures spent on administration; `capital_outlay` - capital outlay; `enterprise_ops` - enterprise operations; `federal` - federal revenue; `instr_staff_support` - instrucitonal staff support; `instruction` - instruciton; `local` - local revenue; `ops_maint` - operations and maintenance; `state` - state revenue; `student_support` - student supports; `total` - total amount; `transport` - transportation}
#'   \item{value}{Numerical value of variable in `category` column}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"rev_exp_state"

#' District Revenue and Expenditure Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with revenue and expenditure data
#'
#' @format A dataframe with 30,160 rows and 7 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{year}{School year}
#'   \item{type}{Indicates if variable is `revenue` or `expenditure` data}
#'   \item{tot_pp}{Indicates if varaible is `total` amount or `pp` - per pupil, which is calculated by dividing the total by `adm` - average daily membership}
#'   \item{category}{Variable name, which includes the following: `admin` - administration; `admin_pct` - percent of expenditures spent on administration; `capital_outlay` - capital outlay; `enterprise_ops` - enterprise operations; `federal` - federal revenue; `instr_staff_support` - instrucitonal staff support; `instruction` - instruciton; `local` - local revenue; `ops_maint` - operations and maintenance; `state` - state revenue; `student_support` - student supports; `total` - total amount; `transport` - transportation}
#'   \item{value}{Numerical value of variable in `category` column}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"rev_exp_dist"

#' State SEEK Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with revenue and expenditure data
#'
#' @format A dataframe with 48 rows and 5 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name - in this case, it is always "State Total"}
#'   \item{year}{School year}
#'   \item{category}{Variable name, which includes the following: `actual_transportation_expenditures` - actual transportation expenditures; `building_local` - building fund from local sources; `building_state` - building fund from SEEK; `net_gen_fund` - total SEEK funding less restricted capital outlay; `net_gen_fund_per_pupil` - per pupil SEEK funding less restricted capital outlay; `transp_funded_pct` - SEEK transportation funding divided by total transportation spending; `transportation_seek_funding` - SEEK transportation funding}
#'   \item{value}{Numerical value of variable in `category` column}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"seek_state"

#' District SEEK Data for Kentucky Public Schools, 2012-2017
#'
#' A dataset with revenue and expenditure data
#'
#' @format A dataframe with 8,320 rows and 5 variables:
#' \describe{
#'   \item{sch_id}{ID number to identify schools & districts}
#'   \item{dist_name}{District name}
#'   \item{year}{School year}
#'   \item{category}{Variable name, which includes the following: `actual_transportation_expenditures` - actual transportation expenditures; `building_local` - building fund from local sources; `building_state` - building fund from SEEK; `net_gen_fund` - total SEEK funding less restricted capital outlay; `net_gen_fund_per_pupil` - per pupil SEEK funding less restricted capital outlay; `transp_funded_pct` - SEEK transportation funding divided by total transportation spending; `transportation_seek_funding` - SEEK transportation funding}
#'   \item{value}{Numerical value of variable in `category` column}
#' }
#'
#' @source \url{https://applications.education.ky.gov/src/DataSets.aspx}

"seek_dist"
