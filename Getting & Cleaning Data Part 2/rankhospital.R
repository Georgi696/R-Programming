rankhospital <- function(state, outcome, num = "best"){
        
        ##Read the outcome data
        outcome1 <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
        
        ##check the state and outcome are valid
        if(!any(state == outcome1$State)){
                stop("invalid state")
                
        }else if(outcome %in% c("heart attack","heart failure","pneumonia") == FALSE){
                stop("invalid outcome")
        }
        
        outcome2 <- subset(outcome1, State == state)
        
        if(outcome == "heart attack"){
                column <- 11
                
        }else if(outcome == "heart failure"){
                column <- 17
        }
        
        else{
                column <- 23
        }
        
        outcome2[, column] <- as.numeric(outcome2[, column])
        outcome3 <- outcome2[order(outcome2[,column], outcome2[,2]),]
        outcome3 <- outcome3[(!is.na(outcome3[ , column])),]
        
        if(num == "best"){
                num <- 1
        }
        else if(num == "worst"){
                num = nrow(outcome3)
        }
        
        return(outcome3[num,2])
}