# RcmdrPlugin.OptimClassifier

[![Travis-CI Build Status](https://travis-ci.org/economistgame/RcmdrPlugin.OptimClassifier.svg?branch=master)](https://travis-ci.org/economistgame/RcmdrPlugin.OptimClassifier)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/economistgame/RcmdrPlugin.OptimClassifier?branch=master&svg=true)](https://ci.appveyor.com/project/economistgame/RcmdrPlugin.OptimClassifier)

`RcmdrPlugin.OptimClassifier` is an R Commander Plug-In containing dialogs for multiple types of binary classification models provided in the [`OptimClassifier`](https://cran.r-project.org/package=OptimClassifier) package.

Installing the GUI
------------------

To install the **Development Version** from *GitHub* repository use:

``` r
install.packages("devtools") # If not yet installed on your R Version
devtools::install_github("economistgame/RcmdrPlugin.OptimClassifier")
```

or 

``` r
install.packages("remotes") # If not yet installed on your R Version
remotes::install_github("economistgame/RcmdrPlugin.OptimClassifier")
```

On the initial start-up of R Commander, you will probably be prompted to install some additional dependencies. This should not take too long!

To launch the GUI, use:

``` r
library(RcmdrPlugin.OptimClassifier)
```

