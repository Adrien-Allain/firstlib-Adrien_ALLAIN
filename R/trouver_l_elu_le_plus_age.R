#' @noRd


trouver_l_elu_le_plus_age <- function(df) {
  resultats <- df |>
    mutate(Date.de.naissance = as.Date(Date.de.naissance, format = "%d/%m/%Y")) |>
    slice(which.min(Date.de.naissance)) |>
    mutate(Âge = as.integer(difftime(Sys.Date(), Date.de.naissance, units = "days") / 365.25)) |>
    select(Nom.de.l.élu, Prénom.de.l.élu, Date.de.naissance, Âge)

  return(resultats)
}
