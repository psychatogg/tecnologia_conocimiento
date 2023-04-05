library(tidyr)
library(plotly)

tasas_3 <- read.csv("E:\\GDrive1\\Uni\\Master\\tecnologia_conocimiento\\practicas\\convolucional\\2.2_tasas.csv",sep=";", header=TRUE)

tasas_3_long <- gather(tasas_3, key = "exactitud", value = "valor_exactitud", exactitud_10:exactitud_50, factor_key = TRUE)



tasas_3_long$nombre <- factor(tasas_3_long$nombre)
levels(tasas_3_long$nombre) <- c("tm_div20", "tm_div15", "tm_div10", "tm_div5", "tm", "tm_5", "tm_10", "tm_15", "tm_20")
levels(tasas_3_long$exactitud) <- c("1", "2", "3", "4", "5")

graf <- plot_ly(x = ~tasas_3_long$nombre, y = ~tasas_3_long$exactitud, z = ~tasas_3_long$valor_exactitud, type = "mesh3d") 
graf <- graf %>% layout(scene = list(xaxis = list(title = "Tasa"),
																		 yaxis = list(title = "Época"),
																		 zaxis = list(title = "Exactitud")))
graf