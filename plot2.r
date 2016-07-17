hpc<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")
filtro<-as.Date(c("01/02/2007","02/02/2007"), "%d/%m/%Y")
shpc<-subset(hpc, as.Date(Date, "%d/%m/%Y") %in% filtro)
shpc$DateTime <- strptime(paste(shpc$Date,shpc$Time),"%d/%m/%Y %H:%M:%S")
for ( i in 3:9 ) { shpc[,i] <- as.numeric(shpc[,i]) }
png(filename = "plot2.png", width = 480, height = 480, units = "px")
with(shpc, plot(DateTime, Global_active_power, type = "l", ann = FALSE))
title( ylab="Global Active Power (kilowatts)" )
dev.off()