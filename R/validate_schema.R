#' @noRd


validate_schema <- function(df) {
  schema <- c("Code.du.département",
              "Libellé.du.département",
              "Code.de.la.collectivité.à.statut.particulier",
              "Libellé.de.la.collectivité.à.statut.particulier",
              "Code.de.la.commune",
              "Libellé.de.la.commune",
              "Nom.de.l.élu",
              "Prénom.de.l.élu",
              "Code.sexe",
              "Date.de.naissance",
              "Code.de.la.catégorie.socio.professionnelle",
              "Libellé.de.la.catégorie.socio.professionnelle",
              "Date.de.début.du.mandat",
              "Libellé.de.la.fonction",
              "Date.de.début.de.la.fonction",
              "Code.nationalité")

  if (!identical(colnames(df), schema)) {
    stop("Erreur : Le schéma des colonnes du dataframe ne correspond pas au format attendu.")
  }

}
