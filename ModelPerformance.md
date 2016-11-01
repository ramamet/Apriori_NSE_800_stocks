
```r
>>inspect(sort(rules, by='lift', decreasing = T)[1:10])  
``` 

     lhs                            rhs            support   confidence
[1]  {IL.FSTR=B+}                => {IL.FSENGG=B+} 0.1069330 1         
[2]  {IL.FSENGG=B+}              => {IL.FSTR=B+}   0.1069330 1         
[3]  {IL.FSENGG=B-}              => {IL.FSTR=B-}   0.1163337 1         
[4]  {IL.FSTR=B-}                => {IL.FSENGG=B-} 0.1163337 1         
[5]  {IL.FSENGG=A+}              => {IL.FSTR=A+}   0.2508813 1         
[6]  {IL.FSTR=A+}                => {IL.FSENGG=A+} 0.2508813 1         
[7]  {IL.FSENGG=A+,POLYPLEX=A-}  => {IL.FSTR=A+}   0.1016451 1         
[8]  {IL.FSTR=A+,POLYPLEX=A-}    => {IL.FSENGG=A+} 0.1016451 1         
[9]  {IL.FSENGG=A+,SEAMECLTD=A-} => {IL.FSTR=A+}   0.1004700 1         
[10] {IL.FSTR=A+,SEAMECLTD=A-}   => {IL.FSENGG=A+} 0.1004700 1         
     lift    
[1]  9.351648
[2]  9.351648
[3]  8.595960
[4]  8.595960
[5]  3.985948
[6]  3.985948
[7]  3.985948
[8]  3.985948
[9]  3.985948
[10] 3.985948

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  inspect(sort(nserules, by='lift', decreasing = T)[1:20])

     lhs                         rhs             support   confidence lift    
[1]  {nifty=A+,IL.FSENGG=A+}  => {IL.FSTR=A+}    0.1245593 1.0000000  3.985948
[2]  {nifty=A+,IL.FSTR=A+}    => {IL.FSENGG=A+}  0.1245593 1.0000000  3.985948
[3]  {nifty=A+,IL.FSENGG=A-}  => {IL.FSTR=A-}    0.1186839 1.0000000  3.859410
[4]  {nifty=A+,IL.FSTR=A-}    => {IL.FSENGG=A-}  0.1186839 1.0000000  3.859410
[5]  {nifty=A+,M.M=A-}        => {M.MFIN=A-}     0.1480611 1.0000000  2.870152
[6]  {nifty=A+,M.MFIN=A-}     => {M.M=A-}        0.1480611 1.0000000  2.870152
[7]  {nifty=A+,M.M=A+}        => {M.MFIN=A+}     0.1944771 1.0000000  2.642857
[8]  {nifty=A+,M.MFIN=A+}     => {M.M=A+}        0.1944771 1.0000000  2.642857
[9]  {nifty=A+,JAICORPLTD=A+} => {RIIL=A+}       0.1304348 0.7474747  2.235856
[10] {nifty=A+,ALBK=A+}       => {SYNDIBANK=A+}  0.1227967 0.6201780  2.132410
[11] {nifty=A+,STCINDIA=A+}   => {HINDCOPPER=A+} 0.1233843 0.6250000  2.127500
[12] {nifty=A+,RIIL=A+}       => {JAICORPLTD=A+} 0.1304348 0.5427873  2.118862
[13] {nifty=A+,HINDCOPPER=A+} => {STCINDIA=A+}   0.1233843 0.6422018  2.077999
[14] {nifty=A+,ANDHRABANK=A+} => {SYNDIBANK=A+}  0.1198590 0.5947522  2.044986
[15] {nifty=A+,SYNDIBANK=A+}  => {ALBK=A+}       0.1227967 0.6183432  2.008435
[16] {nifty=A+,HERCULES=A+}   => {ATLASCYCLE=A+} 0.1022327 0.5403727  1.995042
[17] {nifty=A+,ATLASCYCLE=A+} => {HERCULES=A+}   0.1022327 0.5918367  1.971245
[18] {nifty=A+,SYNDIBANK=A+}  => {ANDHRABANK=A+} 0.1198590 0.6035503  1.938194
[19] {nifty=A+,BANKINDIA=A+}  => {SYNDIBANK=A+}  0.1122209 0.5601173  1.925898
[20] {nifty=A+,ORIENTBANK=A+} => {BANKINDIA=A+}  0.1016451 0.5945017  1.923654

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


