# URL del WebService de desarrollo (por ahora)
wsurl <- "http://200.54.96.8/iniapmg"
wsurl.muestra <- paste0(wsurl, "/muestra/get/")
wsurl.ensayo <- paste0(wsurl, "/ensayo/get/")

#' @importFrom httr GET content
#' @importFrom jsonlite fromJSON
#' @importFrom stringr str_replace
ws2df <- function(ws) {
  ans <- ws %>%
    GET %>%
    content(as = "text", encoding = "UTF-8") %>%
    fromJSON %>%
    as.data.frame
  names(ans) <- str_replace(string = names(ans), pattern = "^X[\\d]+\\.", replacement = "")
  return(ans)
}
