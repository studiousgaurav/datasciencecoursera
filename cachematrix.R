## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {      ## define the set function to assign new 
    x <<- y 
    inv <<- NULL         ## if there is a new matrix, reset inv to NULL
  }
  get <- function() x  
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv     
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)  ## you need this in order to refer
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  inv
}
