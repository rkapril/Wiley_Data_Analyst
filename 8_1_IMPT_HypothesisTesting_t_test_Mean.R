##  =============================================================================
##    HYPOTHESIS TESTING - PART 1 
##    - t-test for means
##  =============================================================================
    ##  Create and load sample data
          data1 <- c(3,5,7,5,3,2,6,8,5,6,9,
                     4,5,7,3,4)
          data2 <- c(6,7,8,7,6,3,8,9,10,7,6,9)

##  ===============================================================
##  (A) Two-Sample T-Test for Mean (comparing two samples)
##  ===============================================================

    ##  Student's t-test - for comparing 2 samples (e.g. to determine whether samples 
    ##  are different)
    ##  -------------------------------------------------------------------------------------------------
          ## Formulate hypotheses:
          ##    .H0: no difference in mean of 2 samples (diff = 0)
          ##    .H1: there is sign. diff in mean between the 2 samples (diff not equal 0)
          
          
          ##  (a) 2-sample t-test with unequal variance (aka unpooled t-test)
          ##  ---------------------------------------------------------------
              ## by default, the var.equal is set to F
                t.test(data1, data2)  # we use this test if we don't assume the variance are equal
                            # Welch Two Sample t-test
                            # 
                            # data:  data1 and data2
                            # t = -2.8151, df = 24.564, p-value = 0.009462
                            # alternative hypothesis: true difference in means is not equal to 0
                            # 95 percent confidence interval:
                            #   -3.5366789 -0.5466544
                            # sample estimates:
                            #   mean of x mean of y 
                            # 5.125000  7.166667 
                ## Conclusion :
                ##  . As p-value is small (less than 0.05) => reject H0 of no diff => 
                ##    there is sign diff in mean
          ?t.test()
          
          
          ##  (b) 2-sample t-test with equal variance (aka pooled t-test)
          ##  -------------------------------------------------------------
                t.test(data1,data2, 
                       var.equal = TRUE)
                            # Two Sample t-test
                            # 
                            # data:  data1 and data2
                            # t = -2.7908, df = 26, p-value = 0.009718
                            # alternative hypothesis: true difference in means is not equal to 0
                            # 95 percent confidence interval:
                            #   -3.5454233 -0.5379101
                            # sample estimates:
                            #   mean of x mean of y 
                            # 5.125000  7.166667 
          ## Conclusion :
          ##  . As p-value is small (less than 0.05) => reject H0 of no diff => 
          ##    there is sign diff in mean
          
          
        ## Additional Notes:
        ##  ----------------
        ##  . typically we are given whether the variances are equal or not equal.
        ##  . alternatively, we can also calculate using var.test(); where:
        ##      . H0  : variances are equal
        ##      . H1  : variances are not equal
        var.test(x=data1, y=data2)  # as p-value is large => var are equal => pooled t-test
 
          
          
##  =================================================================================
##  (B) One Sample T-Test for Mean (test Whether Mean is = to specific known value)
##  =================================================================================
          ## Formulate hypotheses:
          ##    .H0: no difference in mean of sample and hypothesized value 
          ##          (diff = 0; mean = hypothesised value)
          ##    .H1: there is sign. diff in mean of sample and hypothesized value 
          ##          (diff not equal 0; mean not equal to hypothesised value)
          
                
    ##  1-sample t-test -- for testing mean of samples (esp when population of collected 
    ##      data in unknown)
    ##  ----------------------------------------------------------------------------------------------------
          ##  (a) 1-sample t-test -- the mean defaults to 0; "two-sided" test
          ##  ----------------------------------------------------------------
                mean(data1) # we need to find mean of dataset to do a 1-sample t-test
                            # [1] 5.125
              
                t.test(data1, mu=5)     # this is the same as t.test(data1, mu=5, 
                                        ##  alternative='two.sided')
                            # One Sample t-test
                            # 
                            # data:  data1
                            # t = 0.25482, df = 15, p-value = 0.8023
                            # alternative hypothesis: true mean is not equal to 5
                            # 95 percent confidence interval:
                            #   4.079448 6.170552
                            # sample estimates:
                            #   mean of x 
                            # 5.125          
          
              ##  Conclusion:
              ##    .As p-value is high (higher than 0.05) => fail to reject H0 of no diff => 
                ##    sample mean is approx equal to hypothesized value of 5
                
                
          ##  (b) using "directional" 1-sample t-test:
          ##      - to see if means of 2 samples are different;
          ##      - to see if a sample mean is lower or greater than another sample mean
          ##        (we can specify: "two-sided", "less", or "greater")
                
              ##  (i) 1-sample t-test with "greater" option
              ##  ------------------------------------------
                ## Formulate hypotheses:
                ##    .H0: mean is less than or equal to hypothesized value of 5
                ##    .H1: mean is greater than hypothesized value of 5
                ?t.test
                    t.test(data1, mu=5, 
                           alternative = 'greater') # can also use 'less'
                            # One Sample t-test
                            # 
                            # data:  data1
                            # t = 0.25482, df = 15, p-value = 0.4012
                            # alternative hypothesis: true mean is greater than 5
                            # 95 percent confidence interval:
                            #   4.265067      Inf
                            # sample estimates:
                            #   mean of x 
                            # 5.125 
    
                ##  Conclusion:
                ##    .As p-value is high (higher than 0.05) => fail to reject H0
                    #=> sample mean is less than or equal to hypothesized value of 5
                
                
                            
              ##  (ii)  1-sample t-test with "less" option
              ##  ----------------------------------------
                    ##  H0: mean is greater or equal to hypothesized value of 5
                    ##  H1: mean is less than hypothesized value of 5
                    
                    # t.test(data1, mu=5, alternative = 'less')
                            # One Sample t-test
                            # 
                            # data:  data1
                            # t = 0.25482, df = 15, p-value = 0.5988
                            # alternative hypothesis: true mean is less than 5
                            # 95 percent confidence interval:
                            #   -Inf 5.984933
                            # sample estimates:
                            #   mean of x 
                            # 5.125

                
                