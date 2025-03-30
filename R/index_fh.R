index_fh <- function(text) {
  n_words <- count_words(text)
  n_sentences <- count_sentences(text)
  
  # Extraer words y contar sílabas por palabra
  words <- get_words(text)
  n_syllables <- sum(sapply(words, count_syllables))
  
  syllables_per_word <- n_syllables / n_words
  words_per_sentence <- n_words / n_sentences
  
  fh <- 206.84 - (60 * syllables_per_word) - (1.02 * words_per_sentence)
  
  return(round(fh, 2))
}



