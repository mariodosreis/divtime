# Make sure R's working directory is divtime/R

rm(list=ls()) # clean up the workspace

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
# good convergence is indicated when the points fall on the y = x line.

par(mfrow=c(2,2))
# posterior times for run 1 vs run 2:
plot(t.mean1, t.mean2, main="a) Posterior times, r 1 vs. r 2"); abline(0, 1)
# notice that ancient times (t_n11 and t_n12) have small ESS
# trace plots are useful to visualise the MCMC and split problems
plot(mcmc1$t_n19, ty='l', main="b) trace of t_n19")
plot(mcmc1$t_n11, ty='l', main="c) trace of t_n11")
plot(density(mcmc1$t_n11), main="d) histogram of t_n11, r 1 vs. r2")
lines(density(mcmc2$t_n11), lty=2)

# we can calculate the effective sample sizes (ESS) of the parameters
# (you need to have the coda package installed for this to work)
mean.mcmc <- apply(mcmc1[,-1], 2, mean)
ess.mcmc <- apply(mcmc1[,-1], 2, coda::effectiveSize)
var.mcmc <- apply(mcmc1[,-1], 2, var)
se.mcmc <- sqrt(var.mcmc / ess.mcmc)
cbind(mean.mcmc, ess.mcmc, var.mcmc, se.mcmc)

# oldpar <- par()
# mai <- oldpar$mai; mai[3] <- .35; par(mai = mai)
# mai <- oldpar$mai; mai[1] <- .35; mai[2] <- .35; mai[3] <- .45; par(mai = mai)

# If you have the ape and bppr packages installed, you can make a densitree plot
# To get bppr, try:
# devtools::install_github("dosreislab/bppr")
par(mfrow=c(1,1))
#pri10s.tree <- ape::read.tree("../data/10s.tree") # does not work with some ape versions
pri10s.tree <- ape::read.tree("../data/10s-nocal.tree")
bppr::mcmc2densitree(pri10s.tree, mcmc1 * 100, "t_", thin=0.05, col="blue", alpha=0.01, pfrac=0.2)
title(xlab="Divergence time (Ma)")

# Some phylogentic programs such as BEAST or MrBayes output a list of trees in 
# Newick format, instead of a table. If you want, you can convert MCMCtree's
# MCMC output into a list of Newick trees as with BEAST or MrBayes
pri10s.tree$node.label <- NULL # remove node labels (optional)
mcmc.trees <- bppr::mcmc2multiphylo(pri10s.tree, mcmc1, "t_", thin=0.05)
# You can write the trees to a file (note this file can be potentially very big)
ape::write.tree(mcmc.trees, file="many.tree")

# ###############################################
# PRIOR:
# ###############################################
mcmc1.p <- read.table("../prior/mcmc1.txt", head=TRUE)
mcmc2.p <- read.table("../prior/mcmc2.txt", head=TRUE)

p.mean1 <- apply(mcmc1.p[,2:10], 2, mean) * 100
p.mean2 <- apply(mcmc2.p[,2:10], 2, mean) * 100
plot(p.mean1, p.mean2); abline(0, 1)

# par(mai=c(.4,.5,.4,.2)) # this changes the margin sizes
par(mfcol=c(3,3))
for(i in 9:1) {
  dpr <- density(mcmc1.p[,i+1], adj=.1) # prior
  dPr <- density(mcmc1[,i+1], adj=.1)   # Posterior
  xl <- range(c(dpr$x, dPr$x))
  yl <- range(c(dpr$y, dPr$y))
  plot(dpr, main=paste("t_n",i+10,sep=""), xlab="", ylab="", las=1, xlim=xl, ylim=yl, col="darkgrey")
  lines(dPr, col="black")
}

