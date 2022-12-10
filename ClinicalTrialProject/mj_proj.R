
library(reshape2)
library(dplyr)

traffic <- read.csv('Traffic_Volume_Counts.csv')
#collisions <- read.csv('Motor_Vehicle_Collisions_Crashes.csv')
melt_cols <- colnames(traffic)[1:7]

# get zipcode from segment id in traffic table
# Probably need to manually get zipcode
traffic <- melt(traffic, value.name = "volume", id = melt_cols)

test <- count(traffic, Roadway.Name, sort = TRUE)




#write.csv(traffic,"traffic.csv")


tabItems(
  tabItem(
    tabName = "introduction",
    fluidRow(
      style = "padding: 20px;",
      h1("Visualization of Cardiovascular Related Clinical Trials"),
      br(),
      h4("What are clinical trials?"),
      p("- Interventional vs. Observational"),
      p("- Phases"),
      br(),
      h4("Leading cause of death in the US:"),
      p("- Cariovascular Disease"),
      br(),
      h4("Purpose of dashboard: "),
      p("- Exploration of cardiovascular related clinical studies "),
      p("1. Individuals with diease"),
      p(
        "2. Further knowledge on disease, treatments and prevention methods"
      ),
      p("3. Investment in medical prodcuts related to disease")
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
             h4("Marcus Choi has a degree in Kinesiology and several years of experience in clinical research, where he developed "),
             h4("a passion for working with data. This led him to pursue a career in data science and is currently training at the "),
             h4("NYC Data Science Academy. "),
             br(),
             br(),
             img(src="me.jpg",height="22%", width="22%")
    )
  )
  
  
)