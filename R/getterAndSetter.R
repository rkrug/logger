## [[file:~/Documents/Projects/AlienManagementDrakensberg/sim/packages/logger/logger.org::*getLoggingThreshold][getLoggingThreshold:1]]
##' getter for logging threshold
##'
##' getter function for logging threshold.
##' Maximum header level which will be logged, default value is 10.
##' @return integer value for the logging threshold
##' @author Dr Rainer M Krug
##' @export
getLoggingThreshold <- function() {
  return( get("loggingThreshold", envir = .logData) )
}
## getLoggingThreshold:1 ends here
## [[file:~/Documents/Projects/AlienManagementDrakensberg/sim/packages/logger/logger.org::*setLoggingThreshold][setLoggingThreshold:1]]
##' Set logging threshold
##'
##' Set logging threshold to new value
##' @author Dr Rainer M Krug
##' @export
##' @param newLoggingThreshold the new logging threshold to be used.
##'   default value: 10
##' @return the old logging threshold used
setLoggingThreshold <- function(newLoggingThreshold = 10) {
  oldLoggingThreshold <- get("loggingThreshold", envir = .logData)
  assign("loggingThreshold", newLoggingThreshold, envir = .logData)
  invisible( oldLoggingThreshold )
}
## setLoggingThreshold:1 ends here
## [[file:~/Documents/Projects/AlienManagementDrakensberg/sim/packages/logger/logger.org::*getLogFileName][getLogFileName:1]]
##' getter for logFileName
##'
##' getter function for log file name
##' Name of log file
##' @return integer value for the logging threshold
##' @author Dr Rainer M Krug
##' @export
getLogFileName <- function() {
  return( get("logFileName", envir = .logData) )
}
## getLogFileName:1 ends here
## [[file:~/Documents/Projects/AlienManagementDrakensberg/sim/packages/logger/logger.org::*setLogFileName][setLogFileName:1]]
##' Set log file name
##'
##' Set log file name
##' If the name is null (default), logging to file will be disabled.
##' @author Dr Rainer M Krug
##' @export
##' @param newLogFileName the new log file name to be used
##'   default value: 10
##' @return the old logging threshold used
setLogFileName <- function(newLogFileName = NULL) {
  oldLogFileName <- get("logFileName", envir = .logData)
  assign("logFileName", newLogFileName, envir = .logData)
  if (is.null(newLogFileName)) {
      assign("logToFile", FALSE, envir = .logData)
  }
  invisible( oldLogFileName )
}
## setLogFileName:1 ends here
## [[file:~/Documents/Projects/AlienManagementDrakensberg/sim/packages/logger/logger.org::*getLogToFile][getLogToFile:1]]
##' getter for logToFile
##'
##' getter function for logToFile
##' TRUE if logging to getLogFileName(), otherwise FALSE
##' @return logical, TRUE if logging to file, otherwise FALSE
##' @author Dr Rainer M Krug
##' @export
getLogToFile <- function() {
  return( get("logToFile", envir = .logData) )
}
## getLogToFile:1 ends here
## [[file:~/Documents/Projects/AlienManagementDrakensberg/sim/packages/logger/logger.org::*setLogToFile][setLogToFile:1]]
##' Set logToFile
##'
##' Set logToFile
##' If logFileName is NULL, this value can not be set to TRUE and will issue a warning 
##' @author Dr Rainer M Krug
##' @export
##' @param newValue logical, TRUE if logs should be written to LogFileName, FALSE if not
##'   default value: FALSE
##' @return the old value of logToFile
setLogToFile<- function( newValue ) {
    oldValue <- get("logToFile", envir = .logData)
    if (is.null(getLogFileName()) & newValue) {
        warning("can not set logToFile to TRUE if logFileName==NULL!\n\nlogToFile set to FALSE!")
        assign("logToFile", FALSE, envir = .logData)
    } else {
        assign("logToFile", newValue, envir = .logData)
    }
    invisible( oldValue )
}
## setLogToFile:1 ends here
## [[file:~/Documents/Projects/AlienManagementDrakensberg/sim/packages/logger/logger.org::*getLogToConsole][getLogToConsole:1]]
##' getter for logToConsole
##'
##' getter function for logToConsole
##' @return logical, TRUE if logging to console, otherwise FALSE
##' @author Dr Rainer M Krug
##' @export
getLogToConsole <- function() {
  return( get("logToConsole", envir = .logData) )
}
## getLogToConsole:1 ends here
## [[file:~/Documents/Projects/AlienManagementDrakensberg/sim/packages/logger/logger.org::*setLogToConsole][setLogToConsole:1]]
##' Set logToConsole
##'
##' Set logToConsole
##' 
##' @author Dr Rainer M Krug
##' @export
##' @param newValue logical, TRUE if logs should be written to console, FALSE if not
##'   default value: FALSE
##' @return the old value of logToConsole
setLogToConsole <- function(newValue = NULL) {
  oldValue <- get("logToConsole", envir = .logData)
  assign("logToConsole", newValue, envir = .logData)
  invisible( oldValue )
}
## setLogToConsole:1 ends here
## [[file:~/Documents/Projects/AlienManagementDrakensberg/sim/packages/logger/logger.org::*getHeaderLevel][getHeaderLevel:1]]
##' getter for header level
##'
##' getter function for header level
##' @title getterAndSetter
##' @return integer value for the header level
##' @author Dr Rainer M Krug
##' @export
getHeaderLevel <- function() {
  return( get("logHeaderLevel", envir = .logData) )
}
## getHeaderLevel:1 ends here
## [[file:~/Documents/Projects/AlienManagementDrakensberg/sim/packages/logger/logger.org::*getHeader][getHeader:1]]
##' getter for the last header used
##'
##' getter function for last header
##' @return character string containing last header
##' @author Dr Rainer M Krug
##' @export
getHeader <- function() {
  return( get("logHeader", envir = .logData)[getHeaderLevel()] )
}
## getHeader:1 ends here
## [[file:~/Documents/Projects/AlienManagementDrakensberg/sim/packages/logger/logger.org::*getHeaderClock][getHeaderClock:1]]
##' getter function for time last header
##'
##' getter function for the time when the last header was logged
##' @return character string for the last header time
##' @author Dr Rainer M Krug
##' @export
getHeaderClock <- function() {
  return( get("logHeaderClock", envir = .logData)[getHeaderLevel()] )
}
## getHeaderClock:1 ends here
## [[file:~/Documents/Projects/AlienManagementDrakensberg/sim/packages/logger/logger.org::*setTimeFormat][setTimeFormat:1]]
##' Set time format
##'
##' Set time format which will be used to formate the timestamps
##' @param newFormat new timeformat to be used. See ?strptime for details of the format 
##' @return the old format string used
##' @author Dr Rainer M Krug
##' @export
setTimeFormat <- function(newFormat) {
  oldFormat <- get("timeFormat", envir = .logData)
  assign("timeFormat", newFormat, envir = .logData)
  invisible( oldFormat )
}
## setTimeFormat:1 ends here
