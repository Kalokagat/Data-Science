pollutantmean <- function(directory, pollutant, id = 1:332) {
   
   dir_1 <- 'C://Users/PC/Desktop/AI/DS/Data Science/2. R Programming/2. Programming with R/Assignment'
   dir_1 <- paste(dir_1, '/', directory, sep = '')
   p_sum <- 0
   p_len <- 0
   
   for (i in id) {
       
       if (i %/% 100 > 0) {
           df <- read.csv(paste(dir_1, '/', i, '.csv', sep = ''))
       } else if (i %/% 10 > 0) {
           df <- read.csv(paste(dir_1, '/', paste('0', i, '.csv', sep = ''), sep = ''))
       } else {
           df <- read.csv(paste(dir_1, '/', paste('00', i, '.csv', sep = ''), sep = ''))
       }
       is_na <- is.na(df[ , pollutant])
       p_sum <- sum(df[ , pollutant][!is_na]) + p_sum
       p_len <- length(df[ , pollutant][!is_na]) + p_len
   }
   pmean <- p_sum / p_len
   return(pmean)
   } 

