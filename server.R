
# Predicting Titanic Survival


library(shiny)
      library(dplyr); library(gbm)
            train <- read.csv("train.csv", stringsAsFactors=T)
            tdata <- select(train, 2:3, 5, 6)
            tdata <- na.omit(tdata)
            boost.data <- gbm(Survived~., data=tdata, distribution="gaussian", 
                              n.trees=323, interaction.depth=3, shrinkage=0.01, 
                              verbose=F,  cv.folds=3)
            
shinyServer(function(input, output) {

      output$oage <- renderPrint({input$age}) # renderPrint means output is printed text
      output$osex <- renderPrint({input$sex}) 
      output$oticket <- renderPrint({input$ticket})

      output$prediction <- renderPrint ({
            age = input$age
            sex = input$sex
            class = input$ticket
            pred = predict(boost.data, newdata=data.frame(Age=age, Sex=sex,Pclass=class ), n.trees=323 )
            result = paste("It is likely that you", 
                           ifelse(pred >= 0.5, "survived. Congratulations.", "did not survive. Sorry."),
                           "Your probability of surviving would have been", 
                           as.character(round(pred*100)), "%." )
            result
      })
      
  })
