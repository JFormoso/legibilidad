#' Segmentar una palabra en sílabas según reglas heurísticas del español
#'
#' Esta función divide una palabra en sílabas aplicando reglas fonológicas
#' simplificadas basadas en patrones comunes del español escrito.
#'
#' La segmentación se basa en una clasificación fonológica básica de letras:
#' - V: vocal fuerte (a, á, e, é, o, ó)
#' - v: vocal débil (i, í, u, ú, ü)
#' - c: consonante común
#' - s: consonante especial (s)
#' - x: consonante especial (x)
#'
#' Las reglas utilizadas modelan cortes silábicos típicos como VV, Vc, cc, etc.,
#' e incluyen excepciones para dígrafos inseparables como "ll", "rr", "ch", 
#' y grupos consonánticos como "tr", "cl", etc.
#'
#' @param word Una palabra en minúsculas (preferentemente sin tildes ni signos)
#'
#' @return Un vector de sílabas que componen la palabra
#'
#' @examples
#' get_syllables("murciélago")  # "mur" "cié" "la" "go"
#' get_syllables("colaboración")
#' get_syllables("ciencia")
#'
#' @export


get_syllables <- function(word) {
  
  # Clasifica cada letra en tipo fonológico simplificado
  char_type <- function(char) {
    if (char %in% c('a', 'á', 'e', 'é', 'o', 'ó', 'í', 'ú')) {
      return('V')  # vocal fuerte
    } else if (char %in% c('i', 'u', 'ü')) {
      return('v')  # vocal débil
    } else if (char == 'x') {
      return('x')
    } else if (char == 's') {
      return('s')
    } else {
      return('c')  # consonante común
    }
  }
  
  # Crea una representación de la palabra y su línea de tipos fonológicos
  create_char_line <- function(word) {
    char_line <- sapply(strsplit(word, "")[[1]], char_type)
    type_line <- paste(char_line, collapse = "")
    return(list(word = word, type_line = type_line))
  }
  
  # Intenta dividir la palabra según un patrón de tipos y punto de corte
  split_by <- function(chars, finder, where) {
    pos <- regexpr(finder, chars$type_line)[1]
    if (pos != -1) {
      part1 <- substr(chars$word, 1, pos + where - 1)
      part2 <- substr(chars$word, pos + where, nchar(chars$word))
      return(list(
        create_char_line(part1),
        create_char_line(part2)
      ))
    }
    return(list(chars, NULL))
  }
  
  # Aplica reglas recursivamente para dividir la palabra en sílabas
  recursive_split <- function(chars) {
    rules <- list(
      list("VV", 1), list("cccc", 2), list("xcc", 1), list("ccx", 2), 
      list("csc", 2), list("xc", 1), list("cc", 1), list("vcc", 2), 
      list("Vcc", 2), list("sc", 1), list("cs", 1), list("Vc", 1), 
      list("vc", 1), list("Vs", 1), list("vs", 1)
    )
    
    for (rule in rules) {
      split_rule <- rule[[1]]
      where <- rule[[2]]
      split_result <- split_by(chars, split_rule, where)
      
      first <- split_result[[1]]
      second <- split_result[[2]]
      
      if (!is.null(second)) {
        # Excepciones para evitar cortes incorrectos
        if (grepl("^[csx]+$", first$type_line) || grepl("^[csx]+$", second$type_line)) next
        if (substr(first$type_line, nchar(first$type_line), nchar(first$type_line)) == 'c' &&
            substr(second$word, 1, 1) %in% c('l', 'r')) next
        if (substr(first$word, nchar(first$word), nchar(first$word)) == 'l' &&
            substr(second$word, nchar(second$word), nchar(second$word)) == 'l') next
        if (substr(first$word, nchar(first$word), nchar(first$word)) == 'r' &&
            substr(second$word, nchar(second$word), nchar(second$word)) == 'r') next
        if (substr(first$word, nchar(first$word), nchar(first$word)) == 'c' &&
            substr(second$word, 1, 1) == 'h') next
        
        return(c(recursive_split(first), recursive_split(second)))
      }
    }
    return(list(chars))
  }
  
  # Ejecutar la segmentación
  chars <- create_char_line(word)
  result <- recursive_split(chars)
  return(sapply(result, function(x) x$word))
}

