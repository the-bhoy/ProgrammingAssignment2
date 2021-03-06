## Pair of functions that cache inverse of matrix

## creates "matrix" object that can cache inverse
makeCacheMatrix <- function(x = matrix()) {

       inv<- NULL
       set <- function(y){
                x<<- y
                m<<- NULL
       }
        get<- function() x
        setinverse <- function(inverse) inv<<- inverse
        getinverse <- function() inv
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

## computes inverse of matrix above
#if inverse already calculated, return unchanged
cacheSolve <- function(x, ...) {
        
        inv<- x$getinverse()
        if(!is.null(inv)) {
                message("get cached data")
                return(inv)
        }
                data<- x$get()
                inv <- solve(data)
                x$setinverse(inv)
                inv
}
