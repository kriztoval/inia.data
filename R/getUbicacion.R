#' Devuelve un objeto que representa la ubicacion del ensayo
#'
#' @description Descarga la ubicacion de un ensayo
#' @usage getUbicacion(idEnsayo)
#' @param idEnsayo Identificador del ensayo.
#' @details Esta funcion corresponde solo a una prueba de concepto sobre el paso de formato de estructura de columna unica al formato tabular.
#' @return Un objeto con la posicion del ensayo de la clase \code{ubicacion}
#' @seealso \code{\link{getEnsayo}}, \code{\link{getDatos}}
#' @examples
#' library(inia.data)
#' u <- getUbicacion(idEnsayo = 1)
#' cat("El centroide del ensayo se encuentra en ", u$centroid)
#' @import sp
#' @importFrom dplyr %>%
#' @importFrom sf st_as_sfc st_centroid st_coordinates
#' @importFrom methods as
#' @export
getUbicacion <- function(idEnsayo) {
  ans <- vector(mode = 'list', length = 0)
  class(ans) <- c("ubicacion", class(ans))

  ensayo <- getEnsayo(idEnsayo)
  if (length(ensayo)) {
    wkt <- ensayo[["WKT"]]
    if (!is.null(wkt)) {
      ans$sf <- sf  <- st_as_sfc(wkt)
      ans$centroid <- sf %>% st_centroid %>% st_coordinates
      ans$shapefile <- as(object = sf, Class = "Spatial")
    } else {
      warning("Ubicacion no encontrada.")
    }
  } else {
    stop("")
  }
  return (ans)
}
