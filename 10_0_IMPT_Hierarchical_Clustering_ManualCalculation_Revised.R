##  =========================================================
##  Hierarchical Clustering - Manual Calculation Comparison
##  =========================================================


hdata1 <- data.frame(vector=c("A", "B", "C", "D"),
                     x = c(1,2,4.5,5),
                     y = c(5,4,8,5))

row.names(hdata1) <- hdata1$vector
hdata1$vector <- NULL
hdata1

##  2. Create hierarchical clustering
##  -------------------------------------- 
# install.packages("cluster")
library(cluster)
hc1 <- agnes(hdata1, method = "complete")
pltree(hc1, cex = 0.6, hang = -0.2, 
       main="Dendrogram of agnes")

# cex - label font size
# hang - label away from the branch