# Plots for manuscript

# source files
source("UsefulFunctions.R")
source("VoltageProfile.R")

# Data sets
AP = getDataAllDF("C:\\Users\\Joey\\Desktop\\TestData\\Test AP\\")
Block = getDataAllDF("C:\\Users\\Joey\\Desktop\\TestData\\10kBlock\\100BT\\")

# Voltage Profile plots
# there are 3 of these
#   1: a propogating action potential
#   2&3: HF steady state
apVoltage <- voltageProfile(t=1250, DATA = AP)
apVoltage <- apVoltage + theme(plot.title = element_text(hjust = 0.5, size =16))
show(apVoltage)
