#' plot ubicacion object
#'
#' plot one or more attributes of an ubicacion object on a map
#' Plot ubicacion object
#'
#' @name plot
#' @method plot ubicacion
#' @param x Ubicacion del ensayo.
#' @param ... Ignorado
#' @importFrom dplyr %>%
#' @importFrom leaflet leaflet addTiles addPolygons addMarkers setView
#' @export
plot.ubicacion = function(x, ...) {
  stopifnot(!is.null(x), inherits(x, "ubicacion"))
  s <- x$shapefile
  if (class(s) == "SpatialPoints") {
    addShapeToMap <- addMarkers
  } else if (class(s) == "SpatialPolygons") {
    addShapeToMap <- addPolygons
  } else {
    stop(paste0('Mapa no implementado para la clase ', class(s)))
  }
  m <- x %>%
    `$`("shapefile") %>%
    leaflet %>%
    addTiles %>%
    addShapeToMap %>%
    setView(lng = x$centroid[1], lat = x$centroid[2], zoom = 12)
  m
}
