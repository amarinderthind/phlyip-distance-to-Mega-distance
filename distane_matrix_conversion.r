library(readr)
dist1 <- read_table2("v2_strain_omega_distance-matrix.txt",  col_names = FALSE, skip = 1)

names1 <- dist1$X1
dist1 <- dist1[,-1]

options(scipen = 999) 
dist_mega <- round(dist1, 5)
dist_mega[upper.tri(dist_mega,diag=TRUE)] <- NA  #lower.tri
dist_mega <- sapply(as.data.frame(dist_mega), as.character)
dist_mega[is.na(dist_mega)] <- " "
#dist_mega <- sapply(as.data.frame(dist_mega), as.numeric_version)

lin1 <- paste0("#mega","\n","!Title: Concatenated Files;", "\n","!Format DataType=Distance DataFormat=LowerLeft;","\n", sep = '')

write.table(lin1,"new_distance1.meg", col.names = FALSE, row.names = FALSE,quote = FALSE)
write.table(paste('#',names1, sep = ''),"new_distance1.meg", sep="\t",append = TRUE, col.names = FALSE, row.names = FALSE,quote = FALSE)
write.table("\n","new_distance1.meg", sep="\t",append = TRUE, col.names = FALSE, row.names = FALSE,quote = FALSE)
write.table(dist_mega,"new_distance1.meg", sep="\t", append = TRUE,col.names = FALSE, row.names = FALSE,quote = FALSE)

