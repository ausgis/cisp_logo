m = matrix(2,nrow = 15, ncol = 15)
zone1_indice = c(6:9,seq(8,by = -1,length.out = 6))
for (i in seq_along(zone1_indice)) {
  m[seq(1,zone1_indice[i]),i] = 1
}
m[,11:15] = 3
m[13,11] = 2
m[14,11:12] = 2
m[15,11:13] = 2

library(sf)
library(terra)
r = terra::rast(m, crs = "EPSG:4326")
names(r) = 'simx_strata'
simx = sf::st_as_sf(terra::as.points(r))
simx

strata1 = tibble::tibble(
  x = c(0,0,3.5,10,10),
  y = c(15,9.5,6,12.5,15)
) |>
  sf::st_as_sf(coords = c("x","y"), crs = 4326) |>
  sf::st_combine() |>
  sf::st_cast("POLYGON")

strata2 = tibble::tibble(
  x = c(0,0,3.5,10,10,13.5),
  y = c(0,9.5,6,12.5,3.5,0)
) |>
  sf::st_as_sf(coords = c("x","y"), crs = 4326) |>
  sf::st_combine() |>
  sf::st_cast("POLYGON")

strata3 = tibble::tibble(
  x = c(15,15,10,10,13.5),
  y = c(0,15,15,3.5,0)
) |>
  sf::st_as_sf(coords = c("x","y"), crs = 4326) |>
  sf::st_combine() |>
  sf::st_cast("POLYGON")

strata = sf::st_sf(stratas = c(1,2,3),
                   geometry = do.call(c, list(strata1,strata2,strata3)))

ggplot2::ggplot() +
  ggplot2::geom_sf(data = strata, fill = 'transparent',
                   color = 'grey10', lwd = 0.75) +
  ggplot2::geom_sf(data = simx,
                   ggplot2::aes(color = factor(simx_strata)),
                   show.legend = FALSE) +
  ggplot2::labs(color = 'Strata') +
  ggplot2::theme_void() +
  ggview::canvas(3.15,3.15)