#функция для подсчета среднего значения по столбцам
calculate_mean<- function(X,m){
  Z=matrix(1,m)
  for(i in 1:m){
    Z[i]=mean(X[,i])
  }
  return(Z)
}
#функция для подсчета медианы по столбцам
calculate_median<- function(X,m){
  Z=matrix(1,m)
  for(i in 1:m){
    Z[i]=median(X[,i])
  }
  return(Z)
}
#функция для подсчета дисперсии по столбцам
calculate_var<- function(X,m){
  Z=matrix(1,m)
  for(i in 1:m){
    Z[i]=var(X[,i])
  }
  return(Z)
}
#функция для подсчета максимума по столбцам
calculate_max<- function(X,m){
  Z=matrix(1,m)
  for(i in 1:m){
    Z[i]=max(X[,i])
  }
  return(Z)
}
#функция для подсчета минимума по столбцам
calculate_min<- function(X,m){
  Z=matrix(1,m)
  for(i in 1:m){
    Z[i]=min(X[,i])
  }
  return(Z)
}

#Пуассоновское распределение: λ=0.8

#n-количество строк,m-количество столбцов.Нужно задавать n=50,200 и 1000
n=1000
m=1000
matrix_poisson_distribution=matrix(rpois(n*m,0.8),n,m)

#График эмпирической функции для первого столбца
plot(ecdf(matrix_poisson_distribution[,1]))
#Гистограмма плотности вероятности для первого столбца
hist(matrix_poisson_distribution[,1],breaks = 11,freq = FALSE)
#Гистограмма частоты встречаемости для первого столбца
hist(matrix_poisson_distribution[,1],breaks = 9)
#Полигон частот для первого столбца
h1<-hist(matrix_poisson_distribution[,1],breaks = 9)
lines(h1$counts~h1$mids, col="red", lwd = 2)

#выборочное среднее
sample_mean_matrix=calculate_mean(matrix_poisson_distribution,m)
#График эмпирической функции для выборочного среднего
plot(ecdf(sample_mean_matrix))
#Гистограмма для выборочного среднего
hist(sample_mean_matrix,breaks = 11,freq = FALSE)
#среднее значение для строки из выборочных средних
mean_of_sample_mean_matrix=calculate_mean(sample_mean_matrix,1)
#выборочная дисперсия для строки из выборочных средних
var_of_sample_mean_matrix=calculate_var(sample_mean_matrix,1)

#выборочная медиана
sample_median_matrix=calculate_median(matrix_poisson_distribution,m)
#График эмпирической функции для выборочной медианы
plot(ecdf(sample_median_matrix))
#Гистограмма для выборочной медианы
hist(sample_median_matrix,breaks = 11,freq = FALSE)
#среднее значение для строки из выборочных медиан
mean_of_sample_median_matrix=calculate_mean(sample_median_matrix,1)
#выборочная дисперсия для строки из выборочных медиан
var_of_sample_median_matrix=calculate_var(sample_median_matrix,1)

#выборочный максимум
sample_maximum_matrix=calculate_max(matrix_poisson_distribution,m)
#График эмпирической функции для выборочного максимума
plot(ecdf(sample_maximum_matrix))
#Гистограмма для выборочного максимума
hist(sample_maximum_matrix,breaks = 11,freq = FALSE)
#среднее значение для строки из выборочных максимумов
mean_of_sample_maximum_matrix=calculate_mean(sample_maximum_matrix,1)
#выборочная дисперсия для строки из выборочных максимумов
var_of_sample_maximum_matrix=calculate_var(sample_maximum_matrix,1)

#выборочный минимум
sample_minimum_matrix=calculate_min(matrix_poisson_distribution,m)
#График эмпирической функции для выборочного максимума
plot(ecdf(sample_minimum_matrix))
#Гистограмма для выборочного максимума
hist(sample_minimum_matrix,breaks = 11,freq = FALSE)
#среднее значение для строки из выборочных максимумов
mean_of_sample_minimum_matrix=calculate_mean(sample_minimum_matrix,1)
#выборочная дисперсия для строки из выборочных максимумов
var_of_sample_minimum_matrix=calculate_var(sample_minimum_matrix,1)

#встроенная функция описат статистики
library("pastecs")
verify_matrix_for_sample_mean_matrix=stat.desc(sample_mean_matrix)
verify_matrix_for_sample_median_matrix=stat.desc(sample_median_matrix)
verify_matrix_for_sample_maximum_matrix=stat.desc(sample_maximum_matrix)
verify_matrix_for_sample_minimum_matrix=stat.desc(sample_minimum_matrix)


