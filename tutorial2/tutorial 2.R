getwd()
setwd("D:/Smith/R_coursera/R for programming/R-programming/tutorial2")
get_max<-function(file_name){ 
    dat<-read.table(file_name,header = TRUE,sep = '\t')
    nrows_dat<-nrow(dat)
    unique_gene<-character(nrows_dat)
    max_value<-numeric(nrows_dat)
    next_entry<-0
    for(k in seq_len(nrows_dat)){
        gene_name<-dat[k,1]
        gene_value<-dat[k,2]
        indice<-which(unique_gene == gene_name)
        num_indice<-length(indice)
        if(num_indice == 0){
            next_entry<-next_entry+1
            unique_gene[next_entry]<-gene_name
            max_value[next_entry]<-gene_value
        }
        else if(num_indice == 1){
            current_value<-max_value[indice]
            if(abs(gene_value)>abs(current_value)){
                max_value[indice]<-gene_value
            }
        }
        else{
            print('number_indice is not 0 or 1')
            break
        }
    }
    unique_gene<-unique_gene[1:next_entry]
    max_value<-max_value[1:next_entry]
    final<-data.frame(geneName=unique_gene,geneValue=max_value)
}
a<-get_max('tutorial2.txt')
a

