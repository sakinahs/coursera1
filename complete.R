setwd("~/Libraries\Documents")
#getwd() 
#list.files()

complete <- function(directory, id2 = 1:332){
        ## 'directory is a character vector of length 1 indicating
        ## the location of the CSV files
  
        # set working directory
        if(grep("specdata", directory) == 1) {
          directory <- ("./specdata/")
        }
  
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
  
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        
        allFiles <- list.files(path = directory, full.names = TRUE)
        selectedData <- data.frame()
        complete <- data.frame()
        nobs <- data.frame();
        for (id in id2) { 
          selectedData <- (read.csv(allFiles[id],header=TRUE))
          nobs <- sum(complete.cases(selectedData))
          complete <- rbind(complete, data.frame(id,nobs))
        }
        complete
        
        # test
        # complete("specdata", 1)
        # complete("specdata", c(2, 4, 8, 10, 12))
        # complete("specdata", 30:25)
        # complete("specdata", 3)
}