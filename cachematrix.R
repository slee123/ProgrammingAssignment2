## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

#This function returns a list of functions which defines and access the Cached Matrix;

makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set <- function(y) {
		x <<- y
		m <<- NULL
	}
	get <- function() x
	setinverse <- function(inversem) m <<- inversem
	getinverse <- function() m
	list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## Write a short comment describing this function

# This function returns the inverse matrix if it is already Cached. If not, it will calculate inverse matrix and store in cache
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	m <- x$getinverse()
	if(!is.null(m)) {
		message("getting cached data")
		return(m)
	}
	data <- x$get()
	m <- solve(data, ...)
	x$setinverse(m)
	m
}
