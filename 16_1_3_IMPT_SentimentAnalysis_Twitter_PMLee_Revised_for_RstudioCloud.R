##  ===============================================================================================
##  Social Media Analytics and Opinion Mining (Improved version using cleantext and gdapRegex packages)
##  - processing and analysing data (using Syuzhet Package) on PM Lee's tweets
##  - Pie Charts
##  ===============================================================================================

##  ===================================================
## (1) Extract data
##  ===================================================

input_tweets <- userTimeline("@leehsienloong", 
                             n=300)
# input_tweets <- userTimeline("@sporeMOH", n=300)

input_tweets[1:3] # extract first 3 rows of tweets

class(input_tweets) #[1] "list"

##  (a) Option 1: change from list to character
##  ------------------------------------------
tweet <- sapply(input_tweets, 
                function(x) x$getText())
## getText() is used to extract the text content of tweets


class(tweet) #[1] "character" 

tweet[1:3] # prints first 3 rows of tweet


##  (b) Option 2: change list to Dataframe 
##  ---------------------------------------------
tweet_df <- twListToDF(input_tweets) # convert to dataframe

class(tweet_df) #[1] "data.frame"

View(tweet_df)

#tweet_df$text[1:3]  # prints the first 3 rows


##  =================================================
##  (2) Data pre-processing
##  =================================================
##  Load libraries
##  ---------------
# install.packages("textclean")
library(textclean)
# install.packages('qdapRegex')
library(qdapRegex)


##  Cleaning up words and numbers in the text ########        

##  (a) remove non-ASCII characters (e.g. foreign language) #from qdapRegex
##  -------------------------------------------------------------------------
tweet <- as.data.frame(tweet_df$text)
View(tweet)
names(tweet) <- "text"

tweet$text <- rm_non_ascii(tweet$text)




##  (b) remove urls using qdapRegex package
##  ----------------------------------------
tweet$text <- rm_twitter_url(tweet$text)    #  remove only twitter-type url (e.g. "t.co/N1kq0F26tG")
tweet$text <- rm_url(tweet$text)            #  remove all other urls (non-twitter urls)



##  (c) remove email (from qdapRegex library)
##  ----------------------------------------------------------
tweet$text <- rm_email(tweet$text)



##  (d) remove hash tag (e.g. #WRETE, #sazdd) (from qdapRegex library)
##  ------------------------------------------------------------------
tweet$text <- rm_hash(tweet$text)



##  (e) remove @ tag (e.g. @hadley) (from qdapRegex library)
##  ------------------------------------------------------------------------------
##  (i) we need to convert all caps to lower first (else some @ tags won't be removed)
##  ----------------------------------------------------------------------------------
tweet$text <- tolower(tweet$text)


##  (ii)  run the command to remove tag
##  ---------------------------------------------------------------------------------
tweet$text <- rm_tag(tweet$text)



##  (f) replace money to words equivalent  (textclean package)
##  -----------------------------------------------------------
tweet$text <- replace_money(tweet$text)



##  (g) replace numbers to words equivalent (textclean package)
##  ------------------------------------------------------------
tweet$text <- replace_number(tweet$text) # note even year (e.g. 2019) will also be convereted to words




##  (h) remove time (e.g. 12:45:20) (qdapRegex package)
##  ------------------------------------------------------------
tweet$text <- rm_time(tweet$text)


##  (i) replace word elongation (e.g. 'real coooool!) (textclean package)
##  ---------------------------------------------------------------------
tweet$text <- replace_word_elongation(tweet$text)



##  Cleaning up symbols, punctuations, special characters in the text ########        

##  (j) replace emoticons with word equivalent (from cleantext library)
##  -------------------------------------------------------------------
tweet$text <- replace_emoticon(tweet$text)



##  (k) remove non-words (e.g. symbols, punctuations, numbers)
##  ----------------------------------------------------------
tweet$text <- rm_non_words(tweet$text) #note: aprostrophe still remains



##  (l) removes all symbols and punctuations
##  -----------------------------------------------------------------------------------
tweet$text <- strip(tweet$text, 
                    char.keep = "~~", 
                    digit.remove = TRUE,
                    apostrophe.remove = TRUE, 
                    lower.case = TRUE)



##  further cleaning up to remove specific characteristics of content (e.g. rt)

##  (m) removes "rt" from content
##  ----------------------------------------------------------------------------------
## note: need to ensure no caps (i.e. ran tolower command first before using removewords)
tweet$text <- removeWords(tweet$text, "rt")



