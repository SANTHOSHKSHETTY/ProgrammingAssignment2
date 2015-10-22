## Caching the inverse of a matrix
## In order to  cache the inverse of a matrix, a special matrix object is required 
## which has the capability to store its inverse as well
## This function receives a matrix data as input
## and has 4 functions
## set and get to set and get the matrix data and setInverse and GetInverse are used to get and set the inverse


makeCacheMatrix <- function(x = matrix()) {

   inverse<-NULL      ## initialise inverse cache variable
   
    set<-function(y=matrix()) {       ## used to reset matrix object using set function
               x<<-y
               inverse<<-NULL     

    }

    get<-function() x     ## function to return the matrix data

    setInverse<-function(i)          ## function used to set the inverse that is to cache the inverse
    {   inverse<<-i
    }

    getInverse<-function() inverse    ## Function to retrive the inverse

list(set=set,get=get,getInverse=getInverse,setInverse=setInverse)   ## List of functions 


}

## This function compute and caches the inverse of the matrix 
## Function first checks whether inverse is already calculated if yes then it returns from the cache
## 

cacheSolve <- function(x, ...) {
        
i<-x$getInverse()      #  Retrieves cached inverse
        
        
if ( !is.null(i))  {
message("chached data")
return(i)  ## returning from cache
}

## if found null , it will compute the inverse
data<-x$get()      ##  retrieve matrix
i<-solve(data)     ## use solve to inverse the matrix
x$setInverse(i)    ## Caches the inverse
i    ##  return the inverse 

        
        
        
}
