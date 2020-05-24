# Function which returns subset or r length from n 
from itertools import combinations 
  
def rSubset(arr, r): 
  
    # return list of all subsets of length r 
    # to deal with duplicate subsets use  
    # set(list(combinations(arr, r))) 
    return list(combinations(arr, r)) 

# Driver Function 
if __name__ == "__main__": 
    arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11] 
    r = 3
    print(rSubset(arr, r))