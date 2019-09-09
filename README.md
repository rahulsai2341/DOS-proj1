# Proj1

* Sai Rahul Kasula - 4561-7441, Sai Charan Kadari - 5174-9229
* To run code:  upzip file into a folder. In the folder, enter command: "mix run proj1.exs 100000 200000"
* Number of worker actors created - 11000. We found that ratio of CPU time to REAL time was highest for this value.  
* Batch_size depends on the given range and number of workers decided above.
* Result of running "mix run proj1.exs 100000 200000":- 
```102510 201 510

104260 260 401

105210 210 501

105264 204 516

105750 150 705

108135 135 801

110758 158 701

115672 152 761

116725 161 725

117067 167 701

118440 141 840

120600 201 600

123354 231 534

124483 281 443

125248 152 824

125433 231 543

125460 204 615 246 510

125500 251 500

126027 201 627

126846 261 486

129640 140 926

129775 179 725

131242 311 422

132430 323 410

133245 315 423

134725 317 425

135828 231 588

135837 351 387

136525 215 635

136948 146 938

140350 350 401

145314 351 414

146137 317 461

146952 156 942

150300 300 501

152608 251 608

152685 261 585

153436 356 431

156240 240 651

156289 269 581

156915 165 951

162976 176 926

163944 396 414

172822 221 782

173250 231 750

174370 371 470

175329 231 759

180225 225 801

180297 201 897

182250 225 810

182650 281 650

186624 216 864

190260 210 906

192150 210 915

193257 327 591

193945 395 491

197725 275 719
```

* Running time of the above problem:    
    ```
    real    0m2.854s
    user    0m6.344s
    sys     0m0.703s
    ```
* Largest solved number - 1000 to 20000000
Running time for this range:
    ```
    real    7m37.935s
    user    25m45.656s
    sys     1m27.281s
    ```

