##  ========================================
##  Supplementary Exercise on Simplified
##   - Loops, If Else, transform
##  ========================================
    ##  Objective:
    ##  create an additional column ("job_factor") to mark "1" if job is a manager, 
    ##  or "0" otherwise


##  1. Load "company2.csv" file; (b) write a function to 
##  ------------------------------------------------------------------------------------------------
    # setwd("C:\\Users\\Andy\\Documents\\D_Drive\\R_Projects\\1_Key_R_Codes\\data")
    data <- read.csv("../../Courses/Gen Infiniti Academy Pte Ltd/S4/Andy/company2.csv", header = T, na.strings=c('','.','NA'))
    
    
    View(data)
    names(data)
    colnames(data)
##  ==========================================
##  Method 1: Using for Loop and if else:
##  ==========================================    
## loop through the whole dataset. This will store the data in a job_factor column.
    for(i in 1:nrow(data)){
      if(data[i, "job"]=="employee"){
        data$job_factor[i] <- 0
      }else{
        data$job_factor[i] <- 1
      }
    }

    
##  ============================================    
##  Method 2: Using transform and ifelse
##  ============================================    
    data <- transform(data, 
                      job_factor2 = ifelse(job == "employee", 0, 1))

    
    
##  ===================================================================
##  Method 3: Using function (with loop and if else from method 1) 
##  ===================================================================    

##  1.  Create a function
##  -----------------------------------------------------
    Job_factor_function <- function(x){
      
      ## ======= our  earlier loop function (or leave out the as.character)====  
      for(i in 1:nrow(x)){
        if(x[i, "job"]=="employee"){
          x$job_factor3[i] <- 0
        }else{
          x$job_factor3[i] <- 1
        }
      }
      ##  ========== end of loop function ======  
      
      return(x)  #this is important, if left out, you may get a "NULL" result. Return must be a new line.
    }

##  2.  Run the function
##  ----------------------
    data <- Job_factor_function(data)
