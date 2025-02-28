#' Plot departement
#'
#' Cette fonction génère un graphique (barplot) pour chaque code professionnel et le nombre
#' d’élus ayant ce code.
#'
#' Cette fonction utilise le package `dplyr` pour manipuler le dataframe et le package `ggplot2` pour la visualisation des données.
#'
#' @param df Un dataframe d'un unique département et conforme au schéma validé
#' par`validate_schema`
#'
#' @return Un diagramme en barres des catégories socio-professionnelles pour la commune donnée.
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
#' plot_departement(df_exemple)
#'
#' @export
#' @import dplyr
#' @import ggplot2

plot_departement <- function(df){
  validate_schema(df)

  nombre_commune <- length(unique(df$Libellé.de.la.commune))
  nom_departement <- unique(df$Libellé.du.département)


  if(length(nom_departement)>1){
    stop("Le df contient plusieurs départements")
  }



  code_csp <- df |>
    group_by(Code.de.la.catégorie.socio.professionnelle) |>
    summarise(n = n()) |>
    arrange(desc(n)) |>
    slice_max(n, n = 10 )


  ggplot(code_csp)+
    aes(x = reorder(Code.de.la.catégorie.socio.professionnelle, n), y = n)+
    geom_bar(stat = "identity", fill = "darkblue")+
    labs(title = paste(nom_departement, "-",nombre_commune, "communes"), x = paste("Libellés des 10 codes professionnels les plus représentés
pour le département", nom_departement), y = "Nombre d'élus")+
    theme_classic()
}
