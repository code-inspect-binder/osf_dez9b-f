################
## DISCLAIMER ##
################

# This document is part of the supporting material of the paper by Sara Garofalo et al. (2024) Testing Bayesian Informative Hypotheses in 5 steps with JASP and R. Advances in Methods and Practices in Psychological Science.
# It contains the code and a step-by-step guide necessary to reproduce the examples provided in the paper.

#######################
## PRELIMINARY STEPS ##
#######################

### clear the environment
rm(list=setdiff(ls(), "..."))

### install packages (comment the following line if already installed)
install.packages("bain")

### load packages
library(bain)


##############################
## Step 1: Load the dataset ##
##############################

### OPTION 1
## Go to “File -> Import dataset_regression -> From Text (base)” and then navigate to the folder 
## on your computer that contains the file "dataset_regression.txt" (downloaded from OSF page https://osf.io/dez9b/), 
## then click on “Import” to load the file. If you accept the default values, your dataset_regression will 
## now appear in the R Environment with the same name as the original filename.

### OPTION 2
## Uncomment the following lines if you want to load the dataset using the script
# setwd("C:\.....\\....") # manually add the path to the folder that contains the file on your computer, make sure to use either "\\" or "/"
# dataset_regression <- read.table("dataset_regression.txt")


###########################
## Step 2: Fit the model ##
###########################

fit <- lm(treatment.effect ~ age + dosage + symptoms, dataset_regression)



#################################################################
## Step 3: Define and test the Bayesian Informative Hypothesis ##
#################################################################

### Set the seed to ensure reproducible results
set.seed(123) 


### Run the Bayesian Informative Hypotheses analysis
results = bain(x = fit, 
                hypothesis = 
                "dosage > symptoms > age;
                symptoms > dosage > age;
                (symptoms , dosage) > age", 
                standardize = TRUE)


##################################################
## Step 4: Getting and interpreting the results ##
##################################################

### Display the main results
print(results) 

### Create pie charts of the three posterior model probabilities (PMP)
jpeg("Figure9.jpeg", res = 300, height = 800,  width = 3000) # save as external picture
par(mfcol=c(1,3)); # use the par function to create a single figure with 3 columns
# PMPa
perc <- results$fit[complete.cases(results$fit$PMPa), "PMPa",drop = FALSE] #  Remove NA values
perc <- round(perc,2)*100 # round values
perc <- perc[perc$PMPa != 0, , drop = FALSE] # remove values equal to zero
values <- perc$PMPa # Extract values
labels <- rownames(perc) # Extract labels
pie(values, paste0(labels," (",values,"%)"), cex=2, cex.main = 2, main = names(perc)) # Plot Pie Chart
# PMPb
perc <- results$fit[complete.cases(results$fit$PMPb), "PMPb",drop = FALSE] #  Remove NA values
perc <- round(perc,2)*100 # round values
perc <- perc[perc$PMPb != 0, , drop = FALSE] # remove values equal to zero
values <- perc$PMPb # Extract values
labels <- rownames(perc) # Extract labels
pie(values, paste0(labels," (",values,"%)"), cex=2, cex.main = 2, main = names(perc)) # Plot Pie Chart
# PMPc
perc <- results$fit[complete.cases(results$fit$PMPc), "PMPc",drop = FALSE] #  Remove NA values
perc <- round(perc,2)*100 # round values
perc <- perc[perc$PMPc != 0, , drop = FALSE] # remove values equal to zero
values <- perc$PMPc # Extract values
labels <- rownames(perc) # Extract labels
pie(values, paste0(labels," (",values,"%)"), cex=2, cex.main = 2, main = names(perc)) # Plot Pie Chart
dev.off() # save as external picture

### Get the Bayes factor matrix
round(results$BFmatrix,3) # display results rounding numbers to 3 values

################################
## Step 5: Visualize the data ##
################################

### install required packages (comment the following line if already installed)
install.packages(car)  

# load package
library(car) 

# Produce added variable plots
jpeg("Figure16.jpeg", res = 300, height = 1000,  width = 3000) # save as external picture
avPlots(fit, layout=c(1,3), id = FALSE, cex =2, cex.axis=2, cex.lab=1.8)
dev.off() # save as external picture



