# install.packages("sp")
library(sp)
data(meuse)
head(meuse)
?meuse
write.csv(meuse, "soil.csv", row.names = F)
