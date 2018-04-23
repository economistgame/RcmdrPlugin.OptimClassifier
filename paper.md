---
title: 'RcmdrPlugin.OptimClassifier: Extending the R Commander Interface to create the best train for classification models'
tags:
  - Classification models
  - Optimization
  - Prediction
  - Rcmdr
  - R
authors:
  - name:  Agustin Perez-Martin
    orcid: 0000-0003-4994-3176
    affiliation: 1
  - name:  Agustin Perez-Torregrosa
    orcid: 0000-0001-5658-4795
    affiliation: 1
  - name:  Marta Vaca-Lamata
    orcid: 0000-0001-8496-5579
    affiliation: 1
  - name:  Antonio Jose Verdu-Jover
    orcid: 0000-0002-6201-7196
    affiliation: 1
affiliations:
  - name: Department of Economic and Financial Studies, Miguel Hernández University of Elche, Spain
    index: 1
date: 23 April 2018
bibliography: Paper.bib
---



# Summary

The R Commander (``Rcmdr``) package [@Fox:2017] offers a point-and-click graphical user interface (GUI), despite to was originally conceived as a basic-statistics graphical user interface to R [@R:2018].

Nowadays, the  Rcmdr includes facilities for fitting, checking, and displaying several statistical models. This is because its menu and dialog structure were designed to be extensible, extending the Rcmdr became much more convenient with the introduction of the plug-in packages, described in @Fox:2007,  and as we write this, 56 ``Rcmdr`` plug-ins are available on CRAN and 17 ``Rcmdr`` plug-ins are available on Github.

Each of statistical methods has parameters inputs that we can optimize, so that return output will improve respect default options. OptimClassifier package (@Perez:2018, @R:2018) is useful in optimization and  modelling to obtain the best parameters for a classification model.
The main goal of ``RcmdrPlugin.OptimClassifier`` is providing a point-and-click graphical user interface (GUI) to ``OptimClassifier`` package. ``RcmdrPlugin.OptimClassifier`` currently already provides a whole toolbox of easy to use training models:

 - Linear Models (LM)
 - Generalized Linear Models (GLM)
 - Linear Mixed Models (LMM)
 - Discriminant Analysis (DA)
 - Classification And Regression Trees (CART)
 - Neural Networks (NN)
 - Support Vector Machines (SVM) 

![Some example of Optimum Support Vector Machines dialog](SVMMenu.png)
The source code for ``RcmdrPlugin.OptimClassifier`` has been archived to Zenodo with the linked DOI: @zenodo and Github

# References
