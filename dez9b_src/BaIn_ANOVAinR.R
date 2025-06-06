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

### install required packages (comment the following line if already installed)
install.packages("bain")

### load required packages
library(bain)


##############################
## Step 1: Load the dataset ##
##############################

### OPTION 1
## Go to “File -> Import dataset_anova -> From Text (base)” and then navigate to the folder 
## on your computer that contains the file "dataset_anova_anova.txt" (downloaded from OSF page https://osf.io/dez9b/), 
## then click on “Import” to load the file. If you accept the default values, your dataset_anova will 
## now appear in the R Environment with the same name as the original filename.

### OPTION 2
## Uncomment the following lines if you want to load the dataset using the script
# setwd("C:\.....\\....") # manually add the path to the folder that contains the file on your computer, make sure to use either "\\" or "/"
# dataset_anova <- read.table("dataset_anova.txt")


### make sure the variable "group" is a factor
str(dataset_anova)

###########################
## Step 2: Fit the model ##
###########################

fit = lm(score ~  group - 1, data = dataset_anova)

#################################################################
## Step 3: Define and test the Bayesian Informative Hypothesis ##
#################################################################

### Take a look at the estimated means and their names. These are the names you will have to use to define your hypotheses
coef(fit)

### Set the seed to ensure reproducible results
set.seed(123) 

### Run the Bayesian Informative Hypotheses analysis
results <- bain(x = fit, 
                hypothesis = 
                 "(groupDrug.High, groupDrug.Low) > 0 & groupDrug.High - groupPlacebo.High = groupDrug.Low - groupPlacebo.Low;
                  (groupDrug.High, groupDrug.Low) > 0 & groupDrug.High - groupPlacebo.High > groupDrug.Low - groupPlacebo.Low;
                  groupPlacebo.High = groupDrug.High = groupPlacebo.Low = groupDrug.Low")


##################################################
## Step 4: Getting and interpreting the results ##
##################################################

### Display the main results
print(results) 

### Create pie charts of the three posterior model probabilities (PMP)
jpeg("Figure9.jpeg", res = 300, height = 800,  width = 3000)  # save as external picture
par(mfcol=c(1,3)); # use the par function to create a single figure with 3 columns
# PMPa
perc <- results$fit[complete.cases(results$fit$PMPa), "PMPa",drop = FALSE] #  Remove NA values
perc <- round(perc,2)*100 # round values
perc <- perc[perc$PMPa != 0, , drop = FALSE] # remove values equal to zero
values <- perc$PMPa # Extract values
labels <- rownames(perc) # Extract labels
pie(values, paste0(labels," (",values,"%)"), cex=2, cex.main = 3, main = names(perc)) # Plot Pie Chart
# PMPb
perc <- results$fit[complete.cases(results$fit$PMPb), "PMPb",drop = FALSE] #  Remove NA values
perc <- round(perc,2)*100 # round values
perc <- perc[perc$PMPb != 0, , drop = FALSE] # remove values equal to zero
values <- perc$PMPb # Extract values
labels <- rownames(perc) # Extract labels
pie(values, paste0(labels," (",values,"%)"), cex=2, cex.main = 3, main = names(perc)) # Plot Pie Chart
# PMPc
perc <- results$fit[complete.cases(results$fit$PMPc), "PMPc",drop = FALSE] #  Remove NA values
perc <- round(perc,2)*100 # round values
perc <- perc[perc$PMPc != 0, , drop = FALSE] # remove values equal to zero
values <- perc$PMPc # Extract values
labels <- rownames(perc) # Extract labels
pie(values, paste0(labels," (",values,"%)"), cex=2, cex.main = 3, main = names(perc)) # Plot Pie Chart
dev.off() # save as external picture

### Get the Bayes factor matrix
round(results$BFmatrix,3) # display results rounding numbers to 3 values

################################
## Step 5: Visualize the data ##
################################


# Descriptives table: obtain estimates and credible intervals
summary(results, ci = 0.95)



## NOTE: The following code is used to generate a raincloud plot of the dataset_anova using the packages “ggplot” and "ggrain" (Allen et al., 2021)
#### A detailed explanation on how to use “ggrain” falls beyond the scope of the present tutorial. For more details see the package documentation available on the R project website (https://cran.r-project.org/web//packages//ggrain/index.html) and the paper by Allen and colleagues (2021)

### install the required packages (comment the following line if already installed)
install.packages(c("ggplot2","ggrain")) 

# load the required packages
library(ggplot2); library(ggrain)
# Please note that you cannot use these functions if your R version is older than 4.2.3. To check which R version is installed on your machine, you can type the command "R.Version" in your console. You can check how to update R at the following link: https://www.r-bloggers.com/2022/01/how-to-install-and-update-r-and-rstudio/


# Display raincloud plot
jpeg("Figure10.jpeg", res = 300, height = 2000,  width = 2000) # save as external picture
ggplot(dataset_anova, aes(symptoms, score, fill=treatment)) + 
  geom_rain(alpha = .5, cov = "treatment") + 
  ylim(c(-5,10)) +
  ylab("drug efficacy index") +
  theme(text=element_text(size=20)) 
dev.off() # save as external picture



