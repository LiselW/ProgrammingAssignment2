## This function containt two functions named makeCacheMatrix and cacheSolve. 
## makeCacheMatrix ccalculates the inverse of a matrix and caches this.
## cacheSolve retreives the inverted matrix and stores it in a new object.

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL # Create empty object to contain the inversed matrix
  set <-function(y){
    x<<- y #Create object y that also contains the matrix
    m<<-NULL # Create/maintain empty object to contain the inversed matrix
  }
  get<-function()x # declares x
  setinverse<-function(solve) { #puts the value of an inverted matrix in m when used together with cacheSolve
      m<<-solve #set the value of m in the parent environment
    }
  getinverse<-function()m #declares m
  list(set=set, # gives each function the matching name 
       get=get,
       setinverse=setinverse, 
       getinverse=getinverse)

}

cacheSolve <- function(x, ...) {
  m <- x$getinverse() #applies the 
  if (!is.null(m)) { #checks if the value in m is NULL and otherwise retuns a message
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinvenverse #puts the inverse in x
  m
}

