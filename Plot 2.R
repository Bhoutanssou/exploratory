setwd("../ExData_Plotting1/")
getwd()

## Import data 

df_eletric <- read.table('household_power_consumption.txt', sep = ';', header = TRUE)
head(df_eletric)

## Witch class is the columns 
lapply(df_eletric,class)

df_eletric$Date <- as.Date(df_eletric$Date, tryFormats = "%d/%m/%Y")
df_eletric$Time < as.Date(df_eletric$Time, tryFormats = "%H:%M:%S")

## FIlter period  -> 2007-02-01 and 2007-02-02

df_filtered <- df_eletric[(df_eletric$Date >= "2007-02-01" & df_eletric$Date <= "2007-02-02"),]

##### Plot 2  ##### 

#English TimeZone
Sys.setlocale("LC_TIME", "English")

weekdays =  as.POSIXct(paste(df_filtered$Date, df_filtered$Time, sep = " "))
globalActivePower <- as.numeric(df_filtered$Global_active_power)

png("plot2.png", width=480, height=480)
plot(weekdays,globalActivePower, type = "l", ylab="Global Active Power (kilowatts)",xlab = "" )


dev.off()
