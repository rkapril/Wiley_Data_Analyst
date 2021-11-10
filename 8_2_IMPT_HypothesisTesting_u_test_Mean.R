##  =====================================================================================
##    HYPOTHESIS TESTING - PART 2 
##    - U-test for means (aka Mann-Whitney u-test or Wilcoxon Rank Sum test)
##    - Wilcoxon Signed Rank test -- used to test for population means rank difference
##  =====================================================================================
    ## When we have two samples to compare and our data is non-parametric (i.e. doesn't 
    ##  necessary follow prob distribution)
    ## Hence, the sample ranks will be used instead.

    ##  Create and load sample data
        data1 <- c(3,5,7,5,3,2,6,8,5,6,9,4,5,7,3,4)
        data2 <- c(6,7,8,7,6,3,8,9,10,7,6,9)
        
        help("wilcox.test")
        
        # wilcox.test(x, y = NULL,
        #             alternative = c("two.sided", "less", "greater"),
        #             mu = 0, paired = FALSE, exact = NULL, correct = TRUE,
        #             conf.int = FALSE, conf.level = 0.95, .)
        
        
##  =================================================================================
##  (A) Two-Sample U-Test for Median (aka "location shift") (comparing two samples)
##  =================================================================================
        
    ##  U-test - for comparing 2 samples (e.g. to determine whether samples are different)
    ##  -------------------------------------------------------------------------------------------------
    ## Formulate hypotheses:
        ##    .H0: no difference in median of 2 samples (diff = 0)
        ##    .H1: there is sign. diff in median between the 2 samples (diff not equal 0)
        
      wilcox.test(data1, data2, exact=FALSE) #exact =FALSE (to suppress warnings)
        
        # Wilcoxon rank sum test with continuity correction
        # 
        # data:  data1 and data2
        # W = 41.5, p-value = 0.01138
        # alternative hypothesis: true location shift is not equal to 0 
        
        ## Conclusion:
        ##  . As p-value is small (less than 0.05) => reject H0 of no diff => 
        #     accept H1 that median ("location shift") are diff.
        
        
        
##  =======================================================================================================
##  (B) One-Sample u-test (compare whether sample median is different from 
##        hypothesized value of 0 (default))
##  =======================================================================================================

    ## Formulate hypotheses:
    ##    .H0: no difference in median of sample and 
    ##          hypothesized value (diff = 0; median = hypothesised value of 0)
    ##    .H1: there is sign. diff in median of sample and 
    ##          hypothesized value (diff not equal 0; median not equal to 0)
        
        
    ##  (1) two-sided test
    ##  -------------------
        wilcox.test(data1, exact=FALSE)
            # Wilcoxon signed rank test with continuity correction
            # 
            # data:  data1
            # V = 136, p-value = 0.0004647
            # alternative hypothesis: true location is not equal to 0       
        
      ##  Conclusion:
      ##    . As p-value is small (less than 0.05) => reject H0 that median=0 => 
      ##      median is not = 0
        
        
    ##  (2) one-sided test
    ##  -------------------
        ## Formulate hypotheses:
        ##    .H0: median of sample is >=8 (hypothesized value)
        ##    .H1: median of sample < 8 (hypothesized value)
        
        
        
        wilcox.test(data1, mu=8, exact=FALSE, 
                    conf.int=TRUE, alt="less") 
                          #default: mu=0 (here, we set to 8 instead)
            # data:  data1
            # V = 2, p-value = 0.0005208
            # alternative hypothesis: true location is less than 8
            # 95 percent confidence interval:
            #   -Inf 5.999988
            # sample estimates:
            #   (pseudo)median 
            # 4.999988 
        
        ##  Conclusion:
        ##    . As p-value is small (less than 0.05) => reject H0 that median>=8 => 
        ##      median is < 8
        