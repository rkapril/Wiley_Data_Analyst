##  ========================================================================
##  Multiple Linear Regression - Prediction and accuracy assessment
##  - using Marketing dataset
##  ===================================================================

##  1. Load library and data
##  -------------------------
      # setwd("C:\\Users\\Andy\\Documents\\D_Drive\\R_Projects\\1_Key_R_Codes\\data")

      marketing <- read.csv("../../Courses/Gen Infiniti Academy Pte Ltd/S3/marketing.csv", 
                            header = TRUE, na.strings=c('','.','NA'))
      View(marketing)
      
      

      
##  2. create training and testing set
##  -------------------------------------
      nrow(marketing) #200
      
      set.seed(1234)
      index <- sample(200, 180)
      
      train_marketing <- marketing[index,]
      test_marketing <- marketing[-index,]
      View(train_marketing)
      View(test_marketing)
      
      ## reseting row names (optional)
      rownames(train_marketing) <- NULL
      rownames(test_marketing) <- NULL
      

      
##  3.  train our model using training data
##  ---------------------------------------
      trained_model <- lm(sales ~ youtube + facebook, data = train_marketing)
      

    
##  4.  run the trained model on testing data
##  ------------------------------------------
      pred.test <- predict(trained_model, newdata = test_marketing[-4])
      
      length(pred.test)
      
      head(pred.test)
          # 1        2        3        4        5        6 
          # 24.65583 15.88810 15.10405 10.56544 21.74889 15.21593 
      

      
##  (5) display result in an additional column in a dataframe
##  ------------------------------------------------------
          result_test <- data.frame(
            actual_sales = test_marketing$sales,
            predicted_sales = pred.test
          )
      
          sqerror_function <- function (x) {
                mean((as.numeric(x[1]) - as.numeric(x[2]))^2)
            }
    

          result_test$sqerror_column <- apply(result_test[,c("actual_sales", 
                                                             "predicted_sales")], 
                                              1, sqerror_function)
          View(result_test)
          
          
          # mse <- mean(result_test$mse_column)
          # mse   
          
          
