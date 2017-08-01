# function_help.R

# function to select only state-level data
select_state <- function(df){

  state_df <- df %>%
    filter(sch_id == 999) %>% # filter for state id number
    select(-sch_name) %>% # this is redudndant - just reads "state total"
    mutate(dist_name = "State") # make this label consistent

  return(state_df)
}

# function to select only district-level data
select_dist <- function(df){

  dist_df <- df %>%
    filter(sch_id != 999) %>% # exclude state id number
    filter(str_length(sch_id) == 3) %>% # only include id numbers w/ 3 chars
    select(-sch_name) # remove redundant col - all values are "District Total"

  return(dist_df)
}

# function to select only school-level data
select_sch <- function(df){

  sch_df <- df %>%
    filter(str_length(sch_id) == 6) # only include id numbers w/ 6 chars

  return(sch_df)
}


# create function to convert chars to nums, handling "," in 1000+ numbers
char_to_num <- function(string = ""){

  strip_dollar <- str_replace_all(string, "\\$", "")

  as.numeric(str_replace_all(strip_dollar, ",", ""))
}

# convert all colnames to lower

col_lower <- function(df){
  tolower(colnames(df))
}

# create function to convert percentages to numbers
pct_to_num <- function(string = ""){
  as.numeric(str_replace_all(string, "%", "")) / 100
}
