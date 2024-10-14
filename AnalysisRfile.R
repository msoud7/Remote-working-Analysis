library(dplyr)
library(readxl)
library(tidyr)
library(readr)
library(ggplot2)

data <- read_excel("Remote Working Survey.xlsx")

# Mutate dataframe for the questions of interest:

data <- data %>% 
  #select questions of interest
  select(c("In what kind of place do you typically work?",
           "(In your main job) have you spent at least one full day in the last four weeks working...",
           "How frequently did you work from home in the last four weeks?",
           "I currently have a good balance between the time I spend at work and the time I have available for non-work activities.",
           "I have sufficient time away from my job to maintain adequate well-being.",
           "I am satisfied with my work-life balance.",
           "My personal life suffers because of work....43",
           "When I get home I am often too exhausted to participate in family activities.",
           "The problem-solving behaviours I use in my job are not effective in resolving problems at home.",
           "The time i spend on family responsibilities often interferes with my work.",
           "Due to stress at home, I am often preoccupied with family matters at work.",
           "The behaviours that work for me at home do not seem to be effective at work.",
           "What is your gender?",
           "What is your age?",
           "Do you work right now, or have you worked in the last year?",
           "In what job industry was/is this work?",
           "How many years of experience do you have in your (current/last years) job? (numbers only)",
           "What is the highest level of education that you have completed?",
           "What is your type of employment?"
           )) %>% 
  #rename these variables
  rename(location = "In what kind of place do you typically work?",
         work_last_4weeks = "(In your main job) have you spent at least one full day in the last four weeks working...",
         home_work_freq = "How frequently did you work from home in the last four weeks?",
         WLB1 = "I currently have a good balance between the time I spend at work and the time I have available for non-work activities.",
         WLB2 = "I have sufficient time away from my job to maintain adequate well-being.",
         WLB3 = "I am satisfied with my work-life balance.",
         WFC1 = "My personal life suffers because of work....43",
         WFC2 = "When I get home I am often too exhausted to participate in family activities.",
         WFC3 = "The problem-solving behaviours I use in my job are not effective in resolving problems at home.",
         FWC1 = "The time i spend on family responsibilities often interferes with my work.",
         FWC2 = "Due to stress at home, I am often preoccupied with family matters at work.",
         FWC3 = "The behaviours that work for me at home do not seem to be effective at work.",
         gender = "What is your gender?",
         age = "What is your age?",
         working_status = "Do you work right now, or have you worked in the last year?",
         industry = "In what job industry was/is this work?",
         experience = "How many years of experience do you have in your (current/last years) job? (numbers only)",
         education_level = "What is the highest level of education that you have completed?",
         employment_type = "What is your type of employment?"
  )

# Bar plot for gender distribution
ggplot(data, aes(x = factor(gender,
                            levels = c(1, 2, 3, 4),
                            labels = c("Male", "Female", "Non-binary", "Prefer not to say")))) +
  geom_bar(fill = "steelblue") +
  labs(title = "Gender Distribution", x = "Gender", y = "Count") +
  theme_minimal()


# Histogram for age distribution
ggplot(data, aes(x = age)) +
  geom_histogram(binwidth = 5, fill = "steelblue", color = "white") +
  labs(title = "Age Distribution", x = "Age", y = "Count") +
  theme_minimal()

# Bar plot for employment type
ggplot(data, aes(x = employment_type)) +
  geom_bar(fill = "lightgreen") +
  labs(title = "Employment Type Distribution", x = "Employment Type", y = "Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels

# Bar plot for industry
ggplot(data, aes(x = industry)) +
  geom_bar(fill = "coral") +
  labs(title = "Industry Distribution", x = "Industry", y = "Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels

# Histogram for years of experience
ggplot(data, aes(x = experience)) +
  geom_histogram(binwidth = 2, fill = "purple", color = "white") +
  labs(title = "Years of Experience Distribution", x = "Years of Experience", y = "Count") +
  theme_minimal()

# Bar plot for education level
ggplot(data, aes(x = factor(education_level,
                            levels = c(1, 2, 3, 4, 5),
                            labels = c("Primary", "Secondary", "Bachelor", "Masters", "Doctorate")))) +
  geom_bar(fill = "lightblue") +
  labs(title = "Education Level Distribution", x = "Education Level", y = "Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels

