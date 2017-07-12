          seed = -1
       seqfile = ../data/10s.phys 
      treefile = ../data/10s.tree
      mcmcfile = mcmc.txt
       outfile = out.txt

         ndata = 2
       seqtype = 0    * 0: nucleotides; 1:codons; 2:AAs
       usedata = 2    * 0: no data (prior); 1:exact likelihood; 2:approximate likelihood; 3:out.BV (in.BV)
         clock = 2    * 1: global clock; 2: independent rates; 3: correlated rates
       RootAge = '<1.0'  * safe constraint on root age, used if no fossil for root.

         model = 4    * 0:JC69, 1:K80, 2:F81, 3:F84, 4:HKY85
         alpha = 0.5   * alpha for gamma rates at sites
         ncatG = 5    * No. categories in discrete gamma

     cleandata = 0    * remove sites with ambiguity data (1:yes, 0:no)?

       BDparas = 1 1 0   * birth, death, sampling
   kappa_gamma = 6 2      * gamma prior for kappa
   alpha_gamma = 1 1      * gamma prior for alpha

   rgene_gamma = 2 40 1    * gammaDir prior for rate for genes
  sigma2_gamma = 1 10 1   * gammaDir prior for sigma^2     (for clock=2 or 3)

         print = 1   * 0: no mcmc sample; 1: everything except branch rates 2: everything
        burnin = 20000
      sampfreq = 100
       nsample = 20000

*** Note: Make your window wider (100 columns) before running the program.