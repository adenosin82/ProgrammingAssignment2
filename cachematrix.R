## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## returns an object wich contains methods as a list.
## these methods allow to set/get the object and one of its attributed (inverse matrix)

makeCacheMatrix <- function(x = matrix()) {
  
    i <- NULL
    set <- function(t1){
      x <<- t1
      i <<- NULL
    }
    get <- function() x
    setInverse <- function(mInv) i <<- mInv
    getInverse <- function() i
    list (set = set, get= get, setInverse = setInverse, getInverse = getInverse)
}


## takes a cacheMatrix and returns its inverse from the cache if available. Otherwise calculates it
## and stores it in the object cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is thcle inverse of 'x'
  mInv <- x$getInverse()
  if(!is.null(mInv)){
    message("getting cached data")
    return (mInv)
  }
  mInv <- solve(x$get())
  x$setInverse(mInv)
  mInv
}
