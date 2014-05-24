## This file contains the functions to create a matrix and compute the inverse of a matrix
## For sake of clarity, variable names and functionnames have been adapted to improve readability

#This first function (makeCacheMatrix) will create a matrix and set its properties. It consists of a matrix variable (here: x)
#and a variable that will hold it's inverse (inverseMatrix)

makeCacheMatrix <- function(x = matrix()) {
    #if no specific method is called, at least set a value for the inverseMatrix
    #this line behaves like a 'constructor method without arguments passed to it'
    inverseMatrix <- NULL 
    
    #This method (setMatrix) will set the dimensions of the matrix. This function basically behaves as a 
    #'constructor method with arguments' in Object Oriented Programming terms
    setMatrix <- function(n){
      x <<- matrix(nrow = n, ncol = n) #creates a n x n matrix (= squared)
      inverseMatrix <<- NULL
    }
    
    #Sometimes you just want to get the matrix. The method below does just that.
    getMatrix <- function() x #this is a shorthand notation if there is only one line of code in a function
  
    #The method below will set the value of inverseMatrix with the value passed to it
    setInverseMatrix <- function(inverse = matrix()) inverseMatrix <<- inverse
    
    #if you want to know what the value of the inverseMatrix is, this method provides it
    getInverseMatrix <- function() inverseMatrix
    
    #This part might be confusing, but what the matrix object really is, is a list with functions (methods)
    #that you can call on the matrix object. This list is what is finally returned from "makeCacheMatrix"
    list(setMatrix = setMatrix, 
         getMatrix = getMatrix, 
         setInverseMatrix = setInverseMatrix,
         getInverseMatrix = getInverseMatrix)
}


#The following function is specifically meant for retrieving or computing the inverse of the original matrix 
# "x"

cacheSolve <- function(x = matrix(), ...) {
    
    #First retrieve the current value for the inverseMatrix of "x"
    inverseMatrix <- x$getInverseMatrix()
    
    #If the inverse is already known, return this inverse as the result
    if(!is.null(inverseMatrix)){
      message ("getting cached data")
      return(inverseMatrix) #The 'return' statement not only returns the result, but also makes R exit the function 'cacheSolve'
      }
    
    #If the inverse wasn't known yet (=NULL) then compute and return it
    original_matrix <- x$getMatrix() #get the original matrix
    inverse <- solve(original_matrix) #compute the inverse
    x$setInverseMatrix(inverse) #set the inverseMatrix of 'x' to the computed inverse
    inverse #return the inverse matrix
}    