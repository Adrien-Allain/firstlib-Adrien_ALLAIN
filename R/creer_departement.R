#' Creer departement
#'
#' Crée un objet de classe "departement"
#'
#' Cette fonction prend un dataframe en entrée et lui ajoute la classe "departement".
#' La classe originale du dataframe est conservée, et "departement" est simplement
#' ajoutée comme classe supplémentaire.

#' @param df Un dataframe

#' @return Le même dataframe avec la classe "departement" ajoutée
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
#'   Date.de.naissance = c("", 4),
#'   Code.de.la.catégorie.socio.professionnelle = rep("", 4),
#'   Libellé.de.la.catégorie.socio.professionnelle = rep("", 4),
#'   Date.de.début.du.mandat = rep("", 4),
#'   Libellé.de.la.fonction = rep("", 4),
#'   Date.de.début.de.la.fonction = rep("", 4),
#'   Code.nationalité = rep("", 4)
#' )
#' creer_departement(df_exemple)
#'
#' @export

creer_departement <- function(df){

  if (!"departement" %in% class(df)) {
    class(df) <- c("departement", class(df))
    cat("La classe de l'objet a été modifiée en 'departement'.\n")
  }
  return(df)
}
