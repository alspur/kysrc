select_state <- function(df){

  state_df <- df %>%
    filter(sch_id == 999) %>% # filter for state id number
    select(-sch_name) %>% # this is redudndant - just reads "state total"
    mutate(dist_name = "State") # make this label consistent

  return(state_df)
}

select_dist <- function(df){

  dist_df <- df %>%
    filter(sch_id != 999) %>% # exclude state id number
    filter(str_length(sch_id) == 3) %>% # only include id numbers w/ 3 chars
    select(-sch_name) # remove redundant col - all values are "District Total"

  return(dist_df)
}

select_sch <- function(df){

  sch_df <- df %>%
    filter(str_length(sch_id) == 6) # only include id numbers w/ 6 chars

  return(sch_df)
}
