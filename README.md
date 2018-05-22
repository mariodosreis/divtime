# Bayesian Molecular Clock Dating Tutorial Using Genome-Scale Data

This repository contains the necessary files to run the tutorial
on divergence time estimation using genome-scale data.

File description:

`data/10s.phys`: Alignment of protein-coding genes of 10 primate species in two partitions.

`data/10s.tree`: Tree of 10 primate species with fossil calibrations.

`data/330s.phys`: Alignment of 1st and 2nd sites of mitochondrial protein-coding genes of 330 primate species in one partition.

`data/330s.tree`: Tree of 330 primate species.

`doc/phylogenomic-dating.pdf`: Book chapter with tutorial.

`gH/mcmctree-outBV.ctl`: Control file for MCMCTree necessary to set up calculation fo the gradient and Hessian for approximate likelihood calculation.

`mcmc/mcmctree.ctl`: Control file for MCMCTree to perform MCMC sampling from the posterior distribution of divergence times and rates using the approximate likelihood method.

`prior/mcmctree-pr.ctl`: Control file for MCMCTree to perform MCMC sampling from the prior distribuiton.

`R/analysis.R`: Examples of how to summarise the MCMC output and MCMC diagnostics.

`src/`: Source code of MCMCTree v4.9e.
