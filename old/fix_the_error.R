
load("input/flurex_data_-_c234.RData")
phy@sam_data

#write.csv(phy@sam_data[["Sample"]], "input/correction/Sample.csv")
list <- c("Sample","Project","Seq_run","reads","ASVs")
write.csv(phy@sam_data, "input/correction/sam_data.csv", row.names = FALSE)

sam_data <- read.csv("input/correction/sam_data.csv")
samp <- sam_data$Sample
phy@sam_data[["Sample"]] <- samp
 
phy@sam_data[["Sample"]]
save(phy, file="input/flurex_data_-_okc234.RData")
