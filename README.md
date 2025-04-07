# Legibilidad

## Objetivo

Explorar una alternativa sencilla y reproducible para calcular la legibilidad de textos en español en R, sin dependencias externas complejas. Para ello se reune una serie de funciones para la extracción de características del texto.

## Funcionalidades

- `get_words(text)`: Extrae y normaliza palabras desde un texto.
- `count_words(text)`: Cuenta la cantidad de palabras.
- `count_sentences(text)`: Estima la cantidad de oraciones en un texto.
- `get_syllables(word)`: Segmenta palabras en sílabas usando reglas heurísticas del español.
- `count_syllables(word)`: Cuenta la cantidad de sílabas en una palabra.
- `index_fh(text)`: Calcula el índice de Fernández-Huerta, una métrica tradicional de legibilidad para español.
- `analyze_complex_syllables(text)`: Detecta palabras que contienen sílabas complejas (con ataque, coda o ambos).

## Índices de legibilidad
### 📐 Fernández Huerta

> `FH = 206.84 - 0.60 × P - 1.02 × F`

Donde:
- `P` = promedio de sílabas por cada 100 palabras
- `F` = promedio de frases por cada 100 palabras

---

### 📐 Índice de perspicuidad de Szigriszt-Pazos

> `SZ = 206.835 - 62.3 × S/P - P/F`

Donde:
- `S` = número de sílabas en el texto
- `P` = número de palabras en el texto
- `F` = número de oraciones en el texto

---


## Licencia

Este repositorio utiliza la licencia [MIT](LICENSE). Equivale, en espíritu, a una licencia Creative Commons CC-BY para código: podés usar, modificar y compartir este código, siempre que cites a la autora original.
