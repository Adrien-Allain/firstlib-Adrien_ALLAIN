#' summary commune
#'
#' Cette fonction génère un résumé des informations relatives à une commune à partir d'un dataframe
#' contenant des informations sur les élus. Elle affiche le nom de la commune, le nombre d'élus,
#' la distribution des âges des élus et les détails de l'élu le plus âgé.
#'
#' @param x Un dataframe conforme au schéma.
#' La classe de l'objet df sera modifié en "commune" si nécessaire.
#'
#' @return La fonction affiche directement un résumé dans la console (utilisation de `cat`)
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
#'   Code.de.la.catégorie.socio.professionnelle = c("A", "B", "C", "A", "B", "A"),
#'   Libellé.de.la.catégorie.socio.professionnelle = rep("", 4),
#'   Date.de.début.du.mandat = rep("", 4),
#'   Libellé.de.la.fonction = rep("", 4),
#'   Date.de.début.de.la.fonction = rep("", 4),
#'   Code.nationalité = rep("", 4)
#' )
#' summary_commune(df_exemple)
#'
#' @export

summary_commune <- function(x){


  # Assignation de la classe 'commune' au dataframe si nécessaire
  if (!"commune" %in% class(x)) { #Si l'objet est pas de classe "commune"
    class(x) <- c("commune", class(x)) #Transforme la classe de l'objet
    cat("La classe de l'objet a été modifiée en 'commune'.\n")
  }

  nom_commune <- unique(x$Libellé.de.la.commune)
  nombre_elus <- compter_nombre_d_elus(x)
  distribution_age <- calcul_distribution_age(x)
  elu_plus_age <- trouver_l_elu_le_plus_age(x)

  #cat pour afficher dans la console.
  cat("Nom de la commune",nom_commune, "\n")
  cat("Nombre d'élu.e.s de la commune",nombre_elus,"\n")
  cat("Ditribution des âges des élu.e.s", distribution_age,"\n")

  #Infos élu le plus âgé
  cat("L'élu.e le/la plus agé.e")
  cat("Nom :", elu_plus_age$Nom.de.l.élu, "\n")
  cat("Prénom :", elu_plus_age$Prénom.de.l.élu, "\n")
  cat("Âge :", elu_plus_age$Âge, "\n")


}
