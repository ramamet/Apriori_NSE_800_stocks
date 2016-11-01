 
 #for Tatamotors corresponding to other stocks (800 companies)

```r
 >>  tata_rules<-apriori(data=dd, parameter=list(supp=0.05,conf = 0.25,minlen=2,maxlen=3), 
               appearance = list(default="lhs",rhs="TATAMOTORS=A+"))
 ```              
 ```r
 >> summary(tata_rules)
 ``` 
set of 52041 rules

rule length distribution (lhs + rhs):sizes
    2     3 
 1588 50453 

   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  2.000   3.000   3.000   2.969   3.000   3.000 

summary of quality measures:
    support          confidence          lift       
 Min.   :0.05053   Min.   :0.2500   Min.   :0.8278  
 1st Qu.:0.05170   1st Qu.:0.3439   1st Qu.:1.1387  
 Median :0.05405   Median :0.3741   Median :1.2388  
 Mean   :0.05723   Mean   :0.3706   Mean   :1.2271  
 3rd Qu.:0.05875   3rd Qu.:0.4008   3rd Qu.:1.3272  
 Max.   :0.19624   Max.   :0.5476   Max.   :1.8133  

mining info:
 data ntransactions support confidence
   dd          1702    0.05       0.25
   
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  inspect(sort(tata_rules, by='lift', decreasing = T)[1:10]) 

     lhs                              rhs             support    confidence
[1]  {HINDALCO=A+,TIMKEN=A+}       => {TATAMOTORS=A+} 0.05405405 0.5476190 
[2]  {HINDCOPPER=A+,ULTRACEMCO=A+} => {TATAMOTORS=A+} 0.06991774 0.5409091 
[3]  {JAICORPLTD=A+,TIMKEN=A+}     => {TATAMOTORS=A+} 0.05405405 0.5197740 
[4]  {ABAN=A+,KANORICHEM=A+}       => {TATAMOTORS=A+} 0.05287897 0.5172414 
[5]  {HINDALCO=A+,ECTICID=A+}      => {TATAMOTORS=A+} 0.05170388 0.5146199 
[6]  {HINDALCO=A+,HINDCOPPER=A+}   => {TATAMOTORS=A+} 0.05170388 0.5116279 
[7]  {COSMOFILMS=A+,JAICORPLTD=A+} => {TATAMOTORS=A+} 0.05229142 0.5085714 
[8]  {BAJAJELEC=A+,HINDCOPPER=A+}  => {TATAMOTORS=A+} 0.05640423 0.5079365 
[9]  {ABB=A+,HINDALCO=A+}          => {TATAMOTORS=A+} 0.05287897 0.5056180 
[10] {CESC=A+,HINDCOPPER=A+}       => {TATAMOTORS=A+} 0.06110458 0.5048544 
     lift    
[1]  1.813322
[2]  1.791104
[3]  1.721119
[4]  1.712733
[5]  1.704053
[6]  1.694145
[7]  1.684024
[8]  1.681922
[9]  1.674245
[10] 1.671716

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>> test1= subset(tata_rules, rhs %in% c("TATASTEEL=A+","TATASTEEL=B+","TATAPOWER=A+","TATAPOWER=B+"))
> inspect(sort(test1, by='lift', decreasing = T)[1:10])
     lhs                             rhs             support    confidence
[1]  {EVERESTIND=A+,TATASTEEL=A+} => {TATAMOTORS=A+} 0.05757932 0.5025641 
[2]  {HIRECT=A-,TATASTEEL=A+}     => {TATAMOTORS=A+} 0.05052879 0.5000000 
[3]  {TATASTEEL=A+,ULTRACEMCO=A+} => {TATAMOTORS=A+} 0.06933020 0.4796748 
[4]  {KTKBANK=A+,TATASTEEL=A+}    => {TATAMOTORS=A+} 0.05757932 0.4734300 
[5]  {DRREDDY=A+,TATASTEEL=A+}    => {TATAMOTORS=A+} 0.07226792 0.4676806 
[6]  {TATASTEEL=A+,TIMKEN=A+}     => {TATAMOTORS=A+} 0.05757932 0.4622642 
[7]  {ALBK=A+,TATAPOWER=A+}       => {TATAMOTORS=A+} 0.06286722 0.4612069 
[8]  {TATASTEEL=A+,VOLTAS=A+}     => {TATAMOTORS=A+} 0.05287897 0.4591837 
[9]  {JKPAPER=A+,TATASTEEL=A+}    => {TATAMOTORS=A+} 0.05934195 0.4590909 
[10] {HINDCOPPER=A+,TATAPOWER=A+} => {TATAMOTORS=A+} 0.05405405 0.4577114 
     lift    
[1]  1.664132
[2]  1.655642
[3]  1.588340
[4]  1.567661
[5]  1.548623
[6]  1.530688
[7]  1.527187
[8]  1.520488
[9]  1.520180
[10] 1.515613

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>> test2= subset(tata_rules, (lhs %in% "TATASTEEL=A+")  & (lhs %in% "TATAPOWER=A+"))
>> inspect(sort(test2, by='lift', decreasing = T))  

    lhs                            rhs             support    confidence
[1] {TATAPOWER=A+,TATASTEEL=A+} => {TATAMOTORS=A+} 0.05757932 0.4206009 
    lift    
[1] 1.392729

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>> test3= subset(tata_rules, (lhs %in% "TATASTEEL=A+")  & (lhs %in% "TCS=A+"))
>> inspect(sort(test3, by='lift', decreasing = T)) 

    lhs                      rhs             support   confidence lift   
[1] {TATASTEEL=A+,TCS=A+} => {TATAMOTORS=A+} 0.0640423 0.436      1.44372

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>> test4= subset(tata_rules, (lhs %in% "TATAPOWER=A+")  & (lhs %in% "TCS=A+"))
>> inspect(sort(test4, by='lift', decreasing = T))   

    lhs                      rhs             support    confidence lift    
[1] {TATAPOWER=A+,TCS=A+} => {TATAMOTORS=A+} 0.06227967 0.384058   1.271725

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



          
