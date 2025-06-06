### clear the environment
rm(list=setdiff(ls(), "..."))

######## Set path ######## ########  ########  ########  ######## 

library("rstudioapi") # necessary library to use the following function 
path = getSourceEditorContext()$path # get path to the folder containing this R script

library("stringr") # necessary library to use the following function 
path = str_remove(path, "creating the datasets.R") # get rid of the filename from the path

setwd(path) # set the path to the same folder containing this R script; the datasets will be saved there in the next lines


######## Dataset for Anova ########  ########  ########  ########  ######## 

set.seed(999)  # set the seed

dataset_anova = data.frame(
  ID = as.character(c(1:200)),
  treatment = c(rep("Drug", each=100),
                rep("Placebo", each=100)),
  symptoms = c(rep("High", each=50),
               rep("Low", each=50),
               rep("High", each=50),
               rep("Low", each=50)),
  group = c(rep("Drug.High", each=50),
            rep("Drug.Low", each=50),
            rep("Placebo.High", each=50),
            rep("Placebo.Low", each=50)),
  score = 
    c(rnorm(n = 50, mean = 7, sd = 1.5),  # Drug - high
      rnorm(n = 50, mean = 6, sd = 1.5),  # Drug - low
      rnorm(n = 50, mean = 0, sd = 1.5),  # placebo - high
      rnorm(n = 50, mean = 0, sd = 1.5)), # placebo - low
  stringsAsFactors = TRUE)

#save dataset
write.table(dataset_anova,  file = "dataset_anova.txt", row.names = F) 



######## Dataset for regression ########  ########  ########  ########  ######## 

set.seed(999)  # set the seed

dataset_regression = data.frame(
  ID = as.character(c(1:100)),
  treatment.effect = sort(rnorm(n = 100, mean = 0, sd = 1)), 
  age = rnorm(n = 100, mean = 40, sd = 15), 
  dosage = sort(rnorm(n = 100, mean = 10, sd = 5), partial=c(20:40)), 
  symptoms = sort(rnorm(n = 100, mean = 50, sd = 15), partial=c(20:70)))

# standardize all measures
dataset_regression$age = (dataset_regression$age - mean(dataset_regression$age))/sd(dataset_regression$age)
dataset_regression$dosage = (dataset_regression$dosage - mean(dataset_regression$dosage))/sd(dataset_regression$dosage)
dataset_regression$symptoms = (dataset_regression$symptoms - mean(dataset_regression$symptoms))/sd(dataset_regression$symptoms)

# save dataset
write.table(dataset_regression,  file = "dataset_regression.txt", row.names = F)

