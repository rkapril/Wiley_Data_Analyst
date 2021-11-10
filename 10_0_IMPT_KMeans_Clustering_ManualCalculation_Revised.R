##  =========================================================
##  k-means Clustering - Manual Calculation Comparison
##  =========================================================


hdata1 <- data.frame(vector=c("A", "B", "C", "D"),
                     x = c(1,2,4.5,5),
                     y = c(5,4,8,5))

row.names(hdata1) <- hdata1$vector
hdata1$vector <- NULL
hdata1


##  2. Load libraries   
##  ----------------------------    
library(tidyverse)  # data manipulation
library(cluster)    # clustering algorithms
library(factoextra) # clustering algorithms & visualization

##  3. Create Clusters
##  -----------------------------    
set.seed(101)

k2 <- kmeans(hdata1, centers=2, nstart = 20) 
## *we pass the first 4 columns; 3 species;  nstart is the number of random start (here = 20)
k2


##  Visualise clusters
fviz_cluster(k2, data = hdata1)
