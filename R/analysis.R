# Make sure R's working directory is divtime/R

rm(list=ls()) # clean up the workspace
source("functions.R")

# ###############################################
# POSTERIOR:
# ###############################################
# read in MCMC trace files
mcmc1 <- read.table("../mcmc/mcmc1.txt", head=TRUE)
mcmc2 <- read.table("../mcmc/mcmc2.txt", head=TRUE)

# each data frame contains 15 columns:
# MCMC generation number, 9 node ages (divergence times), 2 mean mutation rates, 
# 2 rate drift coefficients, and sample log-likelihood values
names(mcmc1)
# [1] "Gen"      "t_n11"    "t_n12"    "t_n13"    "t_n14"    "t_n15"    "t_n16"    "t_n17"   
# [9] "t_n18"    "t_n19"    "mu1"      "mu2"      "sigma2_1" "sigma2_2" "lnL"

# to check for convergence of the MCMC runs, we calculate the posterior
# means of times for each run, and plot them against each other
t.mean1 <- apply(mcmc1[,2:10], 2, mean) * 100
t.mean2 <- apply(mcmc2[,2:10], 2, mean) * 100
plot(t.mean1, t.mean2); abline(0, 1)

# ###############################################
# PRIOR:
# ###############################################
mcmc1.p <- read.table("../prior/mcmc1.txt", head=TRUE)
mcmc2.p <- read.table("../prior/mcmc2.txt", head=TRUE)

p.mean1 <- apply(mcmc1.p[,2:10], 2, mean) * 100
p.mean2 <- apply(mcmc2.p[,2:10], 2, mean) * 100
plot(p.mean1, p.mean2); abline(0, 1)

