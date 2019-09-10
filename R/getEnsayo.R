#' Descarga metadatos de un ensayo
#'
#' @description Descarga metadatos de un ensayo seleccionado de la base de datos de los programas de mejoramiento genetico.
#' @usage getEnsayo(idEnsayo)
#' @param idEnsayo Identificador del ensayo.
#' @details Esta funcion es una prueba de concepto de una consulta a la base de datos con un cierto predicado: Devolver solo los valores correspondientes a una estacion.
#' @return Un objeto de clase data.frame con los metadatos del ensayo solicitado.
#' @seealso \code{\link{getUbicacion}}, \code{\link{getDatos}}
#' @examples
#' library(inia.data)
#' # Descarga de metadatos del ensayo
#' A <- getEnsayo(idEnsayo = 3)
#' B <- getEnsayo(idEnsayo = 4)
#' A
#' B
#' @importFrom httr GET content
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr %>%
#' @export
getEnsayo <- function(idEnsayo) {
  ensayos <- wsurl.ensayo %>%
    paste0(idEnsayo-1) %>%
    ws2df
}
