#' Trouver l elu le plus age
#'
#' Trouve l'élu le plus âgé dans un df
#'
#' Cette fonction identifie l'élu le plus âgé dans un df conforme au schéma
#' et calcule son âge en années.
#'
#' Cette fonction utilise le package `dplyr` pour manipuler le dataframe.
#'
#' @param df Un dataframe conforme au schéma.
#'
#' @return Un dataframe contenant le nom, prénom, date de naissance et âge de l'élu le plus âgé.
#'
#' @import dplyr
#'
#' @examples
#' df_exemple <- data.frame(
#'   Code.du.département = rep("", 4),
#'   Libellé.du.département = rep("", 4),
#'   Code.de.la.collectivité.à.statut.particulier = rep("", 4),
#'   Libellé.de.la.collectivité.à.statut.particulier = rep("", 4),
#'   Code.de.la.commune = rep("", 4),
#'   Libellé.de.la.commune = rep("", 4),
#'   Nom.de.l.élu = c("Dupont", "Martin"),
#'   Prénom.de.l.élu = c("Jean", "Sophie"),
#'   Code.sexe = rep("", 4),
#'   Date.de.naissance = c("01-01-1950", "15-06-1970"),
#'   Code.de.la.catégorie.socio.professionnelle = rep("", 4),
#'   Libellé.de.la.catégorie.socio.professionnelle = rep("", 4),
#'   Date.de.début.du.mandat = rep("", 4),
#'   Libellé.de.la.fonction = rep("", 4),
#'   Date.de.début.de.la.fonction = rep("", 4),
#'   Code.nationalité = rep("", 4)
#' )

#' trouver_l_elu_le_plus_age(df_exemple)



trouver_l_elu_le_plus_age <- function(df){

  resultats <- df |>
    mutate(Date.de.naissance = dmy(Date.de.naissance)) |>
    slice(which.min(Date.de.naissance)) |>
    mutate(Âge = as.integer(interval(Date.de.naissance, Sys.Date()) / years(1))) |>
    select(Nom.de.l.élu, Prénom.de.l.élu, Date.de.naissance, Âge)

  return(resultats)

}
