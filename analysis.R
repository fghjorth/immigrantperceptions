setwd("~/GitHub/immigrantperceptions")

dt<-read.csv(file="data.csv",sep=";",dec=".")

require(ggplot2)
png(filename="immbias.png",width=720)
ggplot(dt,aes(x=biaspts,y=reorder(cntry,biaspts))) +
  geom_point() +
  geom_point(aes(x=real,y=cntry),color="red") +
  geom_point(aes(x=perceived,y=cntry),color="blue") +
  ylab("") +
  xlab("Overestimation (percentage points)") +
  xlim(c(-5,40)) +
  geom_vline(xintercept=0,color="dark gray",linetype="dashed") +
  annotate("text",label="By @fghjorth, source: ESS, OECD", x=35, y=1,size=4) +
  theme_bw()
dev.off()

setwd("C:/Users/fh/Dropbox/Data")
require(foreign)

#read in spss data
ess1<-read.spss("ESS1/ESS1.sav",use.value.labels=T,to.data.frame=T)
ess1<-as.data.frame

esssum<-aggregate(noimbro~cntry,data=ess1,FUN="mean")

#plot perceived immigrants by country
require(ggplot2)
png(filename="immbias2.png")
ggplot(ess1,aes(x=noimbro,y=cntry)) +
  geom_jitter(alpha=.2) +
#  geom_point(esssum,aes(x=noimbro,y=cntry),color="red") +
  theme_bw()
dev.off()