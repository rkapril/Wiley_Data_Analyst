##  =====================================================================================
##    HYPOTHESIS TESTING - PART 3 
##    - Paired tests: paired t-test and paired u-tests
##  =====================================================================================
##  . Use this when there is a situation of paired data (e.g. to see if there is a 
##    difference before and after treatment)
##  . We can simply add "paired=TRUE" as an additional parameter.

    ## Create and Load Data
    ##  -------------------------
        treatment_1 <- data.frame(
          before = c(4,3,4,1,6,4,6,4),
          after = c(4,7,2,2,7,10,5,8)
          )        

        treatment_1 
                #     before after
                # 1      4     4
                # 2      3     7
                # 3      4     2
                # 4      1     2
                # 5      6     7
                # 6      4    10
                # 7      6     5
                # 8      4     8
        
        
##  ==========================================
##  (A) Paired u-test
##  ==========================================
    ##  .H0: No sign. diff in median of paired samples (diff = 0)
    ##  .H1: Sign. diff in median of paired samples (diff not equal 0)
        
    wilcox.test(treatment_1$before, 
                treatment_1$after, 
                exact=FALSE, paired=TRUE)
        
    #Alternatively:    
    attach(treatment_1) #   with this, we can assess variables directly without subsetting
    wilcox.test(before, after, exact=FALSE, 
                paired=TRUE)
            # Wilcoxon signed rank test with continuity correction
            # 
            # data:  before and after
            # V = 6, p-value = 0.2008
            # alternative hypothesis: true location shift is not equal to 0

    ##  Conclusion:
    ##    .Since p-value is large (>0.05) => fail to reject H0 
    #=> the samples have no sign. diff in median
  

##  ===========================================
##  (B) Paired t-test
##  ===========================================
    ##  check the rounded difference in mean; and use a t-test to 
    ## check if diff is equal or less than a certain value
    
    
        ##  (1) check the diff in mean
    ##  --------------------------
    attach(treatment_1)
    mean(before); mean(after)
        # [1] 4
        # [1] 5.625
    
    
        ##  (2) use a paired t-test to check if diff is less than 2
    ##  ----------------------------------------------------------------------
        # .H0: Diff in mean >= 2
        # .H1: Diff in mean < 2
    attach(treatment_1)
    t.test(before, after, paired=TRUE, 
           mu=2, alternative = "less")
    
    
    detach(treatment_1)
    
    
    ##alternatively:
    with(treatment_1, t.test(before, after, 
                             paired=TRUE, mu=2, 
                             alternative = "less"))
        # with(dataset, expression) is a way to evaluate expression using sub-data points 
        # that are inside the dataset

            # Paired t-test
            # 
            # data:  before and after
            # t = -3.6958, df = 7, p-value = 0.003849
            # alternative hypothesis: true difference in means is less than 2
            # 95 percent confidence interval:
            #   -Inf 0.2332847
            # sample estimates:
            #   mean of the differences 
            # -1.625 
    
        ##  Conclusion:
        ##    . As p-value is small (less than 0.05) => reject H0 => diff in mean is <2
    
    
##  ============================================
##  (C) Optional: Shapiro-Wik Normality Test
##  ============================================
    ## This is a test to ascertain if data can be well-model using a normal distribution
    
    ##  H0: Data can be modelled using a normal distribution
    ##  H1: Data cannot be well-modelled using a normal distribution
    
    shapiro.test(before)
          # Shapiro-Wilk normality test
          # 
          # data:  before
          # W = 0.87746, p-value = 0.1781
    
    shapiro.test(after)
        # Shapiro-Wilk normality test
        # 
        # data:  after
        # W = 0.9402, p-value = 0.6131
    
    ## comment: since data is larger than 0.05 for both before and after, hence cannot reject
    ##          that data is normal => can use a paried t-test as opposed to paired u-test