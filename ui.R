
# UI for Titanic Prediction


library(shiny)

shinyUI(fluidPage(
      
      # Application title
      titlePanel("Would you have survived the Titanic Disaster?"),
      
      # Sidebar with a slider input for number of bins
      sidebarLayout(
            sidebarPanel(
                  sliderInput("age",
                              "Your Age?",
                              min = 0,
                              max = 100,
                              value = 35),
                  radioButtons("sex", "Male or Female?",
                               c("Male" = "Male",
                                 "Female" = "Female"),
                               selected = NULL, inline = TRUE),
                  radioButtons("ticket", "What ticket would you have bought?",
                               c("1st Class" = 1,
                                 "2nd Class" = 2,
                                 "3rd Class" = 3),
                               selected = NULL),
                  submitButton('Submit')
            ),
            
            # Show a plot of the generated distribution
            mainPanel(
                  h3('Your Result'),
                  h4('Selectd Age:'), verbatimTextOutput("oage"), 
                  h4('Selected Sex:'), verbatimTextOutput("osex"), 
                  h4('Selected Ticket Class:'), verbatimTextOutput("oticket"),
                  h4('Prediction:'), 
                  textOutput("prediction")
           
            )
      )
))
