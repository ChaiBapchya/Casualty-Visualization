# install.packages("stringr")
# install.packages("lubridate")
# install ggplot
# install.packages("ggplot")
# install.packages("stringi")
# install.packages("tidyr")
# install.packages("lubridate")
# install.packages("ggplot2")
# install.packages("RColorBrewer")
# install.packages("hexbinplot")
# install.packages("hexbin")

library(ggplot2)
library(tidyr)
library("ggplot2")
#library(stringr) Incorrect - missing quotes
library("stringr")
library("RColorBrewer")
library('hexbin')
library(grid)

airplane = read.csv("Airplane_Crashes_and_Fatalities_Since_1908.csv") #Read from csv file
#airplane #displays the csv file
#airplane[1,] #displays the 1st row
#airplane[0,] #displays the 0th row i.e. headers

#nrow(airplane) #returns no. of rows
#ncol(airplane) #returns no. of columns
#airplane[0] #no output
#airplane[0][0] #no output

#airplane["Date"] #displays the Date column of dataframe

#Error
#as.Date(airplane[[0]],"%m/%d/%Y") #Error in .subset2(x, i, exact = exact) : attempt to select less than one element in get1index <real>
#Error 
#as.Date(airplane[0][0],"%m/%d/%Y") #Error in as.Date.default(airplane[0][0], "%m/%d/%Y") : do not know how to convert 'airplane[0][0]' to class “Date”
#Error 
#as.Date(airplane[0],"%m/%d/%Y") #Error in as.Date.default(airplane[0][0], "%m/%d/%Y") : do not know how to convert 'airplane[0][0]' to class “Date”

#airplane["Date"][0] #no output
#Error
#airplane[0]["Date"] #Error in `[.data.frame`(airplane[0], "Date") : undefined columns selected

#airplane["Date"][0,] #all the dates displayed
#airplane[0,"Date"] #all the dates displayed

#as.character(airplane[0,"Date"]) #incorrect
#as.character(airplane[["Date"]][1]) 
#as.Date(as.character(airplane[["Date"]][1]),"%m/%d/%Y") #converts to the desired format

# for(date in as.character(airplane[["Date"]])){ print(as.Date(date,"%m/%d/%Y"))} 

datedf <- airplane[,c(1)]
timedf <- airplane[,c(2)]
datedf <-data.frame() #initialize the new dataframe
for(date in as.character(airplane[["Date"]])){ datedf<-rbind(datedf,data.frame(as.Date(date,"%m/%d/%Y")))}
datedf
for(i in datedf){print(i)} 

#error
#separate(datedf,sep = "/") #Error: Please supply column name

colnames(datedf) #displays the column names of the dataframe
colnames(datedf)[1] <- "flightdate" #sets the column name 
colnames(datedf)

#Error
#separate(datedf,"flightdate",sep = "/") #Error in simplifyPieces(pieces, n, fill == "left") : argument "into" is missing, with no default
#separate(datedf,flightdate,sep = "/")
#separate(datedf,flightdate,month,date,year,sep = "/")

separate(datedf,"flightdate",into="month,date,year",sep = "-")
separate(datedf,"flightdate",c("month,date,year"),sep = "\\-")

seperatedatedf<-separate(datedf,"flightdate",c("year","month","day"),sep = "-") #seperate column into individual columns based on seperator

airplane<-cbind(airplane,seperatedatedf) #add 1 dataframe to other
colnames(airplane)

#Error
# hist(airplane) #Error in hist.default(airplane) : 'x' must be numeric
# hist(airplane['year']) #Error in `[.data.frame`(airplane, "year") : undefined columns selected
# hist(as.numeric(airplane['year']))
# airplane['year']

plot(airplane$year,airplane$Fatalities)
 plot(airplane$month,airplane$Fatalities)
 plot(airplane$day,airplane$Fatalities)
 plot(airplane$year,airplane$Fatalities,xlab = "Year", ylab = "Fatalities", main = "Fatalities with respect to Year", las =1)
