##  ==============================================================
##  Handling Missing Values - part 1 (missing values in vector)
##  ==============================================================

    ##  Let's create our vector dataset
    ##  --------------------------------
        salary <- c(2000, 3000, NA, 4000) 
        
        salary 
            #[1] 2000 3000   NA 4000

    
    ##  problem if there are missing values
    ##  --------------------------------------
        sum(salary)  #problem with mathematical manipulations, as we can't add NA values
            # [1] NA
          
        length(salary)  # count is not a problem. NA value is counted
            # [1] 4
        
        

##  (1) Detecting NAs
##  ------------------------------
        
    ## (a) using "is.na()" command --> returns "TRUE" if there are missing values
    ##  --------------------------------------------------------------------------
        is.na(salary)   # is it NA?
            #[1] FALSE FALSE  TRUE FALSE
            # Comment: we can find out if there are NA values in the elements of a vector

        
    ##  Note: wrap a "which()" command around "is.na()" command can inform us the position
    ##  --------------------------------------------------------------------------------
        which(is.na(salary))  #which one is the NA value?
            # [1] 3
                # comment: the 3rd value is NA
        
        
    ##  (b) using complete.cases() command will return TRUE if no missing values
    ##  -----------------------------------------------------------------------
        complete.cases(salary) # is it complete?
            #[1]  TRUE  TRUE FALSE  TRUE
        
        
        which(complete.cases(salary)) # which one is complete?
            #[1] 1 2 4
        
                # which(!complete.cases(salary)) # same answer as which(is.na(salary))
            
##  (2) Ways to exclude NA
##  -----------------------
        
    ##  (a) using "na.rm=TRUE" parameter
    ##  ----------------------------
        sum(salary, na.rm=T)
            # [1] 9000
            
            
    ##  (b) run a "na.omit()" or "na.exclude()" command in vector, and 
    ##      then wrap a math operation (e.g. sum) around it
    ##  -----------------------------------------------------------------------------------------------------------
        sum(na.omit(salary)) # drop NA values, and run sum after it
            #[1] 9000
            
        sum(na.exclude(salary))
            #[1] 9000


         
    ##  (c) Subsetting -- working on perfect values using suitable NA detection methods (as described above)
    ##  ----------------------------------------------------------------------------------------------            
        ##  (i) using !is.na() method
        ##  -------------------------
        salary[!is.na(salary)] # [1] 2000 3000 4000
        
        sum(salary[!is.na(salary)]) 
              # [1] 9000
        
        
        
        ##  (ii) using complete.cases() method
        ##  ----------------------------------
        salary[complete.cases(salary)] #[1] 2000 3000 4000
        
        sum(salary[complete.cases(salary)])
              # [1] 9000
        
        
        
        ##  Other notes
        ##  ---------------
       # salary[3] <- 3500
       # salary 
        
       salary <-  na.omit(salary)  # replace and get rid of missing values
        

        # salary[]
            # [1] 2000 3000   NA 4000
            ##  comment: this is the same as just running "salary"

        # is.vector(salary[])
            # [1] TRUE
        
        # salary[which(!is.na(salary))]
        #     #[1] 2000 3000 4000
        