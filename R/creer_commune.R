#' Creer commune
#'
#' Crée un objet de classe "commune"
#'
#' Cette fonction prend un dataframe en entrée et lui ajoute la classe "commune".
#' La classe originale du dataframe est conservée, et "commune" est simplement
#' ajoutée comme classe supplémentaire.

#' @param df Un dataframe

#' @return Le même dataframe avec la classe "commune" ajoutée
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
#' creer_commune(df_exemple)
#'
#'
#'
#' @export

creer_commune <- function(df){


  if (!"commune" %in% class(df)) {
    class(df) <- c("commune", class(df))
    cat("La classe de l'objet a été modifiée en 'commune'.\n")
  }
  return(df)
}

