##  ===================================================================
##  Social Media Analytics and Opinion Mining
##  - Making Connection to Twitter using API
##  ===================================================================

##  =============================================================
##  (A) Connecting to Twitter using "Direct Connection" Method
##  =============================================================

##  (1) Install packages & Load Libraries
##  -------------------------------------
    # install.packages("twitteR")
    # install.packages("bitops")
    # install.packages("digest")
    # install.packages("RCurl")
    # install.packages("ROAuth")
    # install.packages("tm")
    # install.packages("stringr")
    # install.packages("plyr")

    library(plyr)
    library(twitteR)
    library(ROAuth)
    library(RCurl)
    library(stringr)
    library(tm)


##  (2) set up your twitter authentication (Direction Connection)
##  ---------------------------------------------------------------        
    ## (a) set up SSL
    ##  --------------
    options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))        


    ## (b) set up twitter authentication
    ##  --------------------------------
    api_key <- "lSgSFaOJxZFIlA43KUVT4UbJ6"
    
    api_secret <- "l8mMEoM3wKu79hhQthCDvO3cGoIPPG2qGc0Vk6PKHaodqNAk74"
    
    access_token <- "958984909837680640-piv8s9PlvCKaOtUEJz2lFQJNLEQTkTp"
    
    access_token_secret <- "3xFeNWVGkkd04uMsBu6deBnScSO4L2sgBl0qG4K5sHLcz"
    
    setup_twitter_oauth(api_key, api_secret, access_token, access_token_secret)

