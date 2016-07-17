hpc<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")
filtro<-as.Date(c("01/02/2007","02/02/2007"), "%d/%m/%Y")
shpc<-subset(hpc, as.Date(Date, "%d/%m/%Y") %in% filtro)
shpc$DateTime <- strptime(paste(shpc$Date,shpc$Time),"%d/%m/%Y %H:%M:%S")
for ( i in 3:9 ) { shpc[,i] <- as.numeric(shpc[,i]) }
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfcol=c(2,2))
with(shpc, {
        # Plot 1
        plot(DateTime
             , Global_active_power
             , type="l"
             , ylab="Global Active Power"
             , xlab=""
             , cex.lab=0.9
        )
        
        # Plot 2
        plot(DateTime
             , Sub_metering_1
             , type="l"
             , col="black"
             , ylab="Energy sub metering"
             , xlab=""
             , cex.lab=0.9
        )
        lines(DateTime
              , Sub_metering_2
              , type="l"
              , col="red"          
        )
        lines(DateTime
              , Sub_metering_3
              , type="l"
              , col="blue"
        )
        legend("topright"
               , legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
               , lwd=c(1, 1, 1)
               , col=c("black", "red", "blue")
               , y.intersp=0.75
               , cex=0.9
               , bty="n"
        )
        
        # Plot 3
        plot(DateTime, Voltage
             , type="l"
             , ylab="Voltage"
             , xlab="datetime"
             , cex.lab=0.9
        )
        
        # Plot 4
        plot(DateTime, Global_reactive_power
             , type="l"
             , ylab="Global_reactive_power"
             , xlab="datetime"
             , cex.lab=0.9
        )
    } 
  )
dev.off()