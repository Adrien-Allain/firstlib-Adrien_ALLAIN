#' @noRd

compter_nombre_d_adjoints <- function(df){


  df |>
    select(Libellé.de.la.fonction) |>
    filter(grepl("adjoint", tolower(Libellé.de.la.fonction))) |>
    nrow()

}
