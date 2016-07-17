hpc<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")
filtro<-as.Date(c("01/02/2007","02/02/2007"), "%d/%m/%Y")
shpc<-subset(hpc, as.Date(Date, "%d/%m/%Y") %in% filtro)
for ( i in 3:9 ) { shpc[,i] <- as.numeric(shpc[,i]) }
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(shpc$Global_active_power, col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()