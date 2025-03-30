count_sentences <- function(text) {
  # Reemplazar saltos de línea por espacio para evitar cortes
  text <- gsub("\n", " ", text)
  
  # Buscar signos de puntuación final seguidos de espacio o fin de texto
  sentences <- gregexpr("[\\.\\!\\?]+(\\s|$)", text)[[1]]
  
  if (sentences[1] == -1) return(1)  # si no encuentra, asumimos una oración
  
  return(length(sentences))
}


