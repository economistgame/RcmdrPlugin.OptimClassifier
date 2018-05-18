# RcmdrPlugin.OptimClassifier



| Dev | Publish | Stats | Other |
|-----|---------|-------|-------|
| [![Travis-CI Build Status](https://travis-ci.org/economistgame/RcmdrPlugin.OptimClassifier.svg?branch=master)](https://travis-ci.org/economistgame/RcmdrPlugin.OptimClassifier)    |  [![CRAN STATUS](https://www.r-pkg.org/badges/version/RcmdrPlugin.OptimClassifier)](https://cran.r-project.org/web/packages/RcmdrPlugin.OptimClassifier/index.html)       |  [![DOWNLOADSPM](https://cranlogs.r-pkg.org/badges/RcmdrPlugin.OptimClassifier)](https://www.r-pkg.org/pkg/RcmdrPlugin.OptimClassifier)     |    [![CRAN LICENSE](https://img.shields.io/cran/l/RcmdrPlugin.OptimClassifier.svg)](https://img.shields.io/cran/l/RcmdrPlugin.OptimClassifier.svg)   
|[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/economistgame/RcmdrPlugin.OptimClassifier?branch=master&svg=true)](https://ci.appveyor.com/project/economistgame/RcmdrPlugin.OptimClassifier)    | [![status](http://joss.theoj.org/papers/fb8deffc7e4c42deace35e691e0f8c8d/status.svg)](http://joss.theoj.org/papers/fb8deffc7e4c42deace35e691e0f8c8d) |   [![DOWNLOADSTOTAL](https://cranlogs.r-pkg.org/badges/grand-total/RcmdrPlugin.OptimClassifier)](https://cranlogs.r-pkg.org/badges/grand-total/RcmdrPlugin.OptimClassifier)   |  
| | [![DOI](https://zenodo.org/badge/130682169.svg)](https://zenodo.org/badge/latestdoi/130682169)       |       |       |
 


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

