## [[file:~/Documents/Projects/AlienManagementDrakensberg/sim/packages/logger/logger.org::*logtime][logtime:1]]
  ##' Format function for time
  ##'
  ##' Used to have a consistent format for the time.
  ##' @title logtime
  ##' @return character vector of Sys.time()
  ##' @author Dr Rainer M Krug
  ##' @export
  logTime <- function() {
    return(format(Sys.time(),  get("timeFormat", envir = .logData)))
  }
## logtime:1 ends here

## Local Variables:
## org-babel-tangled-file: t
## buffer-read-only: t
## eval:: (auto-revert-mode)
## End:
