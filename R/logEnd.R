## [[file:~/Documents/Projects/AlienManagementDrakensberg/sim/packages/logger/logger.org::*logEnd][logEnd:1]]
  ##' Ends logging header
  ##'
  ##' Ends logging header and writes timestanps of begin time and end time
  ##' @title logEnd
  ##' @return invisible returns the new header level
  ##' @author Rainer M Krug
  ##' @export
  logEnd <- function( ) {
    hc <- logTime()
    hl <- getHeaderLevel()
    if (hl <= getLoggingThreshold()) {
      msg <- paste0(
        paste0(rep("*", (hl*2-1)), collapse=""), " [", hc, "] ", getHeader(), " END", "\n",
        "CLOCK: [", getHeaderClock(), "]--[", hc, "]\n"
        )
      if (getLogToFile()) {
        cat(
          msg,
          file = getLogFileName(),
          append = TRUE
          )
      }
      if (getLogToConsole()) {
        cat("\n", msg, "\n")
      }
    }
    invisible( .decHeaderLevel() )
  }
## logEnd:1 ends here
## [[file:~/Documents/Projects/AlienManagementDrakensberg/sim/packages/logger/logger.org::*logList][logList:1]]
  ##' log an entry without changing the header level
  ##'
  ##' Log a message in the actual logging level.
  ##' @title logList
  ##' @param ... values which will be concatenated using paste(..., collapse=" ")
  ##'   to the message to be logged.
  ##' @author Rainer M Krug
  ##' @export
  logList <- function( ... ) {
    hl <- getHeaderLevel()
    if (hl <= getLoggingThreshold()) {
      msg <- paste0(
        paste0(rep("*", (hl*2)), collapse=""), " [", logTime(), "] ", paste( ..., collapse=" " ), "\n"
        )
      if (getLogToFile()) {
        cat(
          msg,
          file = getLogFileName(),
          append = TRUE
          )
      }
      if (getLogToConsole()) {
        cat("\n", msg, "\n")
      }
    }
    invisible(NULL)
  }
## logList:1 ends here

## Local Variables:
## org-babel-tangled-file: t
## buffer-read-only: t
## eval:: (auto-revert-mode)
## End:
