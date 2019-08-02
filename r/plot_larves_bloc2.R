## Script qui plotte les larves observés + inflorescences vivantes (dataset 2)

library(tidyverse)
data <- read_csv("2017_piege_bloc2.csv")
load("date2017.Rdata")

data$sol <- factor(rep(c("Enherbement ras",
                         "Paillage synthétique", 
                         "Enherbement haut"), each = 80),
                   levels = c("Enherbement ras",
                              "Enherbement haut",
                              "Paillage synthétique"))

data %>% ggplot +
    aes(x = date, y = larves) +
    theme_bw() +
    geom_line(aes(y = inflos), col = "grey50", lwd = 0.75) +
    geom_point() +
    geom_line(linetype = "dotted") +
    facet_grid(. ~ sol) +
    xlab(element_blank()) +
    ylab("Nombre de larves s'éjectant des inflorescences")
                