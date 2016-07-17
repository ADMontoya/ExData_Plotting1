hpc<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")
filtro<-as.Date(c("01/02/2007","02/02/2007"), "%d/%m/%Y")
shpc<-subset(hpc, as.Date(Date, "%d/%m/%Y") %in% filtro)
shpc$DateTime <- strptime(paste(shpc$Date,shpc$Time),"%d/%m/%Y %H:%M:%S")
for ( i in 3:9 ) { shpc[,i] <- as.numeric(shpc[,i]) }
png(filename = "plot3.png", width = 480, height = 480, units = "px")
 with(shpc, {
    plot(DateTime, Sub_metering_1, type="l", col="black", ann=FALSE)
    lines(DateTime, Sub_metering_2, type="l", col="red")
    lines(DateTime, Sub_metering_3, type="l", col="blue")
    title( ylab="Energy sub metering" )    
    legend("topright"
           , legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
           , lwd=c(1, 1, 1)
           , col=c("black", "red", "blue")
    )
    } 
  )
dev.off()