## Put comments here that give an overall description of what your
## functions do

## instanciate an object to perform the solve function to invert a matrix

makeCacheMatrix <- function(x = matrix()) {
    m  <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    
    get <- function() x
    setinverse <- function(solve) m <<- solve
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## get the inverse of a matrix using cache if available

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    ## from cache if it exists and is the same as the cached object
    ## otherwise, calculate inverse
    m <- x$getinverse()
    if(!is.null(m) && (m == x$getinverse())){
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
}
