#!/bin/bash 

echo "Fetching and preprocessing text..."
./fetch_text.sh

echo "Generating text with the Markov Model..."
Rscript markov_model.R > generated_text.txt 

echo "Text generation officially completed ..."
echo "Everything saved into generated_text.txt..."
