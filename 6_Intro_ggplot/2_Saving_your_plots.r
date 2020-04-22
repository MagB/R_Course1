#############################################################
## Saving your plots 
## Intro to R/RStudio Feb 2020
#############################################################
library(ggplot2)
# Resources:
# https://ggplot2-book.org/


# There are  3 main ways to save your plots
# 1. use the export button in the plots window. 
# 2. save from quartz
# 3. ggsave 


# 2. Save qith quartz . You can add options to the plotting function to specify the image size. 
hwy_cty = ggplot(mpg, aes(cty, hwy)) +
  geom_point() +
  ggtitle("Relationship between city and highway mileage", subtitle = "subtitle") +
  xlab("city driving (mpg)") + 
  ylab("highway driving (mpg)") + theme_classic()

jpeg("6_Intro_ggplot/hwy_plot.jpg")
hwy_cty
dev.off()


pdf("6_Intro_ggplot/hwy_plot.pdf")
hwy_cty
dev.off()

png("6_Intro_ggplot/hwy_plot.png")
hwy_cty
dev.off()


# 3. Save with ggsave 

ggsave("6_Intro_ggplot/hwy_ggsave_plot.png", plot = hwy_cty, width = 8, height = 7, units = c("cm"), dpi = 150)
ggsave("6_Intro_ggplot/hwy_ggsave_plot.pdf", plot = hwy_cty, width = 8, height = 7, units = c("cm"), dpi = 150, device = "pdf")
