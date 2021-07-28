Demographic model scripts are written in fastsimcoal format. These models are defined considering 20 generations for the duration of bottleneck (db) in all uplift lineages (including Western Turakirae and Eastern Turakirae).

In order to simulate the models you need to have fsc26 in your working directory:

`library(delimitR)
fastsimcoalsims(prefix='model', pathtofsc='./fsc26', nreps=10000)`

After simulations, we will define the number of classes to summarize mSFS (the number should be chosen based on the guidelines in delimitR manual), build the prior and random forest classifier and finally select a model:

`
nclasses <- 10
FullPrior <- makeprior(prefix='model', nspec=4, nclasses=10, mydir='./', traitsfile='traits', threshold=100, thefolder='Prior', ncores=14)

ReducedPrior <- Prior_reduced(FullPrior)

myRF <- RF_build_abcrf(ReducedPrior,FullPrior,500)
myRF

observedSFS <- 'ant_MSFS'
traitsfile <- 'traits'
obsspecies <- 4

myobserved <- prepobserved(observedSFS,
  FullPrior,
  ReducedPrior,
  nclasses,
  obsspecies,
  traitsfile=traitsfile,
  threshold = 100)
  
prediction <- RF_predict_abcrf(myRF, myobserved, ReducedPrior, FullPrior, 500)
prediction`




