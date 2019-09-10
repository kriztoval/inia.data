require(iniapmg)
id <- 4 # Ensayo de arroz
e <- getEnsayo(id)
u <- getUbicacion(id)
plot(u, main=e$Ensayos.Nombre)
