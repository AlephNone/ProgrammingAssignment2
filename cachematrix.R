## alteration of cachmean.R code to replace 'mean' with 'solve' function

## This function can do: 1. set value of matrix x; 2. get value of x; 
## 3. set value of inverse matrix; 4. get value of the inverse matrix.

makeCacheMatrix <- function(x = matrix()) {
        v <- NULL
        set <- function(y) {
                x <<- y
                v <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) v <<- solve
        getsolve <- function() v
        list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)
        
}


## This function calculates variable v, the inverse (solve) of matrix created in the above 
## function, but by first checking if v is already computed.

cacheSolve <- function(x, ...) {
        v <- x$getsolve()
        if(!is.null(v)) {
                message("getting cached data")
                return(v)
                
        }
        data <- x$get()
        v <- solve(data, ...)
        x$setsolve(v)
        v
   
}
