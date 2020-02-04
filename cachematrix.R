## Put comments here that give an overall description of what your
## functions do

## This function takes a matrix and stores it and it's inverse in the global environment using a list 
## structure with four functions

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function(y) {
            x <<- y
            i <<- NULL
        }
        get <- function() x
        setinverse <- function(verse) i <<- verse
        getinverse <- function() i
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## This function takes the elements of makeCacheMatrix and calculates the inverse if it is not already
## stored in the i variable. It returns the inverse.

cacheSolve <- function(x, ...) {
    i <- x$getinverse()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setinverse(i)
    
    i ## Return a matrix that is the inverse of 'x'
    
}

