## The following 2 functions allow one to create a cache of the inverse of a matrix

## This first one "makeCacheMatrix" creates an object which will cache it's inverse

makeCacheMatrix <- function(x=matrix()) {
        inverse_matrix <- NULL
        set <- function(y) {
                x<<- y
                inverse_matrix <<- NULL
                
        }
        get <- function() x 
        setinverse_matrix <- function(finalMatrix) inverse_matrix <<- finalMatrix
        getinverse_matrix <- function() inverse_matrix
        list( set= set, get=get, 
              setinverse_matrix=setinverse_matrix, 
              getinverse_matrix=getinverse_matrix)
}

## This second one solves the inverse of the matrix object created above

cacheSolve <- function(x, ...) {
        inverse_matrix <- x$getinverse_matrix()
        if(!is.null(inverse_matrix)){
                message("getting cached data")
                return(inverse_matrix)
        }
        mdata <- x$get()
        inverse_matrix <- solve(mdata)
        x$setinverse_matrix(inverse_matrix)
        inverse_matrix
}
## This will return the inverse of the matrix