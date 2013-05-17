## [[file:~/Documents/Projects/AlienManagementDrakensberg/sim/packages/logger/logger.org::*logBegin][logBegin:1]]
##' log as org mode compatible format
##'
##' Logging in org mode compatible format
##' @title logBegin
##' @param ... values which will be concatenated using paste(..., collapse=" ")
##'   to the message to be logged.
##' @return invisible returns new header level
##' @author Rainer M Krug
##' @export
logBegin <- function( ... ) {
    hc <- logTime()
    hl <- .incHeaderLevel(paste(..., collapse=" "), clock=hc)
    if (hl <= getLoggingThreshold()) {
        msg <- paste0(
            paste0(rep("*", (hl*2-1)), collapse=""), " ", "[", hc, "] ", getHeader(), " BEGIN", "\n"
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
    invisible(hl)
}
## logBegin:1 ends here
