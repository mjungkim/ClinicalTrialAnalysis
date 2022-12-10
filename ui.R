library(shinydashboard)
library(leaflet)
library(DT)


shinyUI(dashboardPage(
  skin = "purple",
  dashboardHeader(title = "Minjung's App"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Introduction", tabName = "introduction", icon = icon("info")),
      menuItem("Map", tabName = "map", icon = icon("map")),
      menuItem("Information", tabName = "information", icon = icon("table")),
      menuItem("Exploration", tabName = "exploration", icon = icon("table")),
      menuItem("Data", tabName = "data", icon = icon("database")),
      menuItem("About", tabName = "about", icon = icon("smile"))
    )
  ),
  
  
  dashboardBody(
    tabItems(
      tabItem(
        tabName = "introduction",
        fluidRow(
          style = "padding: 20px;",
          h1("Landscape of Oncology Clinical Research in the US"),
          h4("Analysis of Clinical Trial Cancer Registry"),
          br(),
          br(),
          h4("Most common cancer type in the US:"),
          p("- Breast Cancer"),
          br(),
          br(),
          h4("Purpose: "),
          p("- Exploration of breast cancer related clinical trials"),

        ),
        br(),
        br(),
        br(),
        br(),
        br(),
        
        fluidRow()
      ),
      
      
    
      
      tabItem(
        tabName = "about",
        fluidRow(style = "padding: 20px;",
                 h2("Background"),
                 br(),
                 h4("Minjung Kim has a degree in Sociology and 6+ years of experience in operations and policy development in the airline industry. "),
                 h4("Her latest role was working as an Assistant Manager at JinAir conducting passenger and staff data analytics in order to provide "),
                 h4("smoother experiences for traveling customers. Minjung has a passion for helping people and is looking to transition into the  "),
                 h4("healthcare field where can utilize her data analytics and statistical skills to make an impact on patients’ lives. "),
                 
                 br(),
                 br(),
                 img(src = 'mj.png', height = '175px', width = '230px')
        )
      ),
      
      tabItem(tabName = "map",
              fluidPage(leafletOutput("mymap", height = 650))),
      
      tabItem(
        tabName = "information",
        selectizeInput("choose",
                       "Select Input",
                       choice_study_info),
        fluidRow(plotOutput("information"))
      ),
      
      tabItem(
        tabName = "exploration",
        selectizeInput("choice",
                       "Select Input",
                       choice_explore_info),
        fluidRow(plotlyOutput('boxplot1'))
      ),
      
      
      tabItem(tabName = "data",
              fluidRow(box(dataTableOutput("table"), width = 12)))
      
      
      
      
      
    )
  )
  
  
  
  
  
  )
 )
