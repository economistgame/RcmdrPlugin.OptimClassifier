
#'  Linear Mixed Model
#'
#' @name OptimumLMM
#'
#' @description This dialog is used to specify a  linear mixed model to be fit by the \link[OptimClassifier]{Optim.LMM} function.
#'
#' @seealso \code{\link[OptimClassifier]{Optim.LMM}}
#'
#' @import Rcmdr RcmdrMisc


utils::globalVariables(c("helpButton", "OrderRankFrame", "OrderRankVariable",
                         "onHelp", "criterionFrame", "buttonsFrame",
                         "top", "xBox"))
#'@export
OptimumLMM <- function(){
  ##Windows Title
  initializeDialog(title=gettextRcmdr("OptimLMM"))
  ###Function to calc last number
  UpdateModelNumber()
  ## Create a Model Name
  modelName <- tclVar(paste("OptimLMM", getRcmdr("modelNumber"), sep=""))

  modelFrame <- tkframe(top)
  model <- ttkentry(modelFrame, width="20", textvariable=modelName)
  variablesFrame <- tkframe(top)
  yBox <- variableListBox(variablesFrame, title=gettextRcmdr("Response variable (pick one)"))
  cvFrame <- tkframe(top)
  priorFrame <- tkframe(top)
  predFrame <- tkframe(top)
  postFrame <- tkframe(top)
  subsetBox()
  onOK <- function(){ # Actions to perform
    y <- getSelection(yBox)
    closeDialog()
    if (0 == length(y)) {
      UpdateModelNumber(-1)
      errorCondition(recall=OptimumLMM, message=gettextRcmdr("You must select a response variable."))
      return()
    }

    modelValue <- trim.blanks(tclvalue(modelName))
    if (!is.valid.name(modelValue)){
      UpdateModelNumber(-1)
      errorCondition(recall=OptimumLMM, message=sprintf(gettextRcmdr('"%s" is not a valid name.'), modelValue))
      return()
    }
    if (is.element(modelValue, listLinearModels())) {
      if ("no" == tclvalue(checkReplace(modelValue, type=gettextRcmdr("Model")))){
        UpdateModelNumber(-1)
        OptimumLMM()
        return()
      }
    }

    OrderValue <- as.character(tclvalue(OrderRankVariable))
    percentage <- as.numeric(tclvalue(pValue))/100
    seedform <- as.numeric(tclvalue(seedValue))
    command <- paste("Optim.LMM('", y,"'",
                     ", data=", ActiveDataSet(), ", p=", percentage,", criteria='",OrderValue,"',seed=",seedform,")" ,sep="")

    doItAndPrint(paste(modelValue," <- ", command, sep=""))
    activeModel(modelValue)
    tkfocus(CommanderWindow())
  }
  # Set up GUI
  OKCancelHelp(helpSubject="Optim.LMM")
  tkgrid(labelRcmdr(modelFrame, text=gettextRcmdr("Enter name for model:")), model, sticky="w")
  tkgrid(modelFrame, row=1, column=1, columnspan=2, sticky="n")
  tkgrid(getFrame(yBox), labelRcmdr(variablesFrame, text="    "), sticky="nw")
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
