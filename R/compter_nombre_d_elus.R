#' Compter nombre d elus
#'
#' Compte le nombre d'élus dans un df
#'
#' Cette fonction utilise le package `dplyr` pour manipuler le dataframe.
#'
#' @param df Un df conforme au schéma validé par la fonction `validate_schema`
#'
#' @return Un entier représentant le nombre d'adjoints
#'
#' @examples
#' df <- data.frame(
#'   Code.du.département = rep("", 4),
#'   Libellé.du.département = rep("", 4),
#'   Code.de.la.collectivité.à.statut.particulier = rep("", 4),
#'   Libellé.de.la.collectivité.à.statut.particulier = rep("", 4),
#'   Code.de.la.commune = rep("", 4),
#'   Libellé.de.la.commune = rep("", 4),
#'   Nom.de.l.élu = rep("", 4),
#'   Prénom.de.l.élu = rep("", 4),
#'   Code.sexe = rep("", 4),
#'   Date.de.naissance = c("01-01-1950", "15-06-1970", "10-09-1985", "not a date"),
#'   Code.de.la.catégorie.socio.professionnelle = rep("", 4),
#'   Libellé.de.la.catégorie.socio.professionnelle = rep("", 4),
#'   Date.de.début.du.mandat = rep("", 4),
#'   Libellé.de.la.fonction = c("Maire", "3ème adjoint au Maire", "2ème adjoint au Maire", "Adjoint"),
#'   Date.de.début.de.la.fonction = rep("", 4),
#'   Code.nationalité = rep("", 4)
#' )

#' compter_nombre_d_elus(df)

#' @import dplyr

compter_nombre_d_elus <- function(df){
  #Création du schéma à respecter
  validate_schema(df)

  df |>
    select(Nom.de.l.élu,Prénom.de.l.élu,Date.de.naissance) |> #parmis ces colonnes :
    distinct() |> #Garde uniquement les lignes uniques (équivalent de unique)
    nrow() #Retourne le nombre de lignes
}