# plot(airplane$month,airplane$Fatalities,xlab = "Month", ylab = "Fatalities", main = "Fatalities with respect to Month", las =1)
# axis(side = 1,at=c(1,2,3,4,5,6,7,8,9,10,11,12),labels = c("J","F","M","A","Ma","Jun","Jul","Aug","Sep","Oc","N","D"))
# plot(airplane$month,airplane$Fatalities,xlab = "Month", ylab = "Fatalities", main = "Fatalities with respect to Month", las =1,xaxt='n')
# axis(side = 1,at=c(1,2,3,4,5,6,7,8,9,10,11,12),labels = c("J","F","M","A","Ma","Jun","Jul","Aug","Sep","Oc","N","D"))
# axis(side = 1,at=c(1,2,3,4,5,6,7,8,9,10,11,12),labels = c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sept","Oct","Nov","Dec"))
# plot(airplane$month,airplane$Fatalities,xlab = "Month", ylab = "Fatalities", main = "Fatalities with respect to Month", las =1,xaxt='n')
# axis(side = 1,at=c(1,2,3,4,5,6,7,8,9,10,11,12),labels = c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sept","Oct","Nov","Dec"))
# plot(airplane$month,airplane$Fatalities,xlab = "Month", ylab = "Fatalities", main = "Fatalities with respect to Month", las =1,xaxt='n')
# axis(side = 1,at=c(1,2,3,4,5,6,7,8,9,10,11,12),labels = c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sept","Oct","Nov","Dec"))
# axis(side = 1,at=c(1,2,3,4,5,6,7,8,9,10,11,12),labels = c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"))
# plot(airplane$month,airplane$Fatalities,xlab = "Month", ylab = "Fatalities", main = "Fatalities with respect to Month", las =1,xaxt='n')
# axis(side = 1,at=c(1,2,3,4,5,6,7,8,9,10,11,12),labels = c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sept","Oct","Nov","Dec"))
# axis(side = 1,at=c(1,2,3,4,5,6,7,8,9,10,11,12),labels = c(1,2,3,4,5,6,7,8,9,10,11,12))
# plot(airplane$month,airplane$Fatalities,xlab = "Month", ylab = "Fatalities", main = "Fatalities with respect to Month", las =1,xaxt='n')
# axis(side = 1,at=c(1,2,3,4,5,6,7,8,9,10,11,12),labels = c(1,2,3,4,5,6,7,8,9,10,11,12))
# axis(side = 1,at=c(1,2,3,4,5,6,7,8,9,10,11,12),labels = c("Jan","Feb","Mar","Apr","May","Jun","July","Aug","Sept","Oct","Nov","Dec"))
# plot(airplane$month,airplane$Fatalities,xlab = "Month", ylab = "Fatalities", main = "Fatalities with respect to Month", las =1,xaxt='n')
# axis(side = 1,at=c(1,2,3,4,5,6,7,8,9,10,11,12),labels = c("Jan","Feb","Mar","Apr","May","Jun","July","Aug","Sept","Oct","Nov","Dec"))
# axis(side = 1,at=c(1,2,3,4,5,6,7,8,9,10,11,12),labels = c(1,2,3,4,5,6,7,8,9,10,11,12))
# plot(airplane$month,airplane$Fatalities,xlab = "Month", ylab = "Fatalities", main = "Fatalities with respect to Month", las =1,xaxt='n')
# axis(side = 1,at=c(1,2,3,4,5,6,7,8,9,10,11,12),labels = c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"))
# plot(airplane$month,airplane$Fatalities,xlab = "Month", ylab = "Fatalities", main = "Fatalities with respect to Month", las =1,xaxt='n')
# axis(side = 1,at=c(1,2,3,4,5,6,7,8,9,10,11,12),labels = c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"),cex.axis=0.35)
# plot(airplane$month,airplane$Fatalities,xlab = "Month", ylab = "Fatalities", main = "Fatalities with respect to Month", las =1,xaxt='n')
# axis(side = 1,at=c(1,2,3,4,5,6,7,8,9,10,11,12),labels = c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"),cex.axis=0.6)
# plot(airplane$month,airplane$Fatalities,xlab = "Month", ylab = "Fatalities", main = "Fatalities with respect to Month", las =1,xaxt='n')
# axis(side = 1,at=c(1,2,3,4,5,6,7,8,9,10,11,12),labels = c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"),cex.axis=0.9)
# plot(airplane$month,airplane$Fatalities,xlab = "Month", ylab = "Fatalities", main = "Fatalities with respect to Month", las =1,xaxt='n')
# axis(side = 1,at=c(1,2,3,4,5,6,7,8,9,10,11,12),labels = c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"),cex.axis=0.99)
# plot(airplane$month,airplane$Fatalities,xlab = "Month", ylab = "Fatalities", main = "Fatalities with respect to Month", las =1,xaxt='n')
# axis(side = 1,at=c(1,2,3,4,5,6,7,8,9,10,11,12),labels = c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"),cex.axis=0.97)
# plot(airplane$month,airplane$Fatalities,xlab = "Month", ylab = "Fatalities", main = "Fatalities with respect to Month", las =1,xaxt='n',type = "l")
# barplot(airplane$month,airplane$Fatalities,xlab = "Month", ylab = "Fatalities", main = "Fatalities with respect to Month", las =1,xaxt='n',type = "l")
# rf <- colorRampPalette(rev(brewer.pal(40,'Set3')))
# hexbinplot(airplane$year~airplane$Fatalities, data=airplane,colramp=rf)

# hexbinplot(airplane$year~airplane$Fatalities, data=airplane,colramp=rf)
# rf <- colorRampPalette(rev(brewer.pal(40,'Set3')))
# hexbinplot(airplane$year~airplane$Fatalities, data=airplane,colramp=rf)
# a=hexbin(airplane$year,airplane$Fatalities,xbins=40)
# plot(a)

