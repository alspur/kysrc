#' @title State Report Card Downloader
#' @description Function used to download Kentucky District/School 
#' Report Card Data sets from the 2013-2016 school years.  Parallel 
#' download can be enabled provided the end-user has properly 
#' configured the appropriate parallelization framework on their instance
#' of R.
#' @param root This is the directory where annual subdirectories and their 
#' associated files will be stored on the end user's machine.  The default value 
#' for this parameter is "~/Desktop/rcdownload/".  Windows users must provide 
#' a valid filepath under their system's file system conventions.
#' @param para A boolean used to set whether or not to process the downloading 
#' in parallel
#' @return Function returns a list containing the file tree for the files downloaded
#' by this function
#' @examples \donttest{
#' 
#' # Will download files to ~/Desktop/rcdownload/
#' filelist <- getReportCards()
#' 
#' # Do the same but in parallel
#' library(doMC)
#' registerDoMC(cores = 8)
#' filelist <- getReportCards(para = TRUE)
#' 
#' # Do the same as above but store in a new location
#' filelist <- getReportCards(root = "C:/Users/UserName/Desktop/KDEReportCards/", para = TRUE)
#' 
#' }
#' @import magrittr
#' @importFrom xml2 read_html
#' @importFrom rvest html_nodes html_attr
#' @importFrom dplyr as_data_frame filter mutate select 
#' @importFrom plyr llply l_ply

getReportCards <- function(root = NULL, para = FALSE) {

  # Directory where the files will be downloaded
  if (is.null(root)) root <- "~/Desktop/rcdownload/"
  
  # Creates root directory if it does not already exist
  if !(dir.exists(root)) dir.create(root, recursive = TRUE)
  
  dlRoot <- "https://applications.education.ky.gov/src/"
  
  # Gets all links from Data Set website
  datasets <- paste0(dlRoot, "DataSets.aspx") %>%
              xml2::read_html() %>% 
              rvest::html_nodes("a") %>% 
              rvest::html_attr("href") %>%
              dplyr::as_data_frame() %>% 
              dplyr::mutate(link = value, valid = grepl("^DataSets.*", value)) %>%
              dplyr::filter(valid == TRUE) %>%
              dplyr::mutate(schyr = ifelse(grepl("[0-9]{8}", link),
                                           substr(grep("[0-9]{8}", link, value = TRUE), 14, 17),
                                           "2013"),
                            filenm = gsub("DataSets/([0-9]{8}/)?", "", link)) %>% 
              dplyr::select(link, schyr, filenm) 
  
  # Creates separate list of school years to use for creating subdirectories
  # and spliting the work load
  schyrs <- unique(datasets$schyr) %>% as.list()
  
  # Create school year based lists of the links and file names
  lists <- plyr::llply(schyrs, .fun = function(x) {
    yearDirectory <- paste0(root, x)
    if (!(dir.exists(yearDirectory)) == TRUE) dir.create(yearDirectory, recursive = TRUE)
    v <- dplyr::filter(datasets, schyr == x)
    retval <- list("links" = v$link, "filenm" = v$filenm, "indices" = as.list(c(1:length(v$filenm))))
    return(retval)
  })
  
  # Name the list elements
  names(lists) <- c(schyrs)
  
  # Iterate over the school years
  plyr::l_ply(schyrs, .parallel = para, .fun = function(x) {
    iterator <- lists[[x]][["indices"]]
    plyr::l_ply(iterator, .parallel = para, .fun = function(y) {
      tofile <- paste0(root, x, "/", lists[[x]][["filenm"]][[y]])
      download.file(paste0(dlRoot, lists[[x]][["links"]][[y]]), tofile, method = "curl")   
    })
  })
  
  # Gets directory tree
  tree <- plyr::llply(schyrs, .fun = function(x) {
    yearDirectory <- paste0(root, x)
    return(as.list(list.files(yearDirectory, recursive = TRUE, full.names = TRUE)))
  })
  
  # Names the list elements with the school years
  names(tree) <- schyrs
  
  # Returns the directory tree when the function completes
  return(tree)
  
}  
