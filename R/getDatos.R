#' Descarga todos las muestras
#'
#' @description Descarga todas las muestras de la base de datos de los programas de mejoramiento genetico de INIA.
#' @usage getDatos()
#' @details Esta funcion corresponde solo a una prueba de concepto sobre el paso de formato de estructura de columna unica al formato tabular.
#' @return Un objeto de clase data.frame que incluye las lecturas de la base de datos.
#' @seealso
#' La funcion \code{\link{getEnsayo}} muestra un ejemplo de comunicacion con el servicio web y \code{\link{getUbicacion}} muestra ejemplo de postproceso.
#' @examples
#' library(inia.data)
#' # Descarga de datos
#' d <- getDatos()
#' class(d)
#' head(d)
#' @importFrom stats reshape
#' @importFrom stringr str_replace_all
#' @importFrom dplyr %>%
#' @export
getDatos <- function() {
  datos <- wsurl.muestra %>%
    ws2df %>%
    reshape(direction = "wide", idvar = "UniExp", timevar = "Variables")

  names(datos) <- str_replace(string = names(datos), pattern = "^Valor\\.", replacement = "")

  return (datos)
}
