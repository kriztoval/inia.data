test_that("Conexion con webservice de Muestra", {
  expect_equal(object = GET(wsurl.muestra)$status_code, expected = 200)
})

test_that("Conexion con webservice de Ensayo", {
  expect_equal(object = GET(wsurl.ensayo)$status_code, expected =  200)
})
