# Bayesian Molecular Clock Dating Tutorial Using Genome-Scale Data

This repository contains the necessary files to run the tutorial
on divergence time estimation using genome-scale data.

File description:

`data/10s.phys`: Alignment of protein-coding genes in two partitions.

`data/10s.tree`: Tree with fossil calibrations.

`gH/mcmctree-outBV.ctl`: Control file for MCMCTree necessary to set up calculation fo the gradient and Hessian for approximate likelihood calculation.

`mcmc/mcmctree.ctl`: Control file for MCMCTree to perform MCMC sampling from the posterior distribution of divergence times and rates using the approximate likelihood method.

`prior/mcmctree-pr.ctl`: Control file for MCMCTree to perform MCMC sampling from the prior distribuiton.

`R/analysis.R`: Examples of how to summarise the MCMC output and MCMC diagnostics.
