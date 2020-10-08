#comments provide explanation to the code
#Below two functions are used to create an object that stores a matrix and caches its inverse

#Below function does, set and get of a matrix
makematrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() {x}
        setinverse <- function(inverse) m <<- inverse
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

#Below function checks first if the inverse has been created. 
#If not it will create the inverse
cacheinverse <- function(x, ...) {
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
#TEST
#randommatrix <- makematrix(matrix(1:4,nrow=2,ncol=2))
#randommatrix$get()

#randommatrix$getinverse()
#cacheinverse(randommatrix)
