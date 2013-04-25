## [[file:~/Documents/Projects/AlienManagementDrakensberg/sim/packages/logger/logger.org::*define%20logging%20environment][define\ logging\ environment:1]]
.logData <- new.env()
assign(".logHeaderLevel", 0, envir = .logData)
assign(".logHeader", "", envir = .logData)
assign(".logHeaderClock", "", envir = .logData)
## define\ logging\ environment:1 ends here
## [[file:~/Documents/Projects/AlienManagementDrakensberg/sim/packages/logger/logger.org::*logtime][logtime:1]]
logTime <- function(format) {
  return(as.character(Sys.time()))
}
## logtime:1 ends here
## [[file:~/Documents/Projects/AlienManagementDrakensberg/sim/packages/logger/logger.org::*getHeaderLevel][getHeaderLevel:1]]
getHeaderLevel <- function() {
  return( get(".logHeaderLevel", envir = .logData) )
}
## getHeaderLevel:1 ends here
## [[file:~/Documents/Projects/AlienManagementDrakensberg/sim/packages/logger/logger.org::*getHeader][getHeader:1]]
getHeader <- function() {
  return( get(".logHeader", envir = .logData)[getHeaderLevel()] )
}
## getHeader:1 ends here
## [[file:~/Documents/Projects/AlienManagementDrakensberg/sim/packages/logger/logger.org::*getHeaderClock][getHeaderClock:1]]
getHeaderClock <- function() {
  return( get(".logHeaderClock", envir = .logData)[getHeaderLevel()] )
}
## getHeaderClock:1 ends here
## [[file:~/Documents/Projects/AlienManagementDrakensberg/sim/packages/logger/logger.org::*incHeaderLevel][incHeaderLevel:1]]
incHeaderLevel <- function(header, clock) {
  nl <- getHeaderLevel() + 1
  nh <- c(get(".logHeader", envir = .logData), header)
  nc <- c(get(".logHeaderClock", envir = .logData), clock)
  assign(".logHeaderLevel", nl, envir = .logData)
  assign(".logHeader", nh, envir = .logData)
  assign(".logHeaderClock", nc, envir = .logData)
  return( nl )
}
## incHeaderLevel:1 ends here
## [[file:~/Documents/Projects/AlienManagementDrakensberg/sim/packages/logger/logger.org::*decHeaderLevel][decHeaderLevel:1]]
decHeaderLevel <- function() {
  ol <- getHeaderLevel()
  if (ol == 0) {
    nl <- 0
  } else {
    nl <- ol - 1
    assign(".logHeaderLevel", nl,                                             envir = .logData)
    assign(".logHeader",      get(".logHeader", envir = .logData)[1:nl],      envir = .logData)
    assign(".logHeaderClock", get(".logHeaderClock", envir = .logData)[1:nl], envir = .logData)
  }
  if (nl==0) {
    assign(".logHeader", NULL, envir=.logData)
    assign(".logHeaderClock", NULL, envir=.logData)
  }
  return( nl )
}
## decHeaderLevel:1 ends here
## [[file:~/Documents/Projects/AlienManagementDrakensberg/sim/packages/logger/logger.org::*newLogFile][newLogFile:1]]
##' Create empty logfile and mark it as org file
##'
##' .. content for \details{} ..
##' @title 
##' @param parameter 
##' @return 
##' @author Rainer M Krug
newLogFile <- function( parameter ) {
  if (!is.null(parameter$logFile)) {
    unlink( parameter$logFile )
    file.create( parameter$logFile )
    cat(
      "#    -*- mode: org -*-\n",
      file = parameter$logFile,
      append = TRUE
      )
    assign(".logHeaderLevel", 0, envir = .logData)
    assign(".logHeader", NULL, envir = .logData)
    assign(".logHeaderClock", NULL, envir = .logData)
  }
}
## newLogFile:1 ends here
## [[file:~/Documents/Projects/AlienManagementDrakensberg/sim/packages/logger/logger.org::*logBegin][logBegin:1]]
##' log as org mode compatible format
##'
##' .. content for \details{} ..
##' @title 
##' @param simObject 
##' @param logToConsole 
##' @param logToFile 
##' @param ... 
##' @return 
##' @author Rainer M Krug
logBegin <- function( parameter, ...) {
  hc <- logTime()
  hl <- incHeaderLevel(paste(..., collapse=" "), clock=hc)
  if (hl <= parameter$loggingThreshold) {
    msg <- paste0(
      paste0(rep("*", (hl*2-1)), collapse=""), " ", "[", hc, "] ", getHeader(), " BEGIN", "\n"
      )
  if (parameter$logToFile) {
    cat(
      msg,
      file = parameter$logFile,
      append = TRUE
      )
  }
  if (parameter$logToConsole) {
    cat("\n", msg, "\n")
  }
}
}
## logBegin:1 ends here
## [[file:~/Documents/Projects/AlienManagementDrakensberg/sim/packages/logger/logger.org::*logEnd][logEnd:1]]
##' log as org mode compatible format
##'
##' .. content for \details{} ..
##' @title 
##' @param simObject 
##' @param logToConsole 
##' @param logToFile 
##' @param ... 
##' @return 
##' @author Rainer M Krug
logEnd <- function( parameter ) {
  hc <- logTime()
  hl <- getHeaderLevel()
  if (hl <= parameter$loggingThreshold) {
    msg <- paste0(
      paste0(rep("*", (hl*2-1)), collapse=""), " [", hc, "] ", getHeader(), " END", "\n",
      "CLOCK: [", getHeaderClock(), "]--[", hc, "]\n"
      ## paste0(rep("*", (hl*2)), collapse=""), " [", hc, "] ", "END", "\n",
      )
    if (parameter$logToFile) {
      cat(
        msg,
        file = parameter$logFile,
        append = TRUE
        )
    }
    if (parameter$logToConsole) {
      cat("\n", msg, "\n")
    }
  }
  decHeaderLevel()
}
## logEnd:1 ends here
## [[file:~/Documents/Projects/AlienManagementDrakensberg/sim/packages/logger/logger.org::*logList][logList:1]]
##' log as org mode compatible format
##'
##' .. content for \details{} ..
##' @title 
##' @param simObject 
##' @param logToConsole 
##' @param logToFile 
##' @param ... 
##' @return 
##' @author Rainer M Krug
logList <- function( parameter, ...) {
  hl <- getHeaderLevel()
  if (hl <= parameter$loggingThreshold) {
    msg <- paste0(
      paste0(rep("*", (hl*2)), collapse=""), " [", logTime(), "] ", paste( ..., collapse=" " ), "\n"
      )
    if (parameter$logToFile) {
      cat(
        msg,
        file = parameter$logFile,
        append = TRUE
        )
    }
    if (parameter$logToConsole) {
      cat("\n", msg, "\n")
    }
  }
}
## logList:1 ends here
