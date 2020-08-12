## Author Amarinder Singh Thind

library(readr)
dist1 <- read_table2("input_file_phylip_distance.txt",  col_names = FALSE, skip = 1)

names1 <- dist1$X1
dist1 <- dist1[,-1]

dist1[upper.tri(dist1,diag=TRUE)] <- NA  #lower.tri

lin1 <- paste0("#mega","\n","!Title: Concatenated Files;", "\n","!Format DataType=Distance DataFormat=LowerLeft;","\n", sep = '')

write.table(lin1,"new_distance1.meg", col.names = FALSE, row.names = FALSE,quote = FALSE)
write.table(paste('#',names1, sep = ''),"new_distance1.meg", sep="\t",append = TRUE, col.names = FALSE, row.names = FALSE,quote = FALSE)
write.table("\n","new_distance1.meg", sep="\t",append = TRUE, col.names = FALSE, row.names = FALSE,quote = FALSE)
write.table(mt,"new_distance1.meg", sep="\t", append = TRUE,col.names = FALSE, row.names = FALSE)
