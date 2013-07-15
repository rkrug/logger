## [[file:~/Documents/Projects/AlienManagementDrakensberg/sim/packages/logger/logger.org::*.incHeaderLevel][\.incHeaderLevel:1]]
  ##' Increment header level
  ##'
  ##' Increases the header level by one, using the given header and clock time
  ##' @title incHeaderLevel
  ##' @param header character string, Header of the new header level
  ##' @param clock character string, containing the timestamp
  ##' @return  integer value for the the new header level
  ##' @author Dr Rainer M Krug
  .incHeaderLevel <- function(header, clock) {
    nl <- getHeaderLevel() + 1
    nh <- c(get("logHeader", envir = .logData), header)
    nc <- c(get("logHeaderClock", envir = .logData), clock)
    assign("logHeaderLevel", nl, envir = .logData)
    assign("logHeader", nh, envir = .logData)
    assign("logHeaderClock", nc, envir = .logData)
    invisible( nl )
  }
## \.incHeaderLevel:1 ends here

## Local Variables:
## org-babel-tangled-file: t
## buffer-read-only: t
## eval:: (auto-revert-mode)
## End:
