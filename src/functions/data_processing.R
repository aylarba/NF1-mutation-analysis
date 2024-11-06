# Data Processing Functions

read_mutation_data <- function(file_path) {
  mutations_df <- read.csv(file_path)
  return(mutations_df)
}

read_protein_sequence <- function(file_path) {
  protein_seq <- readLines(file_path)
  protein_seq <- paste(protein_seq, collapse="")
  return(protein_seq)
}
