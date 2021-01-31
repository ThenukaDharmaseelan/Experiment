#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(shiny)
library(shinydashboard)
library(dygraphs)
library(plotly)
library(flexdashboard)
library(shinyWidgets)
library(shinyalert)
library(slickR)
dashboardPage(
  
  dashboardHeader(title="Demand Planner"),
  dashboardSidebar(div(style="overflow-y: scroll"),
                   sidebarMenu(
                     textInput(inputId= "text1" ,  label =  "Please enter your index number to start the experiment" ),
                     actionButton( "goButton" ,  "Start  experiment"),
                     menuItem("Task Description",icon = icon("bar-chart-o"), tabName = "task_description" ),
                     menuItem("Basic Info",icon = icon("bar-chart-o"), tabName = "basic_info" ),
                     menuItem("Plan",icon = icon("bar-chart-o"), tabName = "plan" ),
                     menuItem("Feedback",icon = icon("bar-chart-o"), tabName = "feedback" )
                   )),
  dashboardBody(
   
    
    tabItems(
      
        
              
      tabItem(tabName = 'basic_info',
              fluidPage(
                fluidRow(
                  column(6,
                         box(width = 12,
                             textInput('id',h3('Enter Index Number')),
                             textInput('dob',h3('Year of Birth')),
                             selectInput('education',h3('Highest Education Level'),choices = c('OL (Minimum 11 Years)'='ol',
                                                                                               'AL (Minimum 13 years)'='al',
                                                                                               'Certificate Level (e.g.CIMA)'='certificate',
                                                                                               'Diploma Associate Degree'='diploma',
                                                                                               'Bachelors Degree'='bsc',
                                                                                               'Post Graduate Diploma'='pgd',
                                                                                               'Masters'='msc',
                                                                                               'Doctoral Studies'='PhD')),
                             
                             actionButton('submit_basic',"Submit")
                         )
                  )
                )
              )
      ),
      tabItem(tabName = "plan",
              
              fluidPage(
                fluidRow(
                  column(9,
                         fluidRow(box(width = 12, plotlyOutput('graph') )),
                         
                         
                  ),
                  column(3,
                         fluidRow(box(width = 12,h3(textOutput('timeleft')),
                                      textOutput('item_desc'),
                                      textOutput('promo_desc')
                         )),
                         fluidRow(
                           box(width = 12, textOutput('info')
                           )
                         ),
                         fluidRow(
                           box(width = 12,
                               uiOutput('normal_sales_val'),
                               uiOutput('submit')
                           )
                         )
                         
                  )
                )
              )
              
      ),
      tabItem(tabName = 'feedback',
              fluidPage(
                fluidRow(box(width=12, 
                             radioButtons('employment','Current Employment Status',choices = c('Full Time Student'='student',
                                                                                               'Part Time'='parttime',
                                                                                               'Full Time'='fulltime',
                                                                                               'Unemployed'='unemployed',
                                                                                               'Other'='Other'),inline = T),
                             conditionalPanel(condition = "input.employment=='fulltime'",
                                              
                                              radioButtons('tier','Your tier of employment?',choices = c('Intern'='intern',
                                                                                                         'Entry Level'='entrylevel',
                                                                                                         'Executive or Equivalent'='executive',
                                                                                                         'Assistance Manager or Euivalent'='am',
                                                                                                         'Manager or Euivalent'='manager',
                                                                                                         'C-Unit(CEO, CFO, CSO, CPO, COO, etc)'='cunit',
                                                                                                         'Self-Employed/ Entrepreneur' = 'self',
                                                                                                         'Academic'= 'academic',
                                                                                                         'Other'='other'),inline = T)),
                             conditionalPanel(condition = "input.employment=='fulltime'",
                                              radioButtons('experience','Experience in forecasting in the supply chain industry?',choices = c('No Experience'='no_experience',
                                                                                                                                              'Less than 1 year'='year',
                                                                                                                                              '1-2 Years'='1_2years',
                                                                                                                                              '2-5 Years'='2_5years',
                                                                                                                                              '5-10 Years'='5_10years',
                                                                                                                                              'More than 10 years' = 'morethan10'),inline = T)),
                             conditionalPanel(condition = "input.employment=='fulltime'",
                                              radioButtons('industry','Industry you are currently employed in?',choices = c('FMCG'='fmcg',
                                                                                                                            'Apparel'='apparel',
                                                                                                                            'Less than 1 year'='year',
                                                                                                                            'Pharmaceutical'='pharma',
                                                                                                                            'Transport'='transport',
                                                                                                                            'Retail'='retail',
                                                                                                                            'Agriculture' = 'agri',
                                                                                                                            'Software'='software',
                                                                                                                            'Other'='other'),inline = T)),
                             
                             conditionalPanel(condition = "input.employment=='fulltime'",
                                              
                                              radioButtons('tier','Your tier of employment?',choices = c('Intern'='intern',
                                                                                                         'Entry Level'='entrylevel',
                                                                                                         'Executive or Equivalent'='executive',
                                                                                                         'Assistance Manager or Euivalent'='am',
                                                                                                         'Manager or Euivalent'='manager',
                                                                                                         'C-Unit(CEO, CFO, CSO, CPO, COO, etc)'='cunit',
                                                                                                         'Self-Employed/ Entrepreneur' = 'self',
                                                                                                         'Academic'= 'academic',
                                                                                                         'Other'='other'),inline = T)),
                             conditionalPanel(condition = "input.employment=='parttime'",
                                              radioButtons('experience','Experience in forecasting in the supply chain industry?',choices = c('No Experience'='no_experience',
                                                                                                                                              'Less than 1 year'='year',
                                                                                                                                              '1-2 Years'='1_2years',
                                                                                                                                              '2-5 Years'='2_5years',
                                                                                                                                              '5-10 Years'='5_10years',
                                                                                                                                              'More than 10 years' = 'morethan10'),inline = T)),
                             conditionalPanel(condition = "input.employment=='parttime'",
                                              radioButtons('industry','Industry you currently employed in?',choices = c('FMCG'='fmcg',
                                                                                                                        'Apparel'='apparel',
                                                                                                                        'Less than 1 year'='year',
                                                                                                                        'Pharmaceutical'='pharma',
                                                                                                                        'Transport'='transport',
                                                                                                                        'Retail'='retail',
                                                                                                                        'Agriculture' = 'agri',
                                                                                                                        'Software'='software',
                                                                                                                        'Other'='other'),inline = T)),
                             conditionalPanel(condition = "input.employment=='parttime'",
                                              
                                              radioButtons('tier','Your tier of employment?',choices = c('Intern'='intern',
                                                                                                         'Entry Level'='entrylevel',
                                                                                                         'Executive or Equivalent'='executive',
                                                                                                         'Assistance Manager or Euivalent'='am',
                                                                                                         'Manager or Euivalent'='manager',
                                                                                                         'C-Unit(CEO, CFO, CSO, CPO, COO, etc)'='cunit',
                                                                                                         'Self-Employed/ Entrepreneur' = 'self',
                                                                                                         'Academic'= 'academic',
                                                                                                         'Other'='other'),inline = T)),
                             radioButtons('feedback_1','What importance did you place on the system generated forecast provided to you when determining your forecast adjustment?',
                                          choices = c("Not at all Important"=1,
                                                      "Low Importance"=2,
                                                      "Slightly Important"=3,
                                                      "Neutral"=4,
                                                      "Moderately Important"=5,
                                                      "Very Important"=6,
                                                      "Extremely Important"=7),inline = T),
                             
                             radioButtons('feedback_2','What importance did you place on average promotional uplift provided to you when determining your forecast adjustment?',
                                          choices = c("Not at all Important"=1,
                                                      "Low Importance"=2,
                                                      "Slightly Important"=3,
                                                      "Neutral"=4,
                                                      "Moderately Important"=5,
                                                      "Very Important"=6,
                                                      "Extremely Important"=7),inline = T),
                             
                             
                             
                             radioButtons('feedback_3','What importance did you place on the presence of post promotional effect provided to you when determining your forecast adjustment?',
                                          choices = c("Not at all Important"=1,
                                                      "Low Importance"=2,
                                                      "Slightly Important"=3,
                                                      "Neutral"=4,
                                                      "Moderately Important"=5,
                                                      "Very Important"=6,
                                                      "Extremely Important"=7),inline = T),
                             
                             radioButtons('feedback_4','What importance did you place on average sales dip provided to you when determining your forecast adjustment?',
                                          choices = c("Not at all Important"=1,
                                                      "Low Importance"=2,
                                                      "Slightly Important"=3,
                                                      "Neutral"=4,
                                                      "Moderately Important"=5,
                                                      "Very Important"=6,
                                                      "Extremely Important"=7),inline = T),
                             
                             radioButtons('feedback_5','Were you aware of post promotional effect prior to participating in this experiment?',choices = c('Yes'='yes',
                                                                                                                                                          'No'='no'),inline = T),
                             
                             
                             
                             actionButton('submit_feedback','Submit')
                )
                )
              )
      )
    )
    
  )
)


