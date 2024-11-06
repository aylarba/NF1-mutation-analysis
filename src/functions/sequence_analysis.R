# Sequence Analysis Functions

create_mutant_sequence <- function(original_seq, mutation) {
  mut <- gsub("^p\.", "", mutation)
  orig_aa <- substr(mut, 1, 1)
  new_aa <- substr(mut, nchar(mut), nchar(mut))
  position <- as.numeric(gsub("[^0-9]", "", mut))
  
  mutant_seq <- original_seq
  substr(mutant_seq, position, position) <- new_aa
  return(mutant_seq)
}
