setwd("Desktop")
#import data
EPCdata<-read.table("household_power_consumption.txt",
                    colClasses=c("character", "character","numeric",
                                 "numeric","numeric","numeric",             
                                 "numeric","numeric","numeric"),
                    header=TRUE, row.names=NULL, na.strings="?",sep=";")
#remove NAs
EPC<- na.omit(EPCdata)

EPC$Date<-strptime(EPC$Date,"%d/%m/%Y")
#subset 2007-02-01 to 2007-02-02.
start<-strptime("01/02/2007","%d/%m/%Y")
end<-strptime("02/02/2007","%d/%m/%Y")
EPCsub<-subset(EPC, Date >= start & Date<= end)

EPCsub$wkday<-as.POSIXct(paste(EPCsub$Date,EPCsub$Time ))

#plot4 on screen
par(mfcol=c(2,2))
#topleft
plot(EPCsub$wkday,EPCsub[,3],type="l", ylab="Global Active Power (kilowatts)", xlab='')
#bottomleft
plot(EPCsub$wkday,EPCsub[,7],type="l", ylab="Energy sub metering",col="black", xlab='')
lines(EPCsub$wkday,EPCsub[,8], col="red")
lines(EPCsub$wkday,EPCsub[,9], col="blue")
legend("topright", legend=colnames(EPCsub[,7:9]), lty=1,col=c("black","red","blue"),bty="n")
#topright
plot(EPCsub$wkday,EPCsub[,5],type="l", ylab="Voltage", xlab="datetime")
#bottomright
plot(EPCsub$wkday,EPCsub$Global_reactive_power, type="l",
     ylab="Global_reactive_power", xlab="datetime")


#plot4 png
png("plot4.png", width=480, height=480)
par(mfcol=c(2,2))
#topleft
plot(EPCsub$wkday,EPCsub[,3],type="l", ylab="Global Active Power (kilowatts)", xlab='')
#bottomleft
plot(EPCsub$wkday,EPCsub[,7],type="l", ylab="Energy sub metering",col="black", xlab='')
lines(EPCsub$wkday,EPCsub[,8], col="red")
lines(EPCsub$wkday,EPCsub[,9], col="blue")
legend("topright", legend=colnames(EPCsub[,7:9]), lty=1,col=c("black","red","blue"),bty="n")
#topright
plot(EPCsub$wkday,EPCsub[,5],type="l", ylab="Voltage", xlab="datetime")
#bottomright
plot(EPCsub$wkday,EPCsub$Global_reactive_power, type="l",
     ylab="Global_reactive_power", xlab="datetime")
dev.off()
