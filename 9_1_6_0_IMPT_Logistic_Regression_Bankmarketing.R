##  ===================================================
##  Non-Linear Regression - Logistic Regression
##    - using Bank Marketing Dataset
##  ===================================================

    ##  Get bankmarketing Dataset
      # setwd("C:\\Users\\Andy\\Documents\\D_Drive\\R_Projects\\1_Key_R_Codes\\data")
      bank <- read.csv("../../Courses/Gen Infiniti Academy Pte Ltd/S4/Andy/bankmarketing.csv", 
                       header=T, sep=",", 
                       na.strings=c('', '.', 'NA'),
                       stringsAsFactors=T)
      
      View(bank)
      set.seed(1234)
          # str(bank)
          # bank$deposit <- as.factor(bank$deposit)
      ##  Objective:
      ##  ----------
          ### we will predict the chance that a subject creates a deposit
          ### based on the following variables:
          ### age, marital, default, education, balance, housing, loan and duration
      

      ### (1) create the training and the test sets
      ##  ------------------------------------------------
      ### we extract at random about half of the cases in the bank data frame
      ### these will be the indices of the training set
          #nrow(bank) #[1] 45211     
     
          n <- sample(45211, 22610) #take randomised samples (do it 22610 times) within boundary of 45211
          
          bank_train <- bank[n,]    #randomised "selected" n samples -- as training data
          
          bank_test <- bank[-n,]    #randomised "remainder" samples -- as testing data
          View(bank_train)
          View(bank_test)
         
      
      ##  (2) fit the model on the training set
      ##  -----------------------------------------------
          # ?glm
          fit_train <- glm(deposit~age+marital+default+balance+housing+loan+duration, 
                           data=bank_train, 
                           family=binomial())
      colnames(bank_train)
      
      ##  (3) compute the prediction accuracy on the TEST set
      ##  ----------------------------------------------------
      ### estimate the probabilities of creating a deposit
      
          pred.probs <- predict.glm(fit_train,           # trained model
                                    newdata = bank_test[,-17], # using testing data set; dropping last col
                                    type = "response")
          # ?predict.glm()
          head(pred.probs)

      
      ##  (4) predict the customer behavior (in the TEST set)
      ##  ------------------------------------------------------
      ### "no" (will not create a deposit) if the probability is lower than 0.50
      ### "yes" (will create a deposit) otherwise
      
          pred <- ifelse(pred.probs<0.5,"no","yes")
          
          head(pred)


          
          
      ##  (5) build the classification table (aka confusion matrix)
      ##  ----------------------------------------------------------
          table(bank_test$deposit, pred)

          
          # table(actual = bank_test$deposit, predicted = pred)
      
      ##  (6) compute the prediction accuracy
      ##  ---------------------------------------------------
          accuracy <- mean(pred == bank_test$deposit)
          
          accuracy 
  
          
          
          (misclassification <- 1 - accuracy) 
          
          
      ##  (7) build the ROC curve for the TEST set
      ##  -------------------------------------------------
          # install.packages("ROCR")
          require(ROCR)  # if problem, use R studio Cloud
          ?prediction
          pr <- prediction(pred.probs, bank_test$deposit)

          perf <- performance(pr, measure = "tpr", 
                              x.measure = "fpr")
            # . measure: Performance measure to use for the evaluation
            # . x.measure: A second performance measure. If different from the default, 
            #     a two-dimensional curve, with x.measure taken to be the unit in 
            #     direction of the x axis, and measure to be the unit in direction 
            #     of the y axis, is created. This curve is parameterized with the cutoff.
            # . tpr: True positive rate. P(Yhat = + | Y = +). Estimated as: TP/P.
            # . fpr: False positive rate. P(Yhat = + | Y = -). Estimated as: FP/N.
          
          ?performance()
          
          plot(perf)
      
      
      ##  (8) Calculate area under curve(auc)
      ##  ---------------------------------------------------
          auc <- performance(pr, measure = "auc")
          
          auc 
      
          
          
          
## SUPPLEMENTARY
##  --------------
          
          ##  Note the data are slots in an object from a formal class
          auc@x.name  #[1] "None"
          auc@y.name  #[1] "Area under the ROC curve"
          auc@x.values  #list()
          
          ## the accuracy are stored in y.values slots
          auc@y.values

          auc@y.values[[1]][1]  
          
          slot(auc, "y.values")[[1]][1]  
          