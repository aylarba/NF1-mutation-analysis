# NF1 Mutation Analysis Pipeline
library(tidyverse)
library(Biostrings)

# Source dependencies
source("src/config.R")
source("src/functions/data_processing.R")
source("src/functions/sequence_analysis.R")
source("src/functions/validation.R")

main <- function() {
  cat("Starting NF1 mutation analysis...
")
  
  # Read input data
  mutations_df <- read_mutation_data(INPUT_PATHS$mutations)
  protein_seq <- read_protein_sequence(INPUT_PATHS$protein_seq)
  
  # Process mutations
  mutations_df$protein_sequence <- protein_seq
  
  # Create output directories
  dir.create(OUTPUT_PATHS$results, recursive = TRUE, showWarnings = FALSE)
  dir.create(OUTPUT_PATHS$plots, recursive = TRUE, showWarnings = FALSE)
  
  # Generate mutant sequences
  mutations_df$mutant_sequence <- mapply(
    create_mutant_sequence,
    original_seq = protein_seq,
    mutation = mutations_df$Protein.Change
  )
  
  # Save results
  write.csv(
    mutations_df,
    file.path(OUTPUT_PATHS$results, "NF1-mutations-processed.csv"),
    row.names = FALSE
  )
  
  cat("Analysis complete!
")
}

# Run if script is executed directly
if (!interactive()) {
  main()
}
