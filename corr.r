corr <- function(directory, threshold = 0) {
    
    dir_1 <- 'C://Users/PC/Desktop/AI/DS/Data Science/2. R Programming/2. Programming with R/Assignment'
    dir_1 <- paste(dir_1, '/', directory, sep = '')
    nobs <- c()
    cr <- c()
    
    for (i in 1:332) {
        if (i %/% 100 > 0) {
            df <- read.csv(paste(dir_1, '/', i, '.csv', sep = ''))
        } else if (i %/% 10 > 0) {
            df <- read.csv(paste(dir_1, '/', paste('0', i, '.csv', sep = ''), sep = ''))
        } else {
            df <- read.csv(paste(dir_1, '/', paste('00', i, '.csv', sep = ''), sep = ''))
        }
        
        not_na <- !is.na(df[ , 2]) & !is.na(df[ , 3])
        nobs[i] <- length(df[ , 2][not_na])
        if (nobs[i] > threshold) {
            cr [i] <- cor(df[ , 2][not_na], df[ , 3][not_na])
        }
        
    }
    cr <- cr[][!is.na(cr)]
    return(cr)
}