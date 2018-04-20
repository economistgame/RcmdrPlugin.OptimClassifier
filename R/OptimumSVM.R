
#'  Support Vector Machines
#'
#' @name OptimumSVM
#'
#' @description This dialog is used to specify a support vector machines model to be fit by the \link[OptimClassifier]{Optim.SVM} function.
#'
#' @seealso \code{\link[OptimClassifier]{Optim.SVM}}
#'
#' @import Rcmdr RcmdrMisc



utils::globalVariables(c("helpButton", "OrderRankFrame", "OrderRankVariable","dataTab",
                         "effectSizeVariable", "formulaFrame",
                         "groupSummaryVariable", "lhsEntry", "lhsVariable",
                         "mulCompVariable","buttonsFrame",
                         "notebook", "onHelp", "outerOperatorsFrame",
                         "optionsTab", "rhsVariable", "SStypeButtonsFrame",
                         "SStypeButtonsVariable", "criterionFrame",
                         "subsetVariable",  "top", "xBox"))
#'@export
OptimumSVM <- function(){
  ##Windows Title
  initializeDialog(title=gettextRcmdr("OptimSVM Model"))
  ###Function to calc last number
  UpdateModelNumber()
  ## Create a Model Name
  modelName <- tclVar(paste("OptimSVM", getRcmdr("modelNumber"), sep=""))

  modelFrame <- tkframe(top)
  model <- ttkentry(modelFrame, width="20", textvariable=modelName)
  variablesFrame <- tkframe(top)
  xBox <- variableListBox(variablesFrame, selectmode="multiple",
                          title=gettextRcmdr("Explanatory variables (pick one or more)"))
  yBox <- variableListBox(variablesFrame, title=gettextRcmdr("Response variable (pick one)"))
  cvFrame <- tkframe(top)
  priorFrame <- tkframe(top)
  predFrame <- tkframe(top)
  postFrame <- tkframe(top)
  subsetBox()
  onOK <- function(){ # Actions to perform
    x <- getSelection(xBox)
    y <- getSelection(yBox)
    closeDialog()
    if (0 == length(y)) {
      UpdateModelNumber(-1)
      errorCondition(recall=OptimumSVM, message=gettextRcmdr("You must select a response variable."))
      return()
    }
    if (0 == length(x)) {
      UpdateModelNumber(-1)
      errorCondition(recall=OptimumSVM, message=gettextRcmdr("No explanatory variables selected."))
      return()
    }
    if (is.element(y, x)) {
      UpdateModelNumber(-1)
      errorCondition(recall=OptimumSVM, message=gettextRcmdr("Response and explanatory variables must be different."))
      return()
    }
    modelValue <- trim.blanks(tclvalue(modelName))
    if (!is.valid.name(modelValue)){
      UpdateModelNumber(-1)
      errorCondition(recall=OptimumSVM, message=sprintf(gettextRcmdr('"%s" is not a valid name.'), modelValue))
      return()
    }
    if (is.element(modelValue, listLinearModels())) {
      if ("no" == tclvalue(checkReplace(modelValue, type=gettextRcmdr("Model")))){
        UpdateModelNumber(-1)
        OptimumSVM()
        return()
      }
    }

    OrderValue <- as.character(tclvalue(OrderRankVariable))
    percentage <- as.numeric(tclvalue(pValue))/100
    seedform <- as.numeric(tclvalue(seedValue))
    command <- paste("Optim.SVM(", y, "~", paste(x, collapse="+"),
                     ", data=", ActiveDataSet(), ", p=", percentage,", criteria='",OrderValue,"',seed=",seedform,")" ,sep="")

    doItAndPrint(paste(modelValue," <- ", command, sep=""))
    activeModel(modelValue)
    tkfocus(CommanderWindow())
  }
  # Set up GUI
  OKCancelHelp(helpSubject="Optim.SVM")
  tkgrid(labelRcmdr(modelFrame, text=gettextRcmdr("Enter name for model:")), model, sticky="w")
  tkgrid(modelFrame, row=1, column=1, columnspan=2, sticky="n")
  tkgrid(getFrame(yBox), labelRcmdr(variablesFrame, text="    "), getFrame(xBox), sticky="nw")
  tkgrid(variablesFrame, sticky="w", row=2, column=1, columnspan=2)
  radioButtons(name="OrderRank", buttons=c("SuccessRate", "TIerror","TIIerror"), values=c("success_rate", "ti_error","tii_error"),
               labels=gettextRcmdr(c("Success Rate", "TI error","TII error")), title=gettextRcmdr("Criteria"))
  tkgrid(OrderRankFrame, row=4, column=1, columnspan=1, sticky="w")
  #### Test ####
  ###Test
  rowColFrame <- tkframe(top)
  seedValue <- tclVar("2018")
  seedSlider <- tkscale(rowColFrame, from=1, to=100000, showvalue=FALSE, variable=seedValue,
                        resolution=1, orient="horizontal")
  seedShow <- labelRcmdr(rowColFrame, textvariable=seedValue, width=6, justify="right")
  pValue <- tclVar("70")
  pSlider <- tkscale(rowColFrame, from = 10, to = 95, showvalue = FALSE,
                        variable = pValue, resolution = 5, orient = "horizontal")
  pShow <- tklabel(rowColFrame, textvariable = pValue,
                      width = 2, justify = "right")

  tkgrid(labelRcmdr(rowColFrame, text=gettextRcmdr("Seed:")), seedSlider, seedShow, sticky="w")
  tkgrid(tklabel(rowColFrame, text = gettextRcmdr("Percentage of training (in %):")),
         pSlider, pShow, sticky = "w", sticky="w")
  tkgrid(rowColFrame, row=4, column=2, columnspan=1, sticky="w")
  tkgrid(buttonsFrame, row=6, column=1, columnspan=2, stick="nw")
  tkgrid.configure(helpButton, sticky="e")
  dialogSuffix(rows=6, columns=2)
}
