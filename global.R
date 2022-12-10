library(shiny)
library(shinydashboard)
library(leaflet)
library(dplyr)
library(tidyr)
library(ggplot2)
library(leaflet)
library(DT)
library(lubridate)
library(googleVis)
library(stringr)
library(plotly)


breast_cancer <- read.csv("breast_cancer_trials.csv")
head(df)


df <- as_tibble(breast_cancer) %>% 
  select( Status = Status,
          Interventions = Interventions,
          Sponsor.Type = Sponsor.Collaborators,
          Gender = Gender,
          Phases = Phases,
          Enrollment = Enrollment, 
          Study.Type = Study.Type,
          Start.Date = Start.Date,
          Completion.Date = Completion.Date,
          Sponsor = Funded.Bys,
          Locations = Locations)




#clean columns for visualization
df$Interventions <- sub("\\:.*", "", df$Interventions)
df$Study.Type <- sub("\\:.*", "", df$Study.Type)
df$Phases <- sub("Not Applicable", "", df$Phases)
df$Phases <- sub("Early ", "", df$Phases)
df$Phases[df$Phases==""]<-NA


#Length of clinical trials by finding the difference between start and completion date
modified_start = parse_date_time(df$Start.Date, orders = c('mY','mdY'))
modified_completion = parse_date_time(df$Completion.Date, orders = c('mY', 'mdY'))
trial_duration = interval(modified_start, modified_completion) %/% months(1)
df <- cbind(df, Duration = trial_duration) 

#upload longitude and latitude df
location_df <- read.csv("final copy.csv")

#merge location to clinical trials df
location_df <- left_join(df,location_df, by=c("Locations" = "x"))
location_df <- location_df[!duplicated(location_df$key), ]



#input choice on UI
choice_study_info = c("Intervention Type", "Patient Status", "Clinical Phase", "Sponsor Type")
choice_explore_info = c("Enrollment", "Duration")

# go to original colum and different types of grouping
# save the original sponsor column to third column 
# rename the new column as sponsor




#DF for table output
df_duration = df %>% 
  filter(., !is.na(Duration)) %>%
  group_by(., Sponsor.Type) %>% 
  summarise(., 
            Avg.Duration = round(mean(Duration), 1), 
            Min.Duration = round(min(Duration), 1), 
            Max.Duration = round(max(Duration), 1)) 

enrollment_df <- df %>% group_by(., Sponsor.Type) %>% 
  filter(., !is.na(Enrollment)) %>% 
  summarise(., 
            #Total.Studies =  ??
            Total_Enrollment = sum(Enrollment),
            Avg.Enrollment = round(mean(Enrollment), 0),   
            Min.Enrollment = min(Enrollment),
            Max.Enrollment = max(Enrollment))


tot_studies <- df %>% 
  group_by(., Sponsor.Type) %>% 
  summarise(., Total_Studies = n()) 


df_1 = inner_join(tot_studies, enrollment_df, by = "Sponsor.Type")
df_2 = inner_join(df_1, df_duration, by = "Sponsor.Type")















