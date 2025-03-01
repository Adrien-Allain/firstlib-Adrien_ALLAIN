#' @noRd


calcul_distribution_age <- function(df) {


  df$Date.de.naissance <- as.Date(df$Date.de.naissance, format = "%d/%m/%Y")

  df$Valid.Date <- !is.na(df$Date.de.naissance)

  current_date <- Sys.Date()
  df$Age <- as.integer((current_date - df$Date.de.naissance) / 365.25)

  # Calculer les quantiles
  quantiles <- quantile(df$Age, probs = c(0, 0.25, 0.5, 0.75, 1), na.rm = TRUE)

  return(quantiles)
}
