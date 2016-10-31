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

     
     df=read.csv("save.csv")


 
     vik=df[,-(1:2)]
     
     #convert dataframe to transactions format
     dd <- as(vik, "transactions") 
      
   
   # create rules with certain minimum score conditions
   rules <- apriori(dd,
                 parameter = list(support=0.1,
                                  confidence=0.25,
                                  minlen=2,
                                  maxlen=3,
                                  target='rules' # to mine for rules
                                  ))
                                  
        inspect(sort(rules, by='lift', decreasing = T)[1:5])                           
          

       svg("myLift.svg",width=20,height=16)
       plot(head(sort(rules, by="lift"), 50),
            method="graph", control=list(cex=1.5))     
       dev.off()     
            
       svg("mySupport.svg",width=20,height=16)    
       plot(head(sort(rules, by="support"), 50),
            method="graph",shading = "lift", control=list(cex=1.5))
        dev.off()  
                                
       svg("myConf.svg",width=20,height=16)    
       plot(head(sort(rules, by="confidence"), 50),
            method="graph",shading = "lift", control=list(cex=1.5))
        dev.off()                 
    
    nserules= subset(rules, lhs %in% "nifty=A+")
    inspect(sort(nserules, by='lift', decreasing = T)[1:5])
     
    plot(head(sort(nserules),40), method = "graph", control = list(type ="items"))
    
    
    #for Tatamotors                              
    tata_rules<-apriori(data=dd, parameter=list(supp=0.05,conf = 0.25,minlen=2,maxlen=3), 
               appearance = list(default="lhs",rhs="TATAMOTORS=A+"))
                                      
    
    inspect(sort(tata_rules, by='lift', decreasing = T)[1:5])  
   
   
    test1= subset(tata_rules, lhs %in% c("TATASTEEL=A+","TATASTEEL=B+","TATAPOWER=A+","TATAPOWER=B+"))
    #test1= subset(rules, rhs %in% c("nifty=B+"))
    inspect(sort(test1, by='lift', decreasing = T)[1:5])
    
    # both tatapower, tatasteel and tcs are up, tatamotor is also up
    test2= subset(tata_rules, (lhs %in% "TATASTEEL=A+")  & (lhs %in% "TATAPOWER=A+"))
    inspect(sort(test2, by='lift', decreasing = T)[1:5])   
    
    test3= subset(tata_rules, (lhs %in% "TATASTEEL=A+")  & (lhs %in% "TCS=A+"))
    inspect(sort(test3, by='lift', decreasing = T))   
    
    test4= subset(tata_rules, (lhs %in% "TATAPOWER=A+")  & (lhs %in% "TCS=A+"))
    inspect(sort(test4, by='lift', decreasing = T))   

    #plot(head(sort(tata_rules),20), method = "grouped", control = list(k= 20))

     
    
  