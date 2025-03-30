get_words <- function(text) {
  # Reemplazar signos de puntuación por espacios
  text <- gsub("[[:punct:]]", " ", text)
  
  # Separar por espacios
  words <- unlist(strsplit(text, "\\s+"))
  
  # Normalizar a minúsculas
  words <- tolower(words)
  return(words)
}

