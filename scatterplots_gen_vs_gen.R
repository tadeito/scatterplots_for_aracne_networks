#####################################################################
## xy scatterplot with R                                        #####
#####################################################################

setwd("/mnt/e/tadeo")
library("ggplot2", lib.loc="/home/tadeo/R/libs")

          #load exp.matrix
read.table("aracne/matrices_by_subtype/mexp_sanos_geneonly",
  ,stringsAsFactors=FALSE, header=TRUE, row.names=1, sep="\t")->sanos
sanos<-t(sanos)
sanos<-as.data.frame(sanos)
          #load top sorted list
read.table("aracne/sanos/sanos_sif.txt", header=TRUE, sep="\t", stringsAsFactors=FALSE)->sanos_toplist
#sort the list in descending order and subset the top n interactions
sanos_toplist<- sanos_toplist[rev(order(sanos_toplist$weight)),]
#sanos_top10<-sanos_toplist[1:10,]
#sanos_top50<-sanos_toplist[1:50,]
sanos_top100<-sanos_toplist[1:100,]

          #make the plots

pdf("scatterplots__sanos_top100.pdf")
for(i in seq_along(sanos_top100$from))
{
    print(
          ggplot(sanos, aes(x=sanos[,print(sanos_top100[i,1])], y=sanos[,print(sanos_top100[i,2])]))+
            geom_point(color="blue",alpha=0.3)+
            xlab(paste(sanos_top100[i,1]))+
            ylab(paste(sanos_top100[i,2]))+
            ggtitle(paste("Valores de expresión conjunta MI=",sanos_top100[i,3],"top",i))
            )
}
dev.off()
