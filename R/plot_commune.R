#' Plot commune
#'
#' Cette fonction génère un graphique (barplot) pour chaque code professionnel et le nombre
#' d’élus ayant ce code.
#'
#' Cette fonction utilise le package `dplyr` pour manipuler le dataframe et le package `ggplot2` pour la visualisation des données.
#'
#' @param df Un dataframe d'une unique commune et conforme au schéma.
#'
#' @return Un diagramme en barres des catégories socio-professionnelles pour la commune donnée.
#'
#' @examples
#' df_exemple <- data.frame(
#'   Code.du.département = rep("", 4),
#'   Libellé.du.département = rep("", 4),
#'   Code.de.la.collectivité.à.statut.particulier = rep("", 4),
#'   Libellé.de.la.collectivité.à.statut.particulier = rep("", 4),
#'   Code.de.la.commune = c("1","1","1","1"),
#'   Libellé.de.la.commune = c("A","A","A","A"),
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
#' plot_commune(df_exemple)
#'
#' @export
#'
#' @import dplyr
#' @import ggplot2

plot_commune <- function(df){

  nom_commune <- unique(df$Libellé.de.la.commune)
  nom_departement <- unique(df$Libellé.du.département)


  if(length(nom_commune)>1){
    stop("Le df contient plusieurs communes")
  }


  code_csp <- df |>
    group_by(Code.de.la.catégorie.socio.professionnelle) |>
    summarise(n = n()) |>
    arrange(desc(n))


  p <- ggplot(code_csp)+
    aes(x = reorder(Code.de.la.catégorie.socio.professionnelle, n), y = n)+
    geom_bar(stat = "identity", fill = "darkblue")+
    labs(title = paste(nom_commune, "-",nom_departement), x = paste("Libellés des codes professionnels pour les élus (", compter_nombre_d_elus(df), " élus)", sep = ""), y = "Nombre d'élus")+
    theme_classic()

  return(p)
}
