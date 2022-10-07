#loading the library
library("data.table")

#accessing the text file
setwd("D:\\Documents\\R\\Exploratory Data Analysis")
fl<-"household_power_consumption.txt"

#creating table dat and filtering the timelines for dates
dat3<-read.table(fl,header=TRUE,sep=";",dec=",",na.strings = "?")
new_dat<- dat3[dat3$Date %in% c("1/2/2007","2/2/2007") ,]

#changing variable types of col Date and Time
date_time <- strptime(paste(new_dat$Date, new_dat$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#setting var to numeric datatype
activepwr<- as.numeric(new_dat$Global_active_power)
submetering1<-as.numeric(new_dat$Sub_metering_1)
submetering2<-as.numeric(new_dat$Sub_metering_2)
submetering3<-as.numeric(new_dat$Sub_metering_3)

#creating plot with specific width and ht
png("plot3.png",width=480,height=480)

#base plotting
plot(date_time,submetering1,type="l",xlab="",ylab="Energy Submetering")

#creating lines on the base plot
lines(date_time,submetering2,type="l", col="red")
lines(date_time,submetering3,type="l",col="blue")

#key for plot
legend("topleft", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=2, lwd=2, col=c("black", "red", "blue"))

#closing devices
dev.off()