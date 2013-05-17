## [[file:~/Documents/Projects/AlienManagementDrakensberg/sim/packages/logger/logger.org::*newLogFile][newLogFile:1]]
##' Create empty logfile and mark it as org file
##'
##' Creates a new empty log file with one initial line defining it as an org-mode file,
##' i.e. when opened with org-mode in emacs, it is formated to provide folding et al.
##' An existing file with the same name will be deleted!
##' The variable logFileName will be set and logging to file will be enabled.
##' @title newLogFile
##' @param logFileName character, the neme including path for the new logfile.
##' @return character value of the old log file name
##' @author Rainer M Krug
##' @export
newLogFile <- function( logFileName ) {
    unlink( logFileName )
    file.create( logFileName )
    cat(
        "#    -*- mode: org -*-\n",
        file = logFileName,
        append = TRUE
        )
    oldLogFileName <- getLogFileName()
    setLogFileName( logFileName )
    ## assign("logHeaderLevel", 0, envir = .logData)
    ## assign("logHeader", NULL, envir = .logData)
    ## assign("logHeaderClock", NULL, envir = .logData)
    invisible(oldLogFileName)
}
## newLogFile:1 ends here
