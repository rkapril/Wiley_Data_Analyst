##  ================================================
##  Revision on Dataframe Subsetting - Exercise 1a
##  ================================================

    ##  Create dataframe
    ##  ----------------
        hero <- data.frame(
          characters = c("Superman", "Batman", "Wonder Woman", "Flash", "Aquaman", "Cyborg"),
          price = c(50, 45, 40, 43, 30, 25),
          rating = c(4, 6, 3, 2, 1, 5)
        )
        hero
        
        
            #     characters price rating
            # 1     Superman    50      4
            # 2       Batman    45      6
            # 3 Wonder Woman    40      3
            # 4        Flash    43      2
            # 5     Aquaman    30       1
            # 6       Cyborg    25      5
        
        str(hero)
             #  data.frame':	6 obs. of  3 variables:
             #  $ characters: Factor w/ 6 levels "Aquaman","Batman",..: 5 2 6 4 1 3
             #  $ price     : num  50 45 40 43 30 25
             #  $ rating    : num  4 6 3 2 1 5
        
        hero$characters
     
        as.character(hero$characters)
        hero$characters <-   as.character(hero$characters)
        
##  =========================        
##  (A) Column Subsetting
##  =========================        
        
##  (1) Subsetting -- using $
##  ------------------------
        hero$characters
            # [1] "Superman"     "Batman"       "Wonder Woman" "Flash"        "Aquaman"     "Cyborg" 
        
        hero$rating
            # [1] 4 6 3 2 1 5
        
        
##  (2) Subsetting [[]] 
##  -------------------------------------------------
    ## (a) using [["column name"]]
    ##  --------------------------
        hero[["characters"]]
            # [1] "Superman"     "Batman"       "Wonder Woman" "Flash"        "Aquaman"     "Cyborg"   
        
        hero["characters"]
              # characters
              # 1     Superman
              # 2       Batman
              # 3 Wonder Woman
              # 4        Flash
              # 5     Acquaman
              # 6       Cyborg
  
        

    ##  (b) using [[numeric column Index]]
    ##  --------------------------------------
        hero[[1]]
            # [1] "Superman"     "Batman"       "Wonder Woman" "Flash"        "Aquaman"     "Cyborg" 
        

    

## (3) using [,<col>] specify which column to print out
##  -----------------------------------------------------
        hero[,1]            #[1] "Superman"     "Batman"       "Wonder Woman" "Flash"        "Aquaman"      "Cyborg" 
        hero[,"characters"] #[1] "Superman"     "Batman"       "Wonder Woman" "Flash"        "Aquaman"      "Cyborg" 
        
        
        
      ## Recap on various methods on calling out columns
      ##  --------------------------------------------  
        hero
        hero[,1]
        hero[,"characters"]
        hero[[1]]
        hero[["characters"]]
        hero$characters
        hero$c


##  ==========================        
##  (B) Row Subsetting
##  ==========================
        ## call out the rows  
    hero[1,] # dataframe[<row>, <col>]
        #   characters price rating
        # 1   Superman    50      4
    hero[2,]
        # characters price rating
        # 2     Batman    45      6
    
    # print multiple rows
    hero[c(1,3),] 
    hero[1:3,]
    
