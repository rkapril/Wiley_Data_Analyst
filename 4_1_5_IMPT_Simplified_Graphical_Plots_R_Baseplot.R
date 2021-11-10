## =======================================================
## GRAPHICAL PLOTS - USING R BASE PLOT
## =======================================================

##  Example - height vs weight
##  --------------------------
    height <- c(120, 120, 120, 130, 130, 135, 135, 
                145, 155, 155, 162, 170)
    weight <- c(40, 41, 45, 50, 55, 55, 57, 57, 61, 
                61, 62, 63)
    

## =====================================  
##  Simple plots
## =====================================
      
  ##  Scatter Plot
  ##  -------------------
        plot(height,weight)

  
  ##  Histogram
  ## -------------------
        hist(height)

        
  ##  Line Plot
  ## -------------------
      ## plot(vector, type, col, xlab, ylab)
      ## where: type -- "p" (draw only points); 
      ##                "l" draw only lines; 
      ##                "o" draw  both lines and points
      ##        col --  colors to both points and lines
    
        plot(x=weight, y=height, type="l")    

    
  ##  Bar Plot
  ##  ------------------
        barplot(height)
  
      ##reshape the data using the table function and then apply barplot
        table(height)
            # height
            # 120 130 135 145 155 162 170 
            # 3   2   2   1   2   1   1 
        
        barplot(table(height))

    
  ##  Boxplot
  ##  ------------------
        boxplot(height ~ weight)

    
      
