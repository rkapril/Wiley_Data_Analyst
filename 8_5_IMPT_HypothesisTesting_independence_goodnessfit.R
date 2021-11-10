##  =====================================================================================
##    HYPOTHESIS TESTING - PART 5 
##    - Test for Association (aka test for independence)
##    - Test for Goodness-of-fit
##  =====================================================================================
##  source: https://www.r-bloggers.com/the-chi-squared-test-of-independence-an-example-in-both-r-and-sas/
##        https://www.youtube.com/watch?v=6YhC45HIlAQ
##
##   . Independence Test:
##         . This is used when we want to know if the output is dependent on some suspected 
##            variable.
##         . Say we want to know whether brand preference depends on age or not.
##
##  . Goodness of fit:
##        . This is generally used when we want to test whether the data follows a particular 
##          distribution or not.
##        . We want to know whether a dice is fair or not.
##        . If a dice is fair it's output will follow a binomial distribution.
##        . Say,we are recording the number of 6's in 3 rolls of a dice,repeated 100 times.


    ## create our dataset
    ##  ------------------------------

    ## Example 1 - ice cream
    ##  ---------------------
      # Entering the data into vectors
          men = c(100, 120, 60)
          women = c(350, 200, 90)
      
      # combining the row vectors in matrices, then converting the matrix into a data frame
          ice.cream.survey = as.data.frame(rbind(men, 
                                                 women))
      
      # assigning column names to this data frame
          names(ice.cream.survey) = c('chocolate', 
                                      'vanilla', 
                                      'strawberry')
          
          ice.cream.survey
              #       chocolate vanilla strawberry
              # men         100     120         60
              # women       350     200         90

          
      ## Example 2 : colour distribution of M&Ms
      ##  -----------------------------------
          x <- c(13,9,7,4,13,7) # observed distribution of M&M colours based on sample
          m <- c(0.13, 0.13, 0.2, 0.16, 0.24, 0.14) #hypothesized distribution (claimed by M&M)
          sum(m) #check that it sums to 1
          
          
##  ==============================================
##  (A) Test of Association (=Independence Test)
##  ==============================================
    ##objective:
    ##  .In this example, we seek to determine whether or not there is 
    ##    an association between gender and preference for ice cream flavour - 
    ##    these are the 2 categorical variables of interest.
          
    # .H0:  no sign. diff between gender and icecream flavours (diff = 0)
    # .H1:  sign. diff between gender and icecream flavours (diff not=0)
        
      chisq.test(ice.cream.survey)
              # Pearson's Chi-squared test
              # 
              # data:  ice.cream.survey
              # X-squared = 28.362, df = 2, p-value = 6.938e-07

    ##Conclusion:
    ##  . since p-value small (less than 0.05) => reject H0 => 
    ##      sign. diff between gender and icecream flavours (i.e. association / dependence).
          
 
          
##  ===============================================
##  (B) Goodness-of-fit Test
##  ===============================================
    # H0: the distribution is as claimed by M&M (Difference in distribution = 0)
    # H1: the distribution is not the same as M&M (Difference in distribution not = 0)
          
          chisq.test(x, p=m)  
              # Chi-squared test for given probabilities
              # 
              # data:  x
              # X-squared = 9.6838, df = 5, p-value = 0.08471
          
    # Conclusion:
    #   . As p-value is large (greater than 0.05) => fail to reject H0 
    #     => good fit with distribution claimed by M&M