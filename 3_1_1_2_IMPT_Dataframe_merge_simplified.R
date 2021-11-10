##  ======================================================================
##  Matching and Replacing specific  values in dataframe with other values
##  - using merge()
##  ======================================================================

##  1. Create dataframes
##  ----------------------
    staff_data <- data.frame(
      name = c("Adam", "Bruce", "Carol", "David"),
      role = c("director", "engineer", "finance support", "marketing")
    , stringsAsFactors = F
    )

    new_role <- data.frame(
      old_title = c("engineer", "finance support", "marketing", "mentor", "manager"),
      new_title = c("data scientist", "finance analyst", "marketing specialist", "guru", "management specialist")
    , stringsAsFactors = F
    )

    str(staff_data)
    str(new_role)

   
    ##  objective: we want to change the roles in "staff_data" from current titles to 
    ##  new ones, as stated in "new_role".
    
  ?merge
##  2. Merge data
##  -----------------------
  ##  (a) Outer Join (Full Outer Join)
  ##  ---------------------------------
    merge(x = staff_data,
          y = new_role,
          by.x = "role",
          by.y = "old_title",
          all = "TRUE")
            #             role  name             new_title
            # 1        director  Adam                  <NA>
            # 2        engineer Bruce        data scientist
            # 3 finance support Carol       finance analyst
            # 4         manager  <NA> management specialist
            # 5       marketing David  marketing specialist
            # 6          mentor  <NA>                  guru
    
    
    ##  (b) Left outer
    ##  ------------------
   merge(x = staff_data,
         y = new_role,
         by.x = "role",
         by.y = "old_title",
         all.x = "TRUE")
          #             role  name            new_title
          # 1        director  Adam                 <NA>
          # 2        engineer Bruce       data scientist
          # 3 finance support Carol      finance analyst
          # 4       marketing David marketing specialist
    
    ##  (c) Right Outer
    ##  ---------------
    merge(x = staff_data,
          y = new_role,
          by.x = "role",
          by.y = "old_title",
          all.y = "TRUE")
                #             role  name             new_title
                # 1        engineer Bruce        data scientist
                # 2 finance support Carol       finance analyst
                # 3         manager  <NA> management specialist
                # 4       marketing David  marketing specialist
                # 5          mentor  <NA>                  guru
    
    
    
    ##  (d) Inner Join
    ##  -------------------
    merge(x = staff_data,
          y = new_role,
          by.x = "role",
          by.y = "old_title"
        ) # all = FALSE
    
          #             role  name            new_title
          # 1        engineer Bruce       data scientist
          # 2 finance support Carol      finance analyst
          # 3       marketing David marketing specialist
    
 