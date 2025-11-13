# COPD Longitudinal Data Analysis Script
# Author: Alma
# Description: Linear mixed models (LMM) and survival analysis for COPD cohort.

# 1. Load necessary libraries
library(tidyverse)
library(lme4)      # For GLMM
library(survival)  # For survival analysis
library(survminer) # For plotting survival curves
library(gtsummary) # For baseline tables

# 2. Data Simulation (Placeholder)
set.seed(123)
patient_data <- data.frame(
  ID = rep(1:89, each = 3), # 89 patients, 3 visits each
  Time = rep(c(0, 12, 24), 89),
  Group = rep(sample(c("Control", "Treatment"), 89, replace = TRUE), each = 3),
  mPAP = rnorm(89 * 3, mean = 25, sd = 5), # Mean Pulmonary Arterial Pressure
  PVR = rnorm(89 * 3, mean = 2.5, sd = 0.8), # Pulmonary Vascular Resistance
  AECOPD = rpois(89 * 3, lambda = 0.5) # Exacerbation count
)

# 3. Basic Descriptive Stats
summary(patient_data)

# 4. Model: GLMM for AECOPD frequency
# Utilizing negative binomial distribution for count data
glmm_model <- glmer.nb(AECOPD ~ Time + Group + (1 | ID), data = patient_data)

summary(glmm_model)

# End of script
