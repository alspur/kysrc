## ----enrl_hist, fig.width=7, message=FALSE, warning=FALSE----------------
library(tidyverse)
library(kysrc)
library(scales)

profile_sch %>%
  filter(year == "2016-2017") %>%
  ggplot(aes(x = enroll)) +
  geom_histogram(binwidth = 200) +
  labs(x = "Enrollment", y = "# of KY Public Schools") +
  ggtitle("Kentucky Public School Enrollment, 2016-17") +
  theme_minimal()


## ----ccr, fig.width=7, message=FALSE, warning=FALSE----------------------

ccr_state %>%
  filter(student_group == "All Students") %>%
  ggplot(aes(x = year, y = ccr_pct, group = sch_id)) +
  geom_line() +
  labs(x = "School Year", y = "College & Career Readiness Rate") +
  ggtitle("College & Career Readiness in Kentucky, 2011-12 to 2016-17") +
  scale_y_continuous(labels = percent) +
  theme_minimal()


## ----grad_frpl, fig.width=7, warning=FALSE, message=FALSE----------------

# get data from 2016-17 school year
grad16 <- grad_sch %>% 
  filter(year == "2016-2017",
         student_group == "All Students") %>%
  select(sch_id, grad_rate)

frpl16 <- frpl_sch %>% 
  filter(year == "2016-2017") %>%
  select(sch_id, frpl_pct)
  
profile16 <- profile_sch %>% 
  filter(year == "2016-2017") %>% 
  select(sch_id, enroll)

# join and plot data
grad16 %>%
  left_join(frpl16, by = "sch_id") %>%
  left_join(profile16, by = "sch_id") %>%
  ggplot(aes(x = frpl_pct, y = grad_rate, size = enroll)) +
  geom_point(alpha = .5) +
  scale_size_area(max_size = 10) +
  scale_x_continuous(label = percent) +
  scale_y_continuous(label = percent) +
  labs(x = "School FRPL Rate", y = "4-Year Cohort Graduation Rate",
       size = "Enrollment")+
  ggtitle("School FRPL Rates vs. 4-Year Cohort Graduation Rates, 2016-17") +
  theme_minimal()


