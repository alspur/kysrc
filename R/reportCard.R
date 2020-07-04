#' @title State Report Card Downloader
#' @description Function used to download Kentucky District/School 
#' Report Card Data sets from the 2013-2016 school years.  Parallel 
#' download can be enabled provided the end-user has properly 
#' configured the appropriate parallelization framework on their instance
#' of R.
#' @param dir Directory where files will be saved and the directory tree will be 
#' built
#' @param parallelProcessing Boolean indicating whether or not function should 
#' use parallel backend (must be properly set up and initialized by end user 
#' prior to passing a true value to this parameter).  Defaults to FALSE.
#' @param schyr Optional parameter used to specify individual school years to 
#' retrieve from the website.  Available options are: 2014, 2015, and 2016.  The 
#' year value identifies the end of the academic year (e.g., 2016 = 2015-2016 
#' academic year).  Defaults to c(2014, 2015, 2016).
#' @param replace Boolean indicating whether or not files should be overwritten 
#' if they already exist in that location.  Defaults to TRUE.
#' @return Function returns a list containing the file tree for the files downloaded
#' by this function
#' @examples \dontrun{
#' 
#' # Download all the files to the Desktop
#' reportCard("~/Desktop/")
#' 
#' # Load library for parallelization
#' library(doMC)
#' 
#' # Set up parallel backend
#' registerDoMC(cores = 8)
#' 
#' # Download only recently updated files to Desktop in parallel
#' reportCard("~/Desktop/", parallelProcessing = TRUE, schyr = 2016)
#' }
#' @import magrittr
#' @importFrom xml2 read_html
#' @importFrom rvest html_nodes html_attr
#' @importFrom dplyr as_data_frame filter mutate select 
#' @importFrom plyr llply l_ply
#' @export

reportCard <- function(dir, parallelProcessing = FALSE, schyr = NULL, 
					   replace = TRUE) {
	
	# Set default value for schyr
	if (is.null(schyr)) schyr <- c(2014, 2015, 2016)
	
	# Root of the site with the file list and data sets
	root <- "http://applications.education.ky.gov/SRC/"
	
	# Scrape all the links for the data sets from the site
	site <- xml2::read_html(paste0(root, "DataSets.aspx")) %>% 
			rvest::html_nodes("a") %>% 
			rvest::html_attr("href") %>% 
		    cbind() %>% as.data.frame(stringsAsFactors = FALSE)
	
	# Name the variable
	names(site) <- "links"
	
	# Make full URLs to the files and also create POSIX conforming file names 
	test <- site %>% dplyr::filter(grepl("^DataSets/*", site$links)) %>%
			dplyr::mutate(file = ifelse(grepl("/201\\d201\\d/", links), 
										gsub("/", "-", links),
										gsub("/", "-20132014-", links)),
						  links = paste0(root, links))
	
	# Generates the school year variable in the data set and filters based on 
	# the arguments passed to the schyr parameter
	test %<>% dplyr::mutate(schyear = substring(gsub("\\D", "", file), 5, 8)) %>%
			  dplyr::filter(schyear %in% schyr)	%>%
			  dplyr::mutate(dlPath = paste0(dir, "/", schyear))
	
	# Turn the links into a list
	dl <- as.list(test$links)
	
	# Turn the download paths into a list
	dlPaths <- as.list(test$dlPath)
	
	# Name the list elements with the file names
	names(dl) <- test$file; names(dlPaths) <- test$file
	
	# Change this value to store the files in a different location
	dlDirectory <- root
	
	# Makes sure that things will get stored in this directory by making it the 
	# working directory
	setwd(dlDirectory)
	
	# Test for existence of dl subdirectories
	plyr::l_ply(as.list(unique(dlPaths)), .parallel = parallelProcessing, 
				.fun = function(x) {
		
		# Create the directory if it doesn't already exist						
		if (dir.exists(x) == FALSE) dir.create(x)	
					
	}) # End plyr::l_ply function call for subdirectory construction
	
	# Iterates over the links and downloads the MS Excel files
	plyr::l_ply(as.list(names(dl)), .parallel = parallelProcessing, 
				.fun = function(x) {
					
		# Construct variable to store the file path/name						
		dlFileName <- paste0(dlPaths[[x]], '/', gsub("DataSets-201\\d201\\d-", "", x))			
		
		# If replace option and the file exists delete and replace
		if (file.exists(dlFileName)) {
			
			# If the replace option is set 
			if (replace == TRUE) {
				
				# Delete the existing file 
				file.remove(dlFileName)
				
				# Download the file again
				download.file(dl[[x]], dlFileName, method = "curl")
				
			# If the replace option is set to false	
			} else {
				
				# Print a message to the console
				print(paste("The file", dlFileName, 
							"already exists and will not be replaced"))
				
			} # End ELSE Block for replace parameter
			
		# if the file doesn't exist download it
		} else download.file(dl[[x]], dlFileName, method = "curl")

	}) # End plyr::l_ply function call

	# Gets directory tree
	tree <- plyr::llply(as.list(schyr), .fun = function(x) {
		yearDirectory <- paste0(dir, x)
		return(as.list(list.files(yearDirectory, recursive = TRUE, full.names = TRUE)))
	})
	
	# Names the list elements with the school years
	names(tree) <- schyr
	
	# Returns the directory tree when the function completes
	return(tree)
  
} # End of Function
