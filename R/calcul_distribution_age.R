#' Calcul distribution âge
#'
#' Calcule la distribution des âges dans un df
#'
#' La fonction valide le schéma du dataframe, convertit les dates de naissance en format date,
#' calcule l'âge des individus et retourne les quantiles de la distribution des âges.
#' Avertissement si des dates de naissance invalides sont détectées.
#'
#' Cette fonction utilise le package `stats` pour calculer les quantiles
#'
#'
#' @param df Un dataframe conforme au schéma validé par `validate_schema`.
#'
#' @return Un vecteur numérique contenant les quantiles (0%, 25%, 50%, 75%, 100%) de la distribution des âges.
#'
#' @examples
#' df_exemple <- data.frame(
#'   Code.du.département = rep("", 4),
#'   Libellé.du.département = rep("", 4),
#'   Code.de.la.collectivité.à.statut.particulier = rep("", 4),
#'   Libellé.de.la.collectivité.à.statut.particulier = rep("", 4),
#'   Code.de.la.commune = rep("", 4),
#'   Libellé.de.la.commune = rep("", 4),
#'   Nom.de.l.élu = rep("", 4),
#'   Prénom.de.l.élu = rep("", 4),
#'   Code.sexe = rep("", 4),
#'   Date.de.naissance = c("01-01-1950", "15-06-1970", "10-09-1985", "pas une date"),
#'   Code.de.la.catégorie.socio.professionnelle = rep("", 4),
#'   Libellé.de.la.catégorie.socio.professionnelle = rep("", 4),
#'   Date.de.début.du.mandat = rep("", 4),
#'   Libellé.de.la.fonction = rep("", 4),
#'   Date.de.début.de.la.fonction = rep("", 4),
#'   Code.nationalité = rep("", 4)
#' )
#' calcul_distribution_age(df_exemple)
#'
#' @importFrom stats quantile

calcul_distribution_age <- function(df) {
  validate_schema(df)


  df$Date.de.naissance <- as.Date(df$Date.de.naissance, format = "%d/%m/%Y")

  df$Valid.Date <- !is.na(df$Date.de.naissance)

  current_date <- Sys.Date()
  df$Age <- as.integer((current_date - df$Date.de.naissance) / 365.25)

  # Calculer les quantiles
  quantiles <- quantile(df$Age, probs = c(0, 0.25, 0.5, 0.75, 1), na.rm = TRUE)

  return(quantiles)
}
