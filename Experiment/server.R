#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output,session) {

    observeEvent(input$submit_basic,{
        
        basic_master <- read.csv("basic_info.csv")
        basic_info <- data.frame("ID"=input$id,
                                 "DoB"=input$dob,
                                 "Education"=input$education)
        basic_master <- rbind(basic_master, basic_info)
        
        write.csv(basic_master,"basic_info.csv",row.names = F)
        
        showModal(modalDialog(
            title = "Completed",
            paste("Thank you for submitting your Basic Information",'ID:',input$id,'YoB:',input$dob,
                  'Education:',input$education),
            easyClose = TRUE,
            footer = NULL
        ))
    }) 

})
