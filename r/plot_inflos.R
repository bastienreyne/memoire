
library(tidyverse)
load("It1.Rdata")
load("It2.Rdata")
load("Itc1.Rdata")
load("date2017.Rdata")

df <- data.frame(Date = rep(date2017, 9), 
                 Inflorescences = c(It1_ER,
                                    It1_PS,
                                    It1_EH,
                                    Itc1_ER,
                                    Itc1_PS,
                                    Itc1_EH,
                                    It2_ER,
                                    It2_PS,
                                    It2_EH),
                 Sol = factor(rep(c("Enherbement ras",
                                    "Paillage synthétique",
                                    "Enherbement haut"),
                                  each = 80, times = 3),
                              levels = c("Enherbement ras",
                                         "Paillage synthétique",
                                         "Enherbement haut")),
                 Dataset = factor(rep(c("It1", "Itc1", "It2"), each = 240),
                                  levels = c("It1", "Itc1", "It2")))

df %>% ggplot +
    aes(x = Date, y = Inflorescences, color = Dataset) +
    geom_line(lwd = 0.75) +
    theme_bw() +
    facet_grid(. ~ Sol) +
    ylab("Nombre d'inflorescences vivantes") +
    theme(legend.title = element_blank(), legend.position = "bottom", legend.text = element_text(size = 10)) +
    scale_color_discrete(labels = c("Dataset 1   ", "Dataset 1 corrigé   ", "Dataset 2")) +
    xlab(element_blank())
    