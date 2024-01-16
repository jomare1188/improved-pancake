library(tidyr)
df <- read.table("id_GO_tmp.tsv", header = F, na.strings = "-")
df2 <- df[complete.cases(df),]
df2$V3 <- "ISM"
df3 <- separate_rows(df2, V2, sep = ",")
df4 <- unique(df3)
write.table(df4, "GO_for_conekt_test.tsv", quote = F, row.names = F, col.names = F)

