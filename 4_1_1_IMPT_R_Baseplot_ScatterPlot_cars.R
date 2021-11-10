##  ==============================================
##  Graphical Plots - R Base plot -- Scatter Plot
##  -- scatter plot with no segmentation/subset
##  -- using cars dataset
##  ==============================================
    ## Scatter plot -- need x, y values (continuous)

##  Exploring dataset
##  -----------------
      data()
      data(cars)
      cars
      cars$speed
      cars$dist
      ?cars
      View(cars)

      
##  1. Scatter plot 
##  -----------------
    ##  (a) Basic scatter plot
    ##  -----------------------
        plot(x=cars$speed, y=cars$dist)
      
      
    ##  (b) Scatter plot with customisation
    ##  ------------------------------------
      # par(bg = 'blue')
        plot(x=cars$speed, 
             y=cars$dist,
             xlab = "Speed (mph)",
             ylab = "Distance (ft)",
             main = "Car Speed and Stopping Distance",
             sub = "data recorded in 1920s",
             col = "#D4431C", 
             pch=15,      #  0/15 (square); 1/16 (circle); 5/18 (diamond)
             las = 3    # orientation of axis scale -- 0 (default), 1(x-horizontal); 2 (y-rotateLeft), 3(x,y-rotate) 
             )
      
      
      ##  resources for color specifications
      ##  ----------------------------------------
          # col="firebrick4" # 
                              # http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf
          # col=rgb(0.255,0.8,0.8)
          # col="#5EF072" # https://htmlcolorcodes.com/
      
