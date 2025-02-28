#' Validate schema
#'
#' Vérifie la conformité du schéma d'un df
#'
#' La fonction valide si un df possède exactement les colonnes attendues.
#' Si le schéma ne correspond pas, une erreur est levée.
#'
#' @param df Un dataframe à valider
#'
#' @return Aucun retour explicite. Erreur si le schéma ne correpond pas.
#'
#' @examples
#' df_bon <- data.frame(
#'   Code.du.département = double(),
#'   Libellé.du.département = character(),
#'   Code.de.la.collectivité.à.statut.particulier = double(),
#'   Libellé.de.la.collectivité.à.statut.particulier = character(),
#'   Code.de.la.commune = double(),
#'   Libellé.de.la.commune = character(),
#'   Nom.de.l.élu = character(),
#'   Prénom.de.l.élu = character(),
#'   Code.sexe = character(),
#'   Date.de.naissance = character(),
#'   Code.de.la.catégorie.socio.professionnelle = double(),
#'   Libellé.de.la.catégorie.socio.professionnelle = character(),
#'   Date.de.début.du.mandat = character(),
#'   Libellé.de.la.fonction = character(),
#'   Date.de.début.de.la.fonction = character(),
#'   Code.nationalité = character()
#' )
#'
#' validate_schema(df_bon) #Pas d'erreur
#'
#'df_pas_bon <- data.frame(
#' département = double(),
#' csp = character(),
#' A = 1:5,
#' B = 10:12
#')
#'
#'valide_schema(df_pas_bon) #Erreur : Le schéma des colonnes du dataframe ne correspond pas au format attendu.


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
