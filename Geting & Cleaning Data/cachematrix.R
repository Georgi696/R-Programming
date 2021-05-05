## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

 makeCacheMatrix <- function(x = matrix()) {
        inverse.x <<- NULL
        
        set <- function(y){
                x <<- y
                inverse.x <<- NULL
        }
        get <- function() x
        setInverse <- function(inv){
                inverse.x <<- inv
        }
        getInverse <- function() inverse.x
        list(set = set,get = get, setInverse = setInverse, getInverse = getInverse)
        
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        inverse.x <- x$getInverse()
        if(!is.null(inverse.x)){
            message("geting cached data")
                return(inverse.x)
        }
        data <- x$get()
        inverse.x <- solve(data, ...)
        x$setInverse(inverse.x)
        inverse.x
}
