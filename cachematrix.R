## **These functions calulcate the inverse of a given matrix (x) and cache this object** 
## **This can then be retrieved without recalculating the inverse of x**

# Builds a set of functions to inverse a given matrix (x) and returns these functions within a list to the parent environment through <<-
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  #Initilises objects
  set <- function(y) {
    x <<- y
    m <<- NULL
  # assigns input argument to the x object in the parent environment (<<-)
  # assigns value of NULL to the m object in the parent environment, clearing the value of m from previous executions of the function
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  # Defines getters and setters
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
  # Creates new object by returning a list
}


## CacheSolve or calculates and caches, or retrieves the inverse of a given matrix if already cached using makeCacheMatrix.  
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
    # If inverse of given matrix has already been calculated and cached in makeCacheMatrix, it is retrieved 
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  m
  # If this inverse matrix has not been calculated, it is calculated and cached, as well as returned.
}
