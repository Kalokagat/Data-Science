complete <- function(directory, id) {
    
    dir_1 <- 'C://Users/PC/Desktop/AI/DS/Data Science/2. R Programming/2. Programming with R/Assignment'
    dir_1 <- paste(dir_1, '/', directory, sep = '')
    nobs <- id

    for (j in seq_along(id)) {
        i <- id[j]
        if (i %/% 100 > 0) {
            df <- read.csv(paste(dir_1, '/', i, '.csv', sep = ''))
        } else if (i %/% 10 > 0) {
            df <- read.csv(paste(dir_1, '/', paste('0', i, '.csv', sep = ''), sep = ''))
        } else {
            df <- read.csv(paste(dir_1, '/', paste('00', i, '.csv', sep = ''), sep = ''))
        }

        not_na <- !is.na(df[ , 2]) & !is.na(df[ , 3])
        nobs[j] <- length(df[ , 2][not_na])

    }
    return(data.frame(id, nobs))
} 

