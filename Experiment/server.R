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

 t <- 120
    timeleft <- Sys.time() + 1*t
    output$timeleft <- renderText({
        invalidateLater(1000, session)
        paste("Time remaining for submit the values:", 
              round(difftime(timeleft, Sys.time(), units='secs')), 'secs')
    })
    output$adjustment_demand_val <- renderUI({
        numericInput('adjustment_demand_val','Forecast for Adjustment Demand',0,min = 0)
    })
    output$submit <- renderUI({
        actionButton('submit',"Submit",width = "100%")
        
    })
 ########### Basic Info ###################     
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

    ########### Plan #########################  
    output$info <- renderText("Multiple Adjustment is the adjustment of previously adjusted forecast. You are given a system generated forecast and the first manual adjustment for a functional product. If you feel the first adjustment is sufficient, enter the same value in the value box below. Or else you can adjust based on the given factors and enter the final adjustment in the value box. ")
    output$item_desc <- renderText(paste('Item :Functional Product'))

})