##  ============================        
## (C) Conditional Subsetting
##  ============================    
    ##  accessing values by specifying rows and cols; AND OR conditions
    ##  dataframe[<specify FILTER on row>, <SELECT on col>]
    
    ##  (1) Inserting filter condition
    ##  ------------------------------
        hero[hero$price>40,]
              #   characters price rating
              # 1   Superman    50      4
              # 2     Batman    45      6
              # 4      Flash    43      2
        
        hero[hero$price>40, "characters"] #[1] "Superman" "Batman"   "Flash" 
        length(hero[hero$price>40, "characters"]) # 3
        
        hero[hero$price == 40, "characters"] #[1] "Wonder Woman"
        
        hero[hero$price < 40, "characters"] #[1] "Aquaman" "Cyborg"
        hero[hero$price < 40, 1] ##[1] "Aquaman" "Cyborg"
        
        hero[hero$price >= 40, "characters"] #[1] "Superman"     "Batman"       "Wonder Woman" "Flash" 
        
        hero[hero$price <= 40, "characters"] #[1] "Wonder Woman" "Aquaman"     "Cyborg"
        
        hero[hero$price != 40, "characters"] #[1] "Superman" "Batman"   "Flash"    "Acquaman" "Cyborg" 
 
      

        
    ## (2) AND Condition
    ##  ----------------
        hero[hero$price>=40 & hero$price<50, "characters"]  #[1] "Batman"       "Wonder Woman" "Flash" 
        hero[hero$price>40 & hero$rating>4, "characters"] #[1] "Batman"
        
        
    ##  (3) OR Condition
    ##  -----------------
        hero[hero$price>40 | hero$rating>4, "characters"] #[1] "Superman" "Batman"   "Flash"    "Cyborg"
        
        
    ##  (4) Mix and Match
    ##  ------------------
        hero[hero$price > 40 & (hero$price > 50 | hero$rating>4), "characters"] #[1] "Batman"
        
        
    ##  (5) Match by text
    ##  -----------------
        hero[hero$characters=="Batman", "rating"]
            #[1] 6
        
        hero[hero$characters %in% c("Batman", "Superman"), "rating"] # %in% is the "value matching operator"
        hero[hero$characters=="Batman" | hero$characters=="Superman", "rating"]
        
        
    ##  (6) Getting multiple columns
    ##  ----------------------------------
      ##  print 2 columns that fulfill condition
      ##  ----------------------------------------------
        hero[hero$price>40, c("characters", "rating")]
                    #   characters rating
                    # 1   Superman      4
                    # 2     Batman      6
                    # 4      Flash      2
        
        hero[hero$price>40, c(1,3)]
                    #   characters rating
                    # 1   Superman      4
                    # 2     Batman      6
                    # 4      Flash      2
        
        hero[hero$price>40, c(1,3,2)]
                #   characters rating price
                # 1   Superman      4    50
                # 2     Batman      6    45
                # 4      Flash      2    43
        
        hero2 <- hero[hero$price>40, c(1,3,2)]
        hero2 
        colnames(hero2)  #"characters" "rating"     "price" 
        names(hero2)     #"characters" "rating"     "price"  
        names(hero2) <- c("personalities", "score", "value")
        hero2  
              #   personalities score value
              # 1      Superman     4    50
              # 2        Batman     6    45
              # 4         Flash     2    43
        
        hero2[,c(1,3,2)]
                #   personalities value score
                # 1      Superman    50     4
                # 2        Batman    45     6
                # 4         Flash    43     2
        
        hero2[,c(1,3)]
                #   personalities value
                # 1      Superman    50
                # 2        Batman    45
                # 4         Flash    43
        
        hero2[,-2]
        
        hero2[,-c(2,3)] # hero2[,c(-2,-3)] 
        # hero2[,-c(hero2$score)]


 
        View(hero2)
        
        
        
##  ============================        
## (D) Bonus Section: Sorting
##  ============================  

  ##  (1) Sorting price in ascending order and get the top 3 prices, based on conditions
  ##  ---------------------------------------------------------------------------------- 
      ##(i) attach and detach
      ##  -------------------
      hero
      price  # hero$price
      attach(hero)
      price
      detach(hero)
      price
        
      ##  (ii) order() command
      ##  ----------------------
      attach(hero)  
      sorted1 <- hero[order(price),]  # this will give us ascending order by default
      sorted1
            #     characters price rating
            # 6       Cyborg    25      5
            # 5      Aquaman    30      1
            # 3 Wonder Woman    40      3
            # 4        Flash    43      2
            # 2       Batman    45      6
            # 1     Superman    50      4
      
      head(sorted1,3) # prints first 3 records
      tail(sorted1,3) # prints bottom 3 records

      
      
    ##  (2) Sorting prices in descending order, and get top 3 prices based on conditions
    ##  --------------------------------------------------------------------------------
      sorted2 <- hero[order(-price),]  # we can get descending order by putting in minus sign
      sorted2
            #     characters price rating
            # 1     Superman    50      4
            # 2       Batman    45      6
            # 4        Flash    43      2
            # 3 Wonder Woman    40      3
            # 5      Aquaman    30      1
            # 6       Cyborg    25      5
      
      head(sorted2,3) # top 3 results
     
      detach(hero)
      
      
      
    ##  (3) sorted by alphabetical order
    ##  -----------------------------------------  
      hero
      attach(hero) 
      sorted3 <- hero[order(characters),] # ascending order
      sorted3
      
      sorted4 <- hero[order(characters, decreasing =T),] #descending order
      sorted4
      
      detach(hero)
  
      
      ?order          
      