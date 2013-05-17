\name{newLogFile}
\alias{newLogFile}
\title{newLogFile}
\usage{
  newLogFile(logFileName)
}
\arguments{
  \item{logFileName}{character, the neme including path for
  the new logfile.}
}
\value{
  character value of the old log file name
}
\description{
  Create empty logfile and mark it as org file
}
\details{
  Creates a new empty log file with one initial line
  defining it as an org-mode file, i.e. when opened with
  org-mode in emacs, it is formated to provide folding et
  al. An existing file with the same name will be deleted!
  The variable logFileName will be set and logging to file
  will be enabled.
}
\author{
  Rainer M Krug
}

