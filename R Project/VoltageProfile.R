# VoltageProfile.R is a script to generate plots showing voltage across multiple nodes at a given time
# These plots were used for analyzing conduction block in the following paper
# Bhadra, N., & Kilgore, K. (2004). Direct Current Electrical Conduction Block of 
#   Peripheral Nerve. IEEE Transactions on Neural Systems and Rehabilitation Engineering, 
#   12(3), 313–324. doi: 10.1109/tnsre.2004.834205
#
# https://www.ncbi.nlm.nih.gov/pubmed/15473193

# load the library needed for generating the plot
library(ggplot2)

# load usefulFunctions used in numerous analysis repositories
# originally created for use with the Nerve-Block-Modeling Repository
# https://github.com/joey-kilgore/Nerve-Block-Modeling
source("UsefulFunctions.R")

# load any constants defined for this particular run (especially where the data set is located)
source("defs.R")

voltageProfile <- function(t=10000){
  # voltageProfile generates a plot showing the voltage of all 101 nodes in the current model 
  #   used in the Nerve-Block-Modeling Repository
  # https://github.com/joey-kilgore/Nerve-Block-Modeling
  # t is the row of the csv files that will be shown
  
  DATA <- getDataAllDF(getDataFolder()) # load the data
  
  x <- seq(1,101,by=1)  # create vector of node indices
  vData <- as.vector(unlist(DATA[t,x+203])) # vector of voltage data
  
  plot <- ggplot() + geom_path(aes(x=x,y=vData), color="black", size=.5)+
              geom_point(aes(x=x,y=vData), color="black",size=2)+
              xlab("Node")+ylab("Voltage")+
              xlim(1,101)+ylim(-120,60)+
              ggtitle(sprintf("Voltage Profile @t=%f",DATA[t,1]))
  plot
}