#' Plot code professions
#'
#' Visualise le nombre d'élus par catégorie socio-professionnelle (CSP)
#'
#' Cette fonction prend un dataframe contenant des informations sur les élus et
#' génère un graphique à barres représentant le nombre d'élus pour chaque catégorie
#' socio-professionnelle, trié par nombre décroissant.
#'
#' Cette fonction utilise le package `dplyr` pour manipuler le dataframe et le package `ggplot2` pour la visualisation des données.
#'
#' @param df Un dataframe conforme au schéma validé par `validate_schema`.
#'
#' @return Un barplot du nombre d'élus par CSP.
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
#'   Code.de.la.catégorie.socio.professionnelle = c("A", "B", "C", "A", "B", "A"),
#'   Libellé.de.la.catégorie.socio.professionnelle = rep("", 4),
#'   Date.de.début.du.mandat = rep("", 4),
#'   Libellé.de.la.fonction = rep("", 4),
#'   Date.de.début.de.la.fonction = rep("", 4),
#'   Code.nationalité = rep("", 4)
#' )
#' plot_code_professions(df_exemple)
#'
#' @import dplyr
#' @import ggplot2

plot_code_professions <- function(df){
  validate_schema(df)


  code_csp <- df |>
    group_by(Code.de.la.catégorie.socio.professionnelle) |>
    summarise(n = n()) |>
    arrange(desc(n))


  ggplot(code_csp)+
    aes(x = reorder(Code.de.la.catégorie.socio.professionnelle, n) , y = n)+
    geom_bar(stat = "identity", fill = "darkblue")+
    labs(title = "Nombre d'élus par CSP", x = "Code CSP", y = "Nombre d'élus")+
    theme_classic()
}
