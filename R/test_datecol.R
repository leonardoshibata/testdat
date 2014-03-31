#' Test for proper formatting in a date column
#' 
#' @dat data frame to test
#' @index index of column containing dates
#' @form a lubridate function giving the format the dates should be in
#' @value returns FALSE if parsing using the function specified in \code{form} fails. If parsing succeeds, the minimum and maximum years in the date column are printed, so that mis-formatted dates (that still pass parse tests) can be detected.
test_datecol = function(dat, index, form=ymd){
    require(lubridate)
    formatted_dates = suppressWarnings(form(dat[,index]))
    if(any(is.na(formatted_dates))){
        message(paste0('Some dates not in specified format (',
            as.character(quote(ymd)), ')'))
        return(FALSE)
    }
    years = sapply(formatted_dates, year)
    message(paste('min year:', min(years)))
    message(paste('max year:', max(years)))
    return(TRUE)
}