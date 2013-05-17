\name{setLogToFile}
\alias{setLogToFile}
\title{Set logToFile}
\usage{
  setLogToFile(newValue)
}
\arguments{
  \item{newValue}{logical, TRUE if logs should be written
  to LogFileName, FALSE if not default value: FALSE}
}
\value{
  the old value of logToFile
}
\description{
  Set logToFile If logFileName is NULL, this value can not
  be set to TRUE and will issue a warning
}
\author{
  Dr Rainer M Krug
}

