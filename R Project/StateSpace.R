# StateSpace.R is a script to generate 3D plots showing the voltage, m gate, and h gate
# of one node. This was used to analyze high frequency alternating current stimulation in the
# following paper:
# Dutta, A., & Nitsche, M. A. (2013). State-space analysis of Hodgkin-Huxley axonal neural 
#   mass model during subthreshold high frequency alternating current stimulation. 2013 6th 
#   International IEEE/EMBS Conference on Neural Engineering (NER). doi: 10.1109/ner.2013.6696129
#
# https://www.researchgate.net/publication/255822781_State-space_analysis_of_Hodgkin-Huxley_axonal_neural_mass_model_during_subthreshold_high_frequency_alternating_current_stimulation


# This is the library needed for using scatter3D
library("plot3D")

# load usefulFunctions used in numerous analysis repositories
# originally created for use with the Nerve-Block-Modeling Repository
# https://github.com/joey-kilgore/Nerve-Block-Modeling
source("UsefulFunctions.R")

# load any constants defined for this particular run (especially where the data set is located)
source("defs.R")

stateSpace <- function(t1=0, t2=8500){
  # stateSpace returns a 3D plot showing the voltage, m gate, 
  # The bounds t1 and t2 are the rows of the .csv files that show an example block at 40ms
  # with time step of .005ms (both of which are relatively standard with the Nerve-Blcok-Modeling Repo)
  
  DATA <- getDataAllDF(getDataFolder()) # load data
  
  t <- DATA$Time[t1:t2] # create time vector
  v <- DATA$V48[t1:t2]  # voltage vector
  m <- DATA$M48[t1:t2]  # m gate vector
  h <- DATA$H48[t1:t2]  # h gate vector
  
  plot <- scatter3D(m,v,h, bty="g", ticktype="detailed",
                    xlab="M Gate", ylab="Voltage (mV)", zlab="H Gate", type="l",
                    phi=15, theta=25, xlim=c(0,1), ylim=c(-100,100), zlim=c(0,1))
  # phi, theta, xlim, ylim were all chosen to closer represent the figures shown in the paper referenced above
  plot 
}