#loading the library
library("data.table")

# Unzipping the file
unzp<-"C:\\Users\\varen\\Downloads\\exdata_data_household_power_consumption.zip"
setwd("C:\\Users\\varen\\Downloads")
unzip(unzp,exdir="D:\\Documents\\R\\Exploratory Data Analysis")

setwd("D:\\Documents\\R\\Exploratory Data Analysis")
fl<-"household_power_consumption.txt"

#creating table dat and filtering the timelines for dates
dat<-read.table(fl,header=TRUE,sep=";",dec=",",na.strings = "?")
new_dat<- dat[dat$Date %in% c("1/2/2007","2/2/2007") ,]

#creating variable activeprw with the column of Global_active_power
activepwr<-as.numeric(new_dat$Global_active_power)

#creating plot with specific width and ht
png("plot1.png",width=480,height=480)

#histogram for EDA
hist(activepwr,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)",ylab="Frequency")

#closing devices
dev.off()
