# Legibilidad

## Objetivo

Explorar una alternativa sencilla y reproducible para calcular la legibilidad de textos en español en R, sin dependencias externas complejas. Para ello se reune una serie de funciones para el análisis de legibilidad en textos en español.

## Funcionalidades

- Conteo de sílabas, palabras, oraciones y párrafos
- Segmentación silábica
- Cálculo de tres índices de legibilidad en español:
  - Fernández Huerta
  - Szigriszt Pazos
  - Gutiérrez de Polini

## Índices de legibilidad
### 📐 Fernández Huerta

> `FH = 206.84 - (0.60 × P) - (1.02 × F)`

Donde:
- `P` = promedio de sílabas por cada 100 palabras
- `F` = promedio de palabras por oración

---

### 📐 Szigriszt Pazos

> `SZ = 206.835 - (62.3 × (sílabas / palabras)) - (palabras / oraciones)`

---

### 📐 Gutiérrez de Polini

> `GP = 95.2 - 0.167 × (sílabas / palabras × 100) - 0.129 × (palabras / oraciones)`

---



## Licencia

Este repositorio utiliza la licencia [MIT](LICENSE). Equivale, en espíritu, a una licencia Creative Commons CC-BY para código: podés usar, modificar y compartir este código, siempre que cites a la autora original.
