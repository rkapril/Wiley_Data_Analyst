##  =================================================================================
##  Basic Stats for Time Series
##  - autocorrelation function (acf()) for stationary and non-stationary series
##  
##  =================================================================================

  ##  1.Stationary Series (generated using random data)
##  --------------------------------------------------
    set.seed(1)
    x <- rnorm(1000)
    plot(x, type="l")  
    acf(x)             
    
    ## Note: 
    ##  . The first value, acf(0) = 1, as the series correlates with itself perfectly!
    ##  . the autocorrelation is approximately 0: these values are independent from each other  
    ##  . there are some occasional peaks, but these are due to randomness of data. normal fo 1-2 peaks in 95% CI
    ##  . acf() series drops quickly for stationary series
    
    
##  2.  Non-stationary Series (generated using linear sequence)
##  --------------------------------------------------------
    y <- seq(1,1000)
    plot(y, type="l")    ## *There is a trend: the acf() is approximately linear
    acf(y)    
    
    ##  Note:
    ##  . acf() drops slowly for non-stationary series.
    