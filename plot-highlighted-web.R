library(bipartite)

# load network
network<-read.table("bees_flowers.txt", header=T)

#sort network by amount of interactions
network.ord<-sortweb(network, sort.order="dec", sequence=NULL)
#load list of species to be hightlighted 
highlight <- read.table("highlights.txt", header=T)

# check highlighted species and their interactions
interactions <- network.ord[,colnames(network.ord) %in% highlight$spp]
interactions <- rownames(interactions[rowSums(interactions) > 0,])

plotweb(network.ord, 
        method = "normal", 
        text.rot=90, 
        y.lim = c(-0.5,2.5), 
        col.high = (ifelse(colnames(network.ord) %in% highlight$spp, "red2", "darkgoldenrod1")),
        bor.col.high= NA,
        text.high.col = (ifelse(colnames(network.ord) %in% highlight$spp, "red2", "gray14")),
        col.low= (ifelse(rownames(network.ord) %in% interactions, "red2", "darkgreen")), 
        bor.col.low= NA,
        text.low.col = (ifelse(rownames(network.ord) %in% interactions, "red2", "gray14")),
        col.interaction = (ifelse(colnames(network.ord) %in% highlight$spp, "red2", "gray14")), 
        bor.col.interaction = NA)
