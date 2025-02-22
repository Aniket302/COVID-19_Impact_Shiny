library(readxl)
library(sf)
library(dplyr)
library(lubridate)
library(BSDA)
library(car)

covid_data <- read_xlsx("Raw Data/covid19_sg2.xlsx")
hospitalization_data <- covid_data[c("Still Hospitalised","Date")]
str(hospitalization_data)

#ANOVA on the number of hospitalized patients in the following time frames - 
#1.pre april 2020, 2.april 2020-sept2021, 3.post September 2021

pre_april_2020 <- subset(hospitalization_data,Date<as.Date("2020-04-01"))
lockdown_period <- subset(hospitalization_data, Date>=as.Date("2020-04-01")&Date<("2021-10-01"))
post_lockdown <- subset(hospitalization_data,Date>=as.Date("2021-10-01"))

#Levene's test to check distribution of variances
levene_test_result <- leveneTest(`Still Hospitalised` ~ factor(case_when(Date < as.Date("2020-04-01") ~ "pre_april_2020", 
                                                                         Date >= as.Date("2020-04-01") & Date < as.Date("2021-10-01") ~ "lockdown_period",
                                                                         TRUE ~ "post_lockdown")), data = hospitalization_data)
print(levene_test_result)

#Shapiro-Wilk test for normality
shapiro_test_pre_april_2020 <- shapiro.test(pre_april_2020$`Still Hospitalised`)
shapiro_test_lockdown_period <- shapiro.test(lockdown_period$`Still Hospitalised`)
shapiro_test_post_lockdown <- shapiro.test(post_lockdown$`Still Hospitalised`)

print("Shapiro-Wilk test for pre April 2020:")
print(shapiro_test_pre_april_2020)

print("Shapiro-Wilk test for April 2020 to September 2021:")
print(shapiro_test_lockdown_period)

print("Shapiro-Wilk test for post September 2021:")
print(shapiro_test_post_lockdown)

#Kruskal-Wallis test
kruskal_test_result <- kruskal.test(`Still Hospitalised` ~ factor(case_when(Date < as.Date("2020-04-01") ~ "pre_april_2020", 
                                                                            Date >= as.Date("2020-04-01") & Date < as.Date("2021-10-01") ~ "lockdown_period",
                                                                            TRUE ~ "post_lockdown")), data = hospitalization_data)

print(kruskal_test_result)

# Perform Wilcoxon test
wilcoxon_test_result <- pairwise.wilcox.test(hospitalization_data$`Still Hospitalised`, 
                                             factor(case_when(hospitalization_data$Date < as.Date("2020-04-01") ~ "pre_april_2020", 
                                                              hospitalization_data$Date >= as.Date("2020-04-01") & hospitalization_data$Date < as.Date("2021-10-01") ~ "lockdown_period",
                                                              TRUE ~ "post_lockdown")), 
                                             p.adjust.method = "none")

print(wilcoxon_test_result)
