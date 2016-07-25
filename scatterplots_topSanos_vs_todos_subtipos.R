#####################################################################
## xy scatterplot for contrasts (healthy vs tumor subtype) with R                                        #####
#####################################################################

setwd("/mnt/e/tadeo")
library("ggplot2", lib.loc="/home/tadeo/R/libs")

          #load exp.matrix
read.table("aracne/matrices_by_subtype/mexp_sanos_geneonly",
  ,stringsAsFactors=FALSE, header=TRUE, row.names=1, sep="\t")->sanos
sanos<-t(sanos)
sanos<-as.data.frame(sanos)

LumA<-read.table("aracne/matrices_by_subtype/mexp_LumA_geneonly",
  ,stringsAsFactors=FALSE, header=TRUE, row.names=1, sep="\t")
LumA<-t(LumA)
LumA<-as.data.frame(LumA)

LumB<-read.table("aracne/matrices_by_subtype/mexp_LumB_geneonly",
  ,stringsAsFactors=FALSE, header=TRUE, row.names=1, sep="\t")
LumB<-t(LumB)
LumB<-as.data.frame(LumB)

Her2<-read.table("aracne/matrices_by_subtype/mexp_Her2_geneonly",
  ,stringsAsFactors=FALSE, header=TRUE, row.names=1, sep="\t")
Her2<-t(Her2)
Her2<-as.data.frame(Her2)

Basal<-read.table("aracne/matrices_by_subtype/mexp_Basal_geneonly",
  ,stringsAsFactors=FALSE, header=TRUE, row.names=1, sep="\t")
Basal<-t(Basal)
Basal<-as.data.frame(Basal)

          #load top sorted list
sanos_toplist<-read.table("aracne/sanos/sanos_sif.txt", header=TRUE, sep="\t", stringsAsFactors=FALSE)
#sort the list in descending order and subset the top n interactions
sanos_toplist<- sanos_toplist[rev(order(sanos_toplist$weight)),]
#sanos_top10<-sanos_toplist[1:10,]
#sanos_top50<-sanos_toplist[1:50,]
sanos_top100<-sanos_toplist[1:100,]

          #make the plots

pdf("scatterplots__Sanos_top100_vs_todos.pdf")
for(i in seq_along(sanos_top100$from))
{
    print(
      ggplot()+
        geom_point(data = sanos, aes(x=sanos[,print(sanos_top100[i,1])], y=sanos[,print(sanos_top100[i,2])],colour="sanos",alpha=0.3))+
        geom_point(data = LumA, aes(x=LumA[,print(sanos_top100[i,1])], y=LumA[,print(sanos_top100[i,2])],colour="LumA",alpha=0.3))+
        geom_point(data = LumB, aes(x=LumB[,print(sanos_top100[i,1])], y=LumB[,print(sanos_top100[i,2])],colour="LumB",alpha=0.3))+
        geom_point(data = Her2, aes(x=Her2[,print(sanos_top100[i,1])], y=Her2[,print(sanos_top100[i,2])],colour="Her2",alpha=0.3))+
        geom_point(data = Basal, aes(x=Basal[,print(sanos_top100[i,1])], y=Basal[,print(sanos_top100[i,2])],colour="Basal",alpha=0.3))+
        xlab(paste(sanos_top100[i,1]))+
        ylab(paste(sanos_top100[i,2]))+
        ggtitle(paste("Valores de expresión conjunta MI=",sanos_top100[i,3],"top",i))
            )
}
dev.off()
