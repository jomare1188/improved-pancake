# interpro file in tsv and gz
INTERPRO_FILE=Scp1.aa.nonStop.interpro.tsv.gz

# pls see https://interproscan-docs.readthedocs.io/en/latest/OutputFormats.html to kwon wich columns to cut
# sed 's/(InterPro)//g' and sed 's/(PANTHER)//g' is specific to the GO structure in interprofile, maybe if you want another column you dont need this 

zcat Scp1.aa.nonStop.interpro.tsv.gz | cut -f1,14 | sed "s/|/,/g" | sed 's/(InterPro)//g' | sed 's/(PANTHER)//g' > id_GO_tmp.tsv
# separate GO in multiples rows in R
## need tidyr https://tidyr.tidyverse.org 
Rscript separate_rows.r
rm -f id_GO_tmp.tsv

