#####################################################################
## xy scatterplot for contrasts (top MI differences by subtype vs all other subtypes) with R                                        #####
#####################################################################

setwd("/mnt/e/tadeo")
library("ggplot2")

          #load exp.matrices
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
LumA_toplist<-read.table("aracne/matrices_diferencia/dif_LumA_sif.txt", header=TRUE, sep="\t", stringsAsFactors=FALSE)
#sort the list in descending order and subset the top n interactions
LumA_toplist<- LumA_toplist[rev(order(LumA_toplist$weight)),]
#sanos_top10<-sanos_toplist[1:10,]
#sanos_top50<-sanos_toplist[1:50,]
LumA_top100up<-LumA_toplist[1:100,]
LumA_top100down<-tail(LumA_toplist,100)


          #make the plots


                #plots for interactions whose MI values went up the most
pdf("scatterplots__top100up_difMI_LumA_vs_todos.pdf")
for(i in seq_along(LumA_top100up$from))
{
    print(
      ggplot()+
        geom_point(data = sanos, aes(x=sanos[,print(LumA_top100up[i,1])], y=sanos[,print(LumA_top100up[i,2])],colour="sanos",alpha=0.3))+
        geom_point(data = LumA, aes(x=LumA[,print(LumA_top100up[i,1])], y=LumA[,print(LumA_top100up[i,2])],colour="LumA",alpha=0.3))+
        geom_point(data = LumB, aes(x=LumB[,print(LumA_top100up[i,1])], y=LumB[,print(LumA_top100up[i,2])],colour="LumB",alpha=0.3))+
        geom_point(data = Her2, aes(x=Her2[,print(LumA_top100up[i,1])], y=Her2[,print(LumA_top100up[i,2])],colour="Her2",alpha=0.3))+
        geom_point(data = Basal, aes(x=Basal[,print(LumA_top100up[i,1])], y=Basal[,print(LumA_top100up[i,2])],colour="Basal",alpha=0.3))+

        xlab(paste(LumA_top100up[i,1]))+
        ylab(paste(LumA_top100up[i,2]))+
        ggtitle(paste("Mayores diferencias de MI_LumA - MI_sanos=",LumA_top100up[i,3],"top",i))
            )
}
dev.off()

      #plots for interactions whose MI values went down the most
pdf("scatterplots__top100down_difMI_LumA_vs_todos.pdf")
for(i in seq_along(LumA_top100down$from))
{
    print(
      ggplot()+
        geom_point(data = sanos, aes(x=sanos[,print(LumA_top100down[i,1])], y=sanos[,print(LumA_top100down[i,2])],colour="sanos",alpha=0.3))+
        geom_point(data = LumA, aes(x=LumA[,print(LumA_top100down[i,1])], y=LumA[,print(LumA_top100down[i,2])],colour="LumA",alpha=0.3))+
        geom_point(data = LumB, aes(x=LumB[,print(LumA_top100down[i,1])], y=LumB[,print(LumA_top100down[i,2])],colour="LumB",alpha=0.3))+
        geom_point(data = Her2, aes(x=Her2[,print(LumA_top100down[i,1])], y=Her2[,print(LumA_top100down[i,2])],colour="Her2",alpha=0.3))+
        geom_point(data = Basal, aes(x=Basal[,print(LumA_top100down[i,1])], y=Basal[,print(LumA_top100down[i,2])],colour="Basal",alpha=0.3))+

        xlab(paste(LumA_top100down[i,1]))+
        ylab(paste(LumA_top100down[i,2]))+
        ggtitle(paste("Mayores diferencias de MI_LumA - MI_sanos=",LumA_top100down[i,3],"top",i))
            )
}
dev.off()