##  (n)  remove stopwords
##  ---------------------------------------------------------
## note: need to ensure no caps (i.e. ran tolower command first before using removewords)

tweet$text <- removeWords(c(tweet$text), 
                          stopwords("english"))


##  (o)  remove white space in beginning and end of each sentence (qdapRegex package)
##  -----------------------------------------------------------------------------------
tweet$text <- rm_white_lead_trail(tweet$text)



##  ========================================================================================
##  (3) get sentiment score for each tweet (shows different emotions present in each tweets)
##  ========================================================================================
# install.packages("syuzhet") #need this for sentiment analysis
# install.packages("bindr") #syuzhet library need this dependency
library(bindr)
library(syuzhet)


tweet_text <- as.vector(tweet$text)
emotion_text <- get_nrc_sentiment(tweet_text) #from syuzhet package
emotion_2 <- cbind(tweet_text, emotion_text)
View(emotion_2)


## you can access the scores and create your sentiment index: 
nrow(emotion_2) # nrow(emotion_2)
sum(emotion_2$anger)
sum(emotion_2$anger)/nrow(emotion_2)



##  ==========================================================================
##  (4) use get_sentiment function to extract sentiment score for each tweets
##  ==========================================================================

sent.value <- get_sentiment(tweet_text)
sent.value        
?get_sentiment


## (a) find most positive tweet
##  -----------------------------------
most.positive <- tweet_text[sent.value == max(sent.value)]
most.positive


which(sent.value == max(sent.value)) # to get row numbers that have most positive tweets


##  (b) find most negative tweet
##  -----------------------------------
most.negative <-tweet_text[sent.value == min(sent.value)]
most.negative    

which(sent.value == min(sent.value)) # to get row numbers that have most negative tweets


##  ===========================================================================   
##  (5) Segregating positive, negative tweets and neutral tweets
##  ===========================================================================
positive.tweets <- tweet_text[sent.value > 0]
head(positive.tweets, 2)



negative.tweets <- tweet_text[sent.value < 0]
head(negative.tweets,2)



neutral.tweets <- tweet_text[sent.value == 0]
head(neutral.tweets, 2)



##  Alternative method to classify tweets into positive, negative, and neutral
##  --------------------------------------------------------------------------
category_senti <- ifelse(sent.value < 0, 
                         "Negative", 
                         ifelse(sent.value > 0, 
                                "Positive", 
                                "Neutral"))
head(category_senti)  #[1] "Neutral"  "Neutral"  "Positive" "Neutral"  "Positive" "Neutral"    

category_senti2 <- cbind(tweet_text, 
                         category_senti, 
                         sent.value)
head(category_senti2,2)
View(category_senti2)

##  ===========================================================
##  (6) Pie chart - to analyse tweet sentiments
##  ===========================================================
##  (a) Place in table for easier analysis
##  ----------------------------------------
table(category_senti)


##  (b) Simple Pie Chart
##  ----------------------------------------
negative_count <- length(category_senti[category_senti=="Negative"])
neutral_count <- length(category_senti[category_senti=="Neutral"])
positive_count <- length(category_senti[category_senti=="Positive"])

# simple pie chart
slices <- c(negative_count, neutral_count, positive_count)
label_names <- c("Negative", "Neutral", 
                 "Positive")
pie(slices, labels=label_names, 
    main="Pie Chart of Tweet Sentiments")


##  (c) complex pie chart (with percentages)
##  ------------------------------------------
slices <- c(negative_count, neutral_count, positive_count)
label_names <- c("Negative", "Neutral", 
                 "Positive")
pct <- round(slices/sum(slices)*100)
label_names <- paste(label_names, pct) # add percents to labels
label_names <- paste(label_names, "%", sep="") # add % to labels
pie(slices, 
    labels=label_names, 
    # col= rainbow(length(label_names)),
    col=heat.colors(length(label_names)),
    # col=terrain.colors(length(label_names)),
    # col=c("green", "lightblue", "gold"),
    main="Pie Chart of Tweet Sentiments")


## Others:
## saving data
#       
#       setwd("C:/Users/Andy/Documents/D_Drive/R_Projects/1_Key_R_Codes/data")
#       setwd("C:\\Users\\Andy\\Documents\\D_Drive\\R_Projects\\1_Key_R_Codes\\data")
# 
#       save(input_tweets, file="input_tweet_1.RData")
# #       
# # ##get back the saved data
#       x <- get(load("input_tweet_1.RData"))
#       x
