## 1/21 AL Copied from R smoking and betacarotine in OLAF
## iris data set gives the measurements in centimeters of the variables sepal length, sepal width, petal length and petal width, respectively, for 50 flowers from each of 3 species of iris. The species are Iris setosa, versicolor, and virginica.
##two-tailed hypothesis question for difference of two means
##ask students to compare sepal length of the Setosa and Virginica species

rm(list=ls(all=TRUE)) 
search()

#setwd("/home/alamont/Dropbox/otago university/2021/summer school stat110")
#setwd("C:/Users/mdrysdale/Dropbox/STATS/2020/OLAF_questions/210125IrisPetalLength")

data("iris")
head(iris)

n<-50 # size of simulated datasets
reps<-400 # number of unique reps

Sepal_Length<-Sepal_Width<-Petal_Length<-Petal_Width<-Species<-matrix(NA,n,reps)

MeanSL<-size<-VarSL<-MeanSL_Se<-MeanSL_Vi<-MeanSL_Ve<-VarSL_Se<-VarSL_Vi<-VarSL_Ve<-Length_Se<-Length_Vi<-Length_Ve<-nu<-rep(NA,reps)
for(i in 1:reps){
   ind<-sample(1:length(iris$Sepal.Length),size = n,replace=FALSE)
   
   Sepal_Length[,i]<-iris$Sepal.Length[ind]
   Sepal_Width[,i]<-iris$Sepal.Width[ind]
   Petal_Length[,i]<-iris$Petal.Length[ind]
   Petal_Width[,i]<-iris$Petal.Width[ind]
   Species[,i]<-iris$Species[ind]
   
   MeanSL[i]<-mean(Sepal_Length[,i])
   size[i] <- n
   
   VarSL[i]<-var(Sepal_Length[,i])
 
   MeanSL_Se[i]<-mean(Sepal_Length[,i][which(Species[,i]=="1")])
   MeanSL_Vi[i]<-mean(Sepal_Length[,i][which(Species[,i]=="3")])
   MeanSL_Ve[i]<-mean(Sepal_Length[,i][which(Species[,i]=="2")])
   
   VarSL_Se[i]<-var(Sepal_Length[,i][which(Species[,i]=="1")])
   VarSL_Vi[i]<-var(Sepal_Length[,i][which(Species[,i]=="3")])
   VarSL_Ve[i]<-var(Sepal_Length[,i][which(Species[,i]=="2")])
   

   Length_Se[i]<-length(Sepal_Length[,i][which(Species[,i]=="1")])
   Length_Vi[i]<-length(Sepal_Length[,i][which(Species[,i]=="3")])
   Length_Ve[i]<-length(Sepal_Length[,i][which(Species[,i]=="2")])
   
   nu0<-(VarSL_Se[i]/Length_Se[i]+VarSL_Vi[i]/Length_Vi[i])^2
   nu1<-VarSL_Se[i]^2/(Length_Se[i]^2*(Length_Se[i]-1))
   nu2<-VarSL_Vi[i]^2/(Length_Vi[i]^2*(Length_Vi[i]-1))
   nu[i]<-nu0/(nu1+nu2) #Walch-Satterthwaite df of Se-Vi
}

########################################################
# build the data file to go in the assignment editor. R summary statistics and basic plotting

lines=(n+4)
out=rep('',lines*reps)
for(i in 1:reps){
   out[lines*(i-1)+1]='**Data'
   out[lines*(i-1)+2]='Sepal_Length\tSepal_Width\tPetal_Length\tPetal_Width\tSpecies'
   ro=lines*(i-1)+2
   for(j in 1:n){ro=ro+1;out[ro]=paste(Sepal_Length[j,i],Sepal_Width[j,i],Petal_Length[j,i],Petal_Width[j,i],Species[j,i],sep='\t')}
   out[lines*(i-1)+lines-1]='**Variables'
   out[lines*(i-1)+lines]=paste('MeanSL=',MeanSL[i],'\t',
                                'size=',size[i],'\t',
                                'VarSL=',VarSL[i],'\t',
                                'MeanSL_Se=',MeanSL_Se[i],'\t',
                                'MeanSL_Vi=',MeanSL_Vi[i],'\t',
                                'MeanSL_Ve=',MeanSL_Ve[i],'\t',
                                'VarSL_Se=',VarSL_Se[i],'\t',
                                'VarSL_Vi=',VarSL_Vi[i],'\t',
                                'VarSL_Ve=',VarSL_Ve[i],'\t',
                                'Length_Se=',Length_Se[i],'\t',
                                'Length_Vi=',Length_Vi[i],'\t',
                                'Length_Ve=',Length_Ve[i],'\t',
                                'DF_WS=',nu[i],'\t',
                                sep='')
}
write.table(out, file='irishtest.txt',row.names=F,col.names=F,quote=F)

#############
mydata<-read.table("irishtest_data_178.txt",header=TRUE)
head(mydata)

virginica_length<-iris$Sepal.Length[iris$Species=="virginica"]
setosa_length<-iris$Sepal.Length[iris$Species=="setosa"] 

sqrt(var(virginica_length)/length(virginica_length)+var(setosa_length)/length(virginica_length))

median(mydata$Sepal_Length[which(mydata$Species=="1")])
length(mydata$Sepal_Length[which(mydata$Species=="1")])
mean(mydata$Sepal_Length[which(mydata$Species=="1")])
