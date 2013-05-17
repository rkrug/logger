## [[file:~/Documents/Projects/AlienManagementDrakensberg/sim/packages/logger/logger.org::*define%20logging%20environment][define\ logging\ environment:1]]
.logData <- new.env()
##
assign("loggingThreshold", 10, envir = .logData)
assign("logToFile", FALSE, envir = .logData)
assign("logFileName", NULL, envir = .logData)

assign("logToConsole", TRUE, envir = .logData)
##
assign("logHeaderLevel", 0, envir = .logData)
assign("logHeader", "", envir = .logData)
assign("logHeaderClock", "", envir = .logData)
assign("timeFormat", "", envir = .logData)
## define\ logging\ environment:1 ends here
