# Loading the data 
text <- scan("clean_text.txt", what="character", sep="\n", quiet=TRUE)
words <- unlist(strsplit(paste(text, collapse= " "), "\\s+"))

bigrams <- data.frame(word1 = head(words,-1), word2 = tail(words,-1))
transition_matrix <- table(bigrams$word1, bigrams$word2)

# Now we have a probabilistic model, each row contains the probability of 
# moving to each possible next word 
transition_matrix <- sweep(transition_matrix, 1, rowSums(transition_matrix), FUN= "/")

# Function that uses the Markov Chain probabilistic model 
generate_text <- function(start_word, num_words = 50){
	text_output <- c(start_word)
	for (i in 1:num_words){
		next_word <- sample(colnames(transition_matrix), 1, prob = transition_matrix[start_word, ])
		text_output <- c(text_output, next_word)
		start_word <- next_word
	}
	return(paste(text_output, collapse=" "))
}

set.seed(48); # anyone using this may get the same result as I do
cat(generate_text("the", 45), "\n")
