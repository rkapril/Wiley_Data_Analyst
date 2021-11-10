##  =========================================================================
##  ggplot2 - Simplified -- Adding colour, symbol type, size and shape as layers
##  - source: selected codes modified from PACKT ("R Graph Essentials")
##  =========================================================================

##  1. Load library, select working directory and load data
##  -------------------------------------------------------
    # install.packages("ggplot2")
    library(ggplot2)
    
    # setwd("C:\\Users\\Andy\\Documents\\D_Drive\\R_Projects\\1_Key_R_Codes\\data")
    
    patient <- read.csv("../../Courses/Gen Infiniti Academy Pte Ltd/S6/Andy/P2/patients_data1.csv", header = TRUE, na.strings=c('','.','NA'))
    
    head(patient,2)
    #   X PATIENT GENDER ETH TREATMENT AGE WEIGHT_1 WEIGHT_2 HEIGHT SMOKE EXERCISE RECOVER
    # 1 1    Mary      F   1         A   Y     79.2     76.6    169     Y     TRUE       1
    # 2 2     Jim      M   2         B   Y     87.5     84.8    178     Y     TRUE       0
    View(patient)


##  2. Basic scatter plot
##  ----------------------
    P <- ggplot(data = patient, 
                aes(x = HEIGHT, 
                    y = WEIGHT_1)) + geom_point()
    P

##  ========================================
##  (A) Modify plot titles and x,y-labels
##  ========================================

##  1. Customisation 1 -- Add x and y labels, as well as a title
##  -------------------------------------------------------------
    Q <- P + labs(x = "HEIGHT (cm)",
                  y = "WEIGHT_1 (kg)") + 
      labs(title = "WEIGHT_1 vs HEIGHT")
    Q


##  2. Customisation 2 -- modify title (font size, colour)
##  -------------------------------------------------------------
    Q +theme(plot.title = element_text(size = rel(2), 
                                       color = "steelblue")) #modify title


##  ==========================================
##  (B) Modifying dot colour, shape, and size
##  ==========================================

##  1.  Customisation 3 -- modify dot colour and size at geom layer
##  ----------------------------------------------------------------
    Q + geom_point(color = "darkgreen", size = 4) # modify dot colour and size


##  2.  Customisation 4 -- mapping colour to a variable at aes() of geom layer
##  -------------------------------------------------------------------------
    ##  . we can map colour, shape, size within aes(); note variable must be factor
    ##  . we can select colour using scale_color_manual()
    
    Q +
      geom_point(aes(color = factor(ETH)), 
                 size = 5) + # link dot colour to factor
      scale_color_manual(values = c("red", 
                                    "yellow", 
                                    "blue")) # control dot colour
    
    
##  =============================================
##  (C) Modify plotting background
##  =============================================
    
##  1.  Change plotting background from default ("theme_gray()") to "theme_bw()"
##  -----------------------------------------------------------------------------
    P + theme_bw()
    
    
##  2.  Change colour of plotting background with filled colour
##  -------------------------------------------------------------
    P + theme(panel.background = element_rect(fill = "ivory"))
    
    
##  =============================================
##  (D) Modify legend name and labels
##  =============================================
    
##  1.  Using scale_color_brewer() to select color palettes (default is blue hues)
##  ------------------------------------------------------------------------------
    ## we use scale_color_brewer() only after mapping color to ETH within aes()
    
    P + geom_point(aes(color = factor(ETH)), 
                   size = I(4)) +
      scale_color_brewer(name = "Ethnicity",
                         labels = c("European", 
                                    "Asian", 
                                    "Other"))
    
    ##  arguments for scale_color_brewer:
    # . Diverging
    #     . BrBG, PiYG, PRGn, PuOr, RdBu, RdGy, RdYlBu, RdYlGn, Spectral
    # 
    # . Qualitative
    #     . Accent, Dark2, Paired, Pastel1, Pastel2, Set1, Set2, Set3
    # 
    # . Sequential
    #     . Blues, BuGn, BuPu, GnBu, Greens, Greys, Oranges, OrRd, PuBu, 
    #     . PuBuGn, PuRd, Purples, RdPu, Reds, YlGn, YlGnBu, YlOrBr, YlOrRd
    # 
    
    
    P + geom_point(aes(color = factor(ETH)), 
                   size = I(4)) +
      scale_color_brewer(name = "Ethnicity",
                         labels = c("European", 
                                    "Asian", 
                                    "Other"),
                         palette = "Pastel2") + # changing from default to "Greens"
                          theme_classic()
