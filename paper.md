---
title: 'RcmdrPlugin.OptimClassifier: Extending the R Commander Interface to create the best train for classification models'
tags:
  - R
  - Rcmdr
  - classification models
  - GUI
authors:
  - name: Agustin Perez-Martin
      orcid: 0000-0003-4994-3176
      affiliation: Department of Economic and Financial Studies, Miguel Hernández University of Elche, Spain
  - name: Agustin Perez-Torregrosa
       orcid: 0000-0001-5658-4795
      affiliation: Department of Economic and Financial Studies, Miguel Hernández University of Elche, Spain
  - name: Marta Vaca-Lamata
      orcid: 0000-0001-8496-5579
      affiliation: Department of Economic and Financial Studies, Miguel Hernández University of Elche, Spain
  - name: Antonio Jose Verdu-Jover
      orcid: 0000-0002-6201-7196
      affiliation: Department of Economic and Financial Studies, Miguel Hernández University of Elche, Spain
date: 21 April 2018
bibliography: Paper.bib
---

# Summary

The R Commander (``Rcmdr``) package ([@Fox:2017]) offers a point-and-click graphical user interface (GUI), despite to was originally conceived as a basic-statistics graphical user interface to R ([@R:2018]).

Nowadays, the  Rcmdr includes facilities for fitting, checking, and displaying statistical models in general and plugins for specific areas. This is because its menu and dialog structure were designed to be extensible, extending the Rcmdr became much more convenient with the introduction of the plug-in packages, described in ([@Fox:2007]),  and as we write this, 56 ``Rcmdr`` plug-ins are available on CRAN and 17 ``Rcmdr`` plug-ins are available on Github.


Each of stadistical methods has parameters inputs that we can optimize, so that return output will improve respect default options. The main goal of ``RcmdrPlugin.OptimClassifier`` is providing a point-and-click graphical user interface (GUI) to OptimClassifier package ([@Perez:2018], [@R:2018] ). OptimClassifier package is an R package that collects most popular methodologies and compares different configuration parameters to find the best choice.
![Some example of Optimum Support Vector Machines dialog](SVMMenu.png)
 ``RcmdrPlugin.OptimClassifier`` allows to fit the most important statistical methodologies included in ``OptimClassifier`` with simple dialogs. The source code for ``RcmdrPlugin.OptimClassifier`` has been archived to Zenodo with the linked DOI: [@zenodo] and Github

# References
