best <- function(state, outcome){
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
        
        min_row <- which(as.numeric(outcome2[,column]) == min(as.numeric(outcome2[,column]),na.rm = TRUE))
        hospitals <- outcome2[min_row,2]
        hospitals <- sort(hospitals)
        ##Return hospital name in that state with lowest 30-days death rate
        return(hospitals[1])
}