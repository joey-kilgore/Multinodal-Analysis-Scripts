# 3DVoltage.R is a script to generate 3D plots showing voltage over time for multiple nodes
# These plots were used for analyzing conduction block in the following paper
# Zhang, X., Roppolo, J., Groat, W. D., & Tai, C. (2005). 
#   Simulation Analysis of Nerve Block by High Frequency Biphasic Electrical Current 
#   Based on Frankenhaeuser-Huxley Model. 2005 IEEE Engineering in Medicine and Biology 
#   27th Annual Conference. doi: 10.1109/iembs.2005.1615402
#
# https://www.ncbi.nlm.nih.gov/pubmed/16200764

# This is the library needed for using scatter3D
library("plot3D")

# load usefulFunctions used in numerous analysis repositories
# originally created for use with the Nerve-Block-Modeling Repository
# https://github.com/joey-kilgore/Nerve-Block-Modeling
source("UsefulFunctions.R")

# load any constants defined for this particular run (especially where the data set is located)
source("defs.R")

voltagePlot3D <- function(t1=7900, t2=8500, DATA = getDataAllDF(getDataFolder())){
  # voltagePlot3D returns a 3d voltage plot showing the voltage of multiple nodes over time
  # The bounds t1 and t2 are the rows of the .csv files that show an example block at 40ms
  # with time step of .005ms (both of which are relatively standard with the Nerve-Blcok-Modeling Repo)
  
  #DATA <- getDataAllDF(getDataFolder()) # load data
  
  t <- DATA$Time[t1:t2] # create time vector
  
  # votlages are taken out of the main dataset (each 10 nodes apart)
  v1 <- DATA$V11[t1:t2]
  v2 <- DATA$V21[t1:t2]
  v3 <- DATA$V31[t1:t2]
  v4 <- DATA$V41[t1:t2]
  v5 <- DATA$V51[t1:t2]
  v6 <- DATA$V61[t1:t2]
  v7 <- DATA$V71[t1:t2]
  v8 <- DATA$V81[t1:t2]
  v9 <- DATA$V91[t1:t2]
  
  # X is used to sepearate each node
  x1 <- replicate(length(v1),1)
  x2 <- replicate(length(v1),2)
  x3 <- replicate(length(v1),3)
  x4 <- replicate(length(v1),4)
  x5 <- replicate(length(v1),5)
  x6 <- replicate(length(v1),6)
  x7 <- replicate(length(v1),7)
  x8 <- replicate(length(v1),8)
  x9 <- replicate(length(v1),9)
  
  # combine the smaller vectors into giant vectors because we can not stack multiple different scatter3D
  #   plots on top of one another (like with ggplot)
  V <- c(v1,v2,v3,v4,v5,v6,v7,v8,v9)
  TIME <- c(t,t,t,t,t,t,t,t,t)
  X <- c(x1,x2,x3,x4,x5,x6,x7,x8,x9)
  
  
  plot <- scatter3D(X,TIME,V,
                    xlab="Node", ylab="Time (ms)", zlab="Voltage (mV)", box=FALSE,
                    phi=30, theta=75, zlim=c(-65,350))
  # phi, theta, and zlim were all chosen to closer represent the figures shown in the paper referenced above
  return(plot) 
}
