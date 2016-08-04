### R code from vignette source 'geneNetBPvignette.Rnw'

###################################################
### code chunk number 1: geneNetBPvignette.Rnw:54-57
###################################################
require(geneNetBP)
prettyVersion <- packageDescription("geneNetBP")$Version
prettyDate <- format(Sys.Date())


###################################################
### code chunk number 2: A
###################################################
library(geneNetBP)


###################################################
### code chunk number 3: B (eval = FALSE)
###################################################
## library(RHugin) ## Needed for CG-BN implementation


###################################################
### code chunk number 4: dataset
###################################################
data(mouse)
head(mouse,n=3)


###################################################
### code chunk number 5: dataset
###################################################
data(hdl)
head(hdl,n=3)


###################################################
### code chunk number 6: dataset (eval = FALSE)
###################################################
## data(yeast)
## head(yeast,n=3)


###################################################
### code chunk number 7: A (eval = FALSE)
###################################################
## data(mouse)
## mousegeno<-mouse[,1:5]
## mousepheno<-mouse[,6:19]


###################################################
### code chunk number 8: B (eval = FALSE)
###################################################
## mouse.cgbn<-fit.gnbp(mousegeno,mousepheno,alpha = 0.1)
## ## plot method for graph objects
## plot(mouse.cgbn) 


###################################################
### code chunk number 9: dataset (eval = FALSE)
###################################################
## data(yeast)
## yeastgeno<-yeast[,1:12]
## yeastpheno<-yeast[,13:50]


###################################################
### code chunk number 10: E (eval = FALSE)
###################################################
## yeast.gnbp<-fit.gnbp(yeastgeno[,1:9], yeastpheno[,1:16],type="db",alpha=0.1)


###################################################
### code chunk number 11: E1 (eval = FALSE)
###################################################
## plot(yeast.gnbp)


###################################################
### code chunk number 12: F (eval = FALSE)
###################################################
## yeast.dbn<-fit.dbn(yeastgeno,yeastpheno)
## plot(yeast.dbn)


###################################################
### code chunk number 13: G (eval = FALSE)
###################################################
## yeast.dbn<-fit.dbn(yeastgeno,yeastpheno,method="mmhc")


###################################################
### code chunk number 14: I (eval = FALSE)
###################################################
## ## Fit the network
## yeast.dbn<-fit.dbn(yeastgeno,yeastpheno)
## ##Absorb evidence
## yeast.dbn.abs<-absorb.dbn(yeast.dbn,"COX10",matrix(c("-1","1"),ncol=2))


###################################################
### code chunk number 15: J (eval = FALSE)
###################################################
## ##load data
## data(yeast)
## ## get genotype and phenotype data
## yeastgeno<-yeast[,1:12]
## yeastpheno<-yeast[,13:50]
## ## Fit discrete network
## yeast.dbn<-fit.dbn(yeastgeno,yeastpheno)
## ## Absorb evidence
## yeast.dbn.abs<-absorb.dbn(yeast.dbn,"COX10",matrix(c("-1","1"),ncol=2))
## ## Plot the network
## plot(yeast.dbn.abs,ncol=2)


###################################################
### code chunk number 16: K (eval = FALSE)
###################################################
## plot.dbn(yeast.dbn.abs,y="FC",ncol=2)


###################################################
### code chunk number 17: J (eval = FALSE)
###################################################
## ## load data
## data(hdl)
## ##get the genotype and phenotype data
## hdlgeno<-hdl[,1:5]
## hdlpheno<-hdl[,6:15]


###################################################
### code chunk number 18: K (eval = FALSE)
###################################################
## ## create an empty vector for the blacklist
## blackL<-c()
## # fill in the forbidden edges. For example :"HDL"->"Nr1i3"
## for(i in 2:dim(hdlpheno)[2])
## blackL=rbind(blackL,cbind(colnames(hdlpheno)[1],colnames(hdlpheno)[i]))
## ## Form a list
## directed.forbidden <- vector("list", nrow(blackL))
## for (i in 1:nrow(blackL))
##   directed.forbidden[[i]] <- blackL[i,]
## 
## constraints<-list(directed=list(forbidden=directed.forbidden,
##                                 required=NULL), undirected=NULL)
## 
## ## Fit a CG-BN
## hdl.cgbn<-fit.gnbp(hdlgeno,hdlpheno,constraints=constraints,alpha=0.08)
## ## Plot the network
## plot(hdl.cgbn)


###################################################
### code chunk number 19: L (eval = FALSE)
###################################################
## ## Convert the RHugindomain to a graphNEL object
## bngraph<-RHugin::as.graph.RHuginDomain(hdl.cgbn$gp)


###################################################
### code chunk number 20: M (eval = FALSE)
###################################################
## ## discretize the data around median
## hdlpheno_dis<-hdlpheno
## for (i in 1:dim(hdlpheno)[2])
## {
##   hdlpheno_dis[which(hdlpheno[,i]>=median(hdlpheno[,i])),i]<-"1"
##   hdlpheno_dis[which(hdlpheno[,i]<median(hdlpheno[,i])),i]<-"-1"
##   hdlpheno_dis[,i]<-as.factor(hdlpheno_dis[,i])
## }
## ## fit dbn
## hdl.dbn<-fit.dbn(hdlgeno,hdlpheno_dis,graph=bngraph,learn ="FALSE")


###################################################
### code chunk number 21: I (eval = FALSE)
###################################################
##   ## Load the toy dataset
##   data(toy)
## ## Create a matrix of edges ("from (parent)", "to (child)")
## edgelist=data.frame(matrix(NA,ncol=2,nrow=10))
## edgelist[1,]<-cbind("Q1","X1")
## edgelist[2,]<-cbind("Q2","X1")
## edgelist[3,]<-cbind("Q2","X2")
## edgelist[4,]<-cbind("Q2","X4")
## edgelist[5,]<-cbind("X1","X2")
## edgelist[6,]<-cbind("Q3","X2")
## edgelist[7,]<-cbind("Q3","X3")
## edgelist[8,]<-cbind("X2","X5")
## edgelist[9,]<-cbind("X2","X6")
## edgelist[10,]<-cbind("X4","X6")
## ## label the columns
## colnames(edgelist)<-c("from","to")


