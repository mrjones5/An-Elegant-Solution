%r

install.packages("kohonen")
library(kohonen)

install.packages("viridis")
library(viridis)

setwd("Location of wines.csv") #Change this line to set working directory
wines = read.csv("wines.csv")

wines = as.data.frame(wines)

grid = somgrid(xdim=15, ydim=15, topo="hexagonal")

som.wines = som(scale(wines), grid = somgrid(xdim=15, ydim=15, "hexagonal"))
str(som.wines)

plot(som.wines, shape= "straight", type = "mapping") #visualize how many examples are in each region of the map
plot(som.wines, type="count", shape="straight", main="Node Counts")
plot(som.wines, type="codes", codeRendering = "segments", main = "Codes Plot", shape = "straight")

m_color <- function(n, alpha = 1){magma(n, end=6/6, alpha=alpha)[n:1]}

#Kohonen Heatmap Creation and save as high res image
jpeg("wines_plot.jpg", width=4, height=4, units = 'in', res = 300)
plot(som.wines, type="property", shape = "straight", main = "", property = getCodes(som.wines)[12,], palette.name=m_color)
dev.off()