# rf <- colorRampPalette(rev(brewer.pal(40,'Set3')))
# hexbinplot(airplane$year~airplane$Fatalities, data=airplane,colramp=rf)
# a=hexbin(airplane$year,airplane$Fatalities,xbins=20)
# plot(a)
# a=hexbin(airplane$year,airplane$Fatalities,xbins=30)
# plot(a)
# rf <- colorRampPalette(rev(brewer.pal(10,'Set3')))
# hexbinplot(airplane$year~airplane$Fatalities, data=airplane,colramp=rf)
# a=hexbin(airplane$year,airplane$Fatalities,xbins=30,,xlab = "Year", ylab = "Fatalities", main = "Fatalities with respect to Year", las =1,xaxt='n')
# a=hexbin(airplane$year,airplane$Fatalities,xbins=30,,xlab = "Year", ylab = "Fatalities",main = "Fatalities with respect to Year", las =1,xaxt='n')
# a=hexbin(airplane$year,airplane$Fatalities,xbins=30,,xlab = "Year", ylab = "Fatalities", las =1,xaxt='n')
# a=hexbin(airplane$year,airplane$Fatalities,xbins=30,,xlab = "Year", ylab = "Fatalities",xaxt='n')
# a=hexbin(airplane$year,airplane$Fatalities,xbins=30,,xlab = "Year", ylab = "Fatalities")
# plot(a)
# showMethods('plot', class="hexbin", includeDefs=TRUE)
# plot(a, legend=1)
# plot(a, legend=1.5)
# plot(a, legend=2)
# plot(a, legend=0.5)
# plot(a, legend=1.5)
# show(a)
# plot(a,legend(ysize=0.5))
# grid.hexlegend(ysize = 0.6)
# grid.hexlegend(maxcnt = 200,ysize = 0.6)
# plot(a,par.settings = list(par.xlab.text=list(cex=1.5)))
# a=hexbin(airplane$year,airplane$Fatalities,xbins=30,xlab = "Year", ylab = "Fatalities",par.settings = list(par.xlab.text=list(cex=1.5)))
# a=hexbin(airplane$year,airplane$Fatalities,xbins=30,xlab = "", ylab = "")
# plot(a)
# a=hexbin(airplane$year,airplane$Fatalities,xbins=30,xlab = "Year", ylab = "Fatalities")
# a=hexbin(airplane$year,airplane$Fatalities,xbins=30,xlab = "Year", ylab = "Fatalities")
# plot(a)
# a=hexbin(airplane$year,airplane$Fatalities,xbins=30,xlab = "Year", ylab = "Fatalities",xlab.cex=1.5)

# P <- plot(a, style="lattice", legend=FALSE,minarea=1, maxarea=1, border="white")
# P <- plot(a, style="lattice", legend=TRUE,minarea=1, maxarea=1, border="white")
# P <- plot(a, style="lattice", legend=FALSE,minarea=1, maxarea=1, border="white")
# pushHexport(P$plot.vp)
# xy <- hcell2xy(a)
# grid.points(x,y,pch=18,gp=gpar(cex=.3,col="green"))
# grid.points(airplane$year,airplane$Fatalities,pch=18,gp=gpar(cex=.3,col="green"))
# grid.text(as.character(bin@count), xy$x,xy$y,gp=gpar(cex=0.3, col="red"),default.units="native")
# a=hexbin(airplane$year,airplane$Fatalities,xbins=30,,xlab = "Year", ylab = "Fatalities")
# a=hexbin(airplane$year,airplane$Fatalities,xbins=30,,xlab = "Year", ylab = "Fatalities")
# plot(a)
# rf <- colorRampPalette(rev(brewer.pal(40,'Set3')))
# hexbinplot(airplane$year~airplane$Fatalities, data=airplane,colramp=rf)
# hexbinplot(airplane$year~airplane$Fatalities,colramp=rf)
# hexbinplot(airplane$year,airplane$Fatalities,colramp=rf)
# hexbinplot(a)
# plot(hexbinplot(a))
# #airplane[2:]
# #airplane[2:,] 
# airplane[2]
# airplane[,2]
# airplane[[2]]
# airplane[2,]
# 
# hist(airplane$Operator)
# hist(airplane$Fatalities)
# ggplot(subset(fatalities,Location),aes(x=year,y=Fatalities,color=Location))+geom_point()
# ggplot(subset(Fatalities,Location),aes(x=year,y=Fatalities,color=Location))+geom_point()
# ggplot(subset(airplane$Fatalities,airplane$Location),aes(x=airplane$year,y=airplane$Fatalities,color=airplane$Location))+geom_point()
# airplane[5,]
# airplane[5:10,]
# ggplot(subset(airplane, Location %in% c("AtlantiCity, New Jersey","Potters Bar, England ")),aes(x=airplane$year,y=airplane$Fatalities,color=airplane$Location))+geom_point()
# ggplot(subset(airplane, Location %in% c("AtlantiCity, New Jersey","Potters Bar, England")),aes(x=year,y=Fatalities,color=Location))+geom_point()
# aggregate(Fatalities~Location,airplane,sum)
# #stores the commands to the text file
# #savehistory("~/rcomaands.txt")
