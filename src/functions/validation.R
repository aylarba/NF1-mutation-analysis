# Validation Functions

validate_mutation <- function(original_seq, mutation) {
  # Extract mutation details
  mut <- gsub("^p\.", "", mutation)
  orig_aa <- substr(mut, 1, 1)
  position <- as.numeric(gsub("[^0-9]", "", mut))
  
  # Check if original amino acid matches
  actual_aa <- substr(original_seq, position, position)
  return(orig_aa == actual_aa)
}
