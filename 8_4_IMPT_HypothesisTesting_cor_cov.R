##  =====================================================================================
##    HYPOTHESIS TESTING - PART 4 
##    - Correlation and Covariance
##    - sign. test of correlation tests
##  =====================================================================================
##  . cov:
##      . Covariance is a measure indicating the extent to which two random variables change 
##        in tandem.
##      . lie between -ve infinity to +ve infinity
##
##  . cor:
##      . Correlation is a statistical measure that indicates how strongly two variables 
##        are related.
##      . lie between -1 and 1
##  
##  . cor(x,y) = cov(x,y)/ sqrt(var(x)*var(y))

    
  ##create and load datasets
    ## Example 1 - create count and speed vectors
    count <- c(9,25,15,2,14,25,24,47)
    speed <- c(2,3,5,9,14,24,29,34)
    
    ## Example 2 - using women dataset - average heights and weights for American women aged 30-39.
    ?women

    head(women,2)
          # height weight
        # 1     58    115
        # 2     59    117
    ## Note: try remove(list = ls()) to clear global environment if we don't get dataframe
    # remove(list = ls())
    View(women)
    
##  =================================================
##  (A) Measures of correlation (simple correlation)
##  =================================================
    ## comparison between correlations, 
    ##  check https://www.statisticssolutions.com/correlation-pearson-kendall-spearman/
    
    
    ##  (1) Simple correlation (default is using "Pearson Correlation")
    ##  ---------------------------------------------------------------
        cor(count, speed) #[1] 0.7237206
    
    
    ##  (2) Simple correlation (specify "Spearman Rho Correlation")
    ##  ------------------------------------------------------------
        cor(count, speed, method = "spearman") #[1] 0.5269556
    
    
    ##  (3) simple correlation (specify "Kendall's Tau")
    ##  ----------------------------------------------------------
        cor(count, speed, method = "kendall") #[1] 0.4000661
    
    

##  ================================================
##  (B) Covariance
##  ================================================
    
    ##  (1) Covariance -- using cov() command on variables
    ##  ----------------------------------------------------
    cov(women$height, women$weight) #[1] 69
    
    
    ##  (2) Covariance matrix -- using cov() command on dataset
    ##  --------------------------------------------------------
    cov(women)
          #         height   weight
          # height     20  69.0000
          # weight     69 240.2095
    
    
    ##  (3) Correlation matrix -- using cov2cor() to get correlation matrix from covariance matrix
    ##  ------------------------------------------------------------------------------------------
    x <- cov(women)
    cov2cor(x)
          #           height    weight
          # height 1.0000000 0.9954948
          # weight 0.9954948 1.0000000
    
    
##  ==================================================
##  (C) Significance testing  of correlation
##  ==================================================
    ##  .H0: No sign. correlation between height and weight (i.e. diff in cor=0)
    ##  .H1: Sign. correlation between height and weight (i.e. diff in cor not=0)
    
    cor.test(women$height, women$weight)
          # Pearson's product-moment correlation
          # 
          # data:  women$height and women$weight
          # t = 37.855, df = 13, p-value = 1.091e-14
          # alternative hypothesis: true correlation is not equal to 0
          # 95 percent confidence interval:
          # 0.9860970 0.9985447
          # sample estimates:
          # cor 
          # 0.9954948 
   ?cor.test 
    ## Conclusion:
    ##  . As p-value is v. small (less than 0.05) => reject H0 => sign correlation 
    ##    between height and weight