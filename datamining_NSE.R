#+++++++++++++++++++++++++++++++++++++++++++++++++++++
# Data mining of National Stock Exhange (NSE), India data from yahoofinance
# Cleaning and processing of large data

#Author: Ramanathan Perumal
#Mail: ramamet4@gmail.com
#Modified: 30/10/2016

#++++++++++++++++++++++++++++++++++++++++++++++++++++
#Library
library(lubridate)
library(ggplot2)
library(quantmod)
library(reshape2)
library(RColorBrewer)
library(arules)
library(dplyr)
library(arulesViz)
library(colorspace)
library(readxl)

#timeline
START=c("2010-01-01")
END=c("2016-10-25")

   #NSEscreener.xlsx
   df0=read_excel("sector/NSEscreener.xlsx")
   df=data.frame(df0)
   df=mutate(df,id=paste0(Symbol,".NS",sep=""))
   df=na.omit(df)
   df[,11]=as.numeric(as.character(df[,11]))
   df=filter(df,Market.Cap>0)
   df=filter(df,Close>50)
   
   #data cleaning
   
   df1=filter(df,Symbol!="BAJAJ-AUTO")
   df1=filter(df1,Symbol!="MCDOWELL-N")
   df1=filter(df1,Symbol!="MRO-TEK")
   df1=filter(df1,Symbol!="PRECWIRE")
   df1=filter(df1,Symbol!="SOLARINDS")
   df1=filter(df1,Symbol!="VIVIMEDLAB")
   df1=filter(df1,Symbol!="WELSPUNIND")
   
   
  #NIFTY data collection
  getSymbols("^NSEI",from=START,to=END,adjust=TRUE)
  nifty <- (Cl(get("NSEI")))
  #nifty=nifty[-(1:15),]
  nifty <- data.frame(Date=as.POSIXct(index(nifty)), nifty)
  nifty$Date= as.Date(nifty$Date)
  rownames(nifty)=NULL
  colnames(nifty)[2]="nifty"
  
  #+++++++++++++++++++++++++++++++++++++++
  #df2=df1[1:10,]
  df2=df1
  symbols=df2$id
  getSymbols(symbols[1:length(symbols)],from=START,to=END,adjust=TRUE)
  
  prices0 <- (Cl(get(symbols[1])))
    
    for(i in 2:length(symbols))
    prices0 <- merge(prices0,(Cl(get(symbols[i]))))   
    colnames(prices0) <- symbols
    df <- data.frame(Date=as.POSIXct(index(prices0)), prices0)
    df$Date= as.Date(df$Date)
    colnames(df)=gsub(".NS","",colnames(df))
    rownames(df)=NULL
    #df=df[-(1:15),]
    
    #+++++++++++++
    ram=merge(nifty,df,id="Date")
    
    dff=ram[,-1]
    #dff= ram
    
    # Groupwise naming of profit/loss % calculation
    
    #Loss %
    # 0  to -2  ==> A-
    # -2 to -4  ==> B-
    # -4 to -20 ==> C-
    
    #Gain %
    #  0 to +2  ==> A+
    # +2 to +4  ==> B+
    # +4 to +20 ==> C+
       
     grouping <- function(x)
	   {
	    ifelse((x < 0)  & (x > -2) , "A-",
	    ifelse((x < -2) & (x > -4) , "B-",
	    ifelse((x < -4) & (x > -20), "C-",
	    ifelse((x <  2) & (x >  0),  "A+",
	    ifelse((x <  4) & (x >  2),  "B+",
	    ifelse((x <  20) & (x >  4), "C+",
	    "NC"))))))
	   }
	   
   
   
    #dt=apply(dff,2,function(x) {x-lag(x)})
    dt=apply(dff,2,function(x) {round(((x-lag(x))*(100/x)),2)})
    dt1=data.frame(dt)
    dt1=dt1[-1,]
    dtt <- lapply(dt1, grouping)    
    dtt=data.frame(dtt)
    sarmi=cbind(ram[(-1),1],dtt)
    colnames(sarmi)[1]="Date"
    
    # save output
    write.csv(sarmi, file = "save.csv",row.names=TRUE)
   
