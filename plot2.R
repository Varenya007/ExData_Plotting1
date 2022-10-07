#loading the library
library("data.table")

#accessing the text file
setwd("D:\\Documents\\R\\Exploratory Data Analysis")
fl<-"household_power_consumption.txt"

#creating table dat and filtering the timelines for dates
dat2<-read.table(fl,header=TRUE,sep=";",dec=",",na.strings = "?")
new_dat<- dat2[dat2$Date %in% c("1/2/2007","2/2/2007") ,]

#changing variable types of col Date and Time
date_time <- strptime(paste(new_dat$Date, new_dat$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#setting var to numeric datatype
activepwr<- as.numeric(new_dat$Global_active_power)

#creating plot with specific width and ht
png("plot2.png",width=480,height=480)

#base plotting
plot(date_time,activepwr,type="l",xlab="",ylab="Global Active Power (kilowatts)")

#closing devices
dev.off()
