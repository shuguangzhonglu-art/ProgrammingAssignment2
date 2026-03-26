makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL  # 初始化逆矩阵存储变量为 NULL
  
  # 1. set: 设置矩阵的值
  set <- function(y) {
    x <<- y       # 使用 <<- 在父级环境中修改 x
    inv <<- NULL  # 如果矩阵改变了，重置逆矩阵为 NULL
  }
  
  # 2. get: 获取矩阵的值
  get <- function() x
  
  # 3. setInverse: 设置逆矩阵的值
  setInverse <- function(inverse) inv <<- inverse
  
  # 4. getInverse: 获取逆矩阵的值
  getInverse <- function() inv
  
  # 返回一个列表，包含上述四个函数
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}
