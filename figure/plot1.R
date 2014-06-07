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

#plot1 on the screen
hist(EPCsub[,3], col="red", xlab= "Global Active Power (kilowatts)", main="Global Active Power")

#plot1 png
png("plot1.png", width=480, height=480)
hist(EPCsub[,3], col="red", xlab= "Global Active Power (kilowatts)", main="Global Active Power")
dev.off()

