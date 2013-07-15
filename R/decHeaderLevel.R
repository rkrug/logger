## [[file:~/Documents/Projects/AlienManagementDrakensberg/sim/packages/logger/logger.org::*.decHeaderLevel][\.decHeaderLevel:1]]
  ##' decreases the header level
  ##'
  ##' decreases the header level.
  ##' @title decHeaderLevel
  ##' @return integer value for the new header level
  ##' @author Dr Rainer M Krug
  .decHeaderLevel <- function() {
    ol <- getHeaderLevel()
    if (ol == 0) {
      nl <- 0
    } else {
      nl <- ol - 1
      assign("logHeaderLevel", nl,                                             envir = .logData)
      assign("logHeader",      get("logHeader", envir = .logData)[1:nl],      envir = .logData)
      assign("logHeaderClock", get("logHeaderClock", envir = .logData)[1:nl], envir = .logData)
    }
    if (nl==0) {
      assign("logHeader", NULL, envir=.logData)
      assign("logHeaderClock", NULL, envir=.logData)
    }
    invisible( nl )
  }
## \.decHeaderLevel:1 ends here

## Local Variables:
## org-babel-tangled-file: t
## buffer-read-only: t
## eval:: (auto-revert-mode)
## End:
