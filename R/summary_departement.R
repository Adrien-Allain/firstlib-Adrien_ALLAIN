#' summary departement
#'
#'Cette fonction génère un résumé des informations relatives à un département à partir d'un dataframe contenant des informations sur les élus.
#' Elle affiche le nom du département, le nombre de communes, d'élus et la distribution d'âge des élus dans celui ci. La fonction
#' affiche aussi les informations de l'élu le plus âgée et le plus jeune du département ainsi que les statistiques de la commune
#' avec la moyenne d'âge la plus faible et la plus élevée.
#'
#' Cette fonction utilise le package `dplyr` pour manipuler le dataframe.
#'
#' @param x Un dataframe conforme au schéma.
#' La classe de l'objet df sera modifié en "departement" si nécessaire.
#'
#' @return La fonction affiche directement un résumé dans la console (utilisation de `cat`)
#'
#' @examples
#' df_exemple <- data.frame(
#'   Code.du.département = c("1","1","1","1"),
#'   Libellé.du.département = c("A","A","A","A"),
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
#' summary_departement(df_exemple)
#'
#' @export
#'
#' @import dplyr
#'

summary_departement <- function(x){


  if (!"departement" %in% class(x)) { #Si l'objet est pas de classe "departement"
    class(x) <- c("departement", class(x)) #Transforme la classe de l'objet
  }

  nom_departement <- unique(x$Libellé.du.département)

  nombre_commune <- length(unique(x$Libellé.de.la.commune))

  nombre_elu <- compter_nombre_d_elus(x)

  distribution_age <- calcul_distribution_age(x)

  #nom et âge de l'élu le plus âgé commune

  elu_plus_age <- trouver_l_elu_le_plus_age(x)

  #Nom et âge de l'élu le plus jeune

  trouver_l_elu_le_plus_jeune <- function(df){

    validate_schema(df)

    resultats <- df |>
      mutate(Date.de.naissance = as.Date(Date.de.naissance, format = "%d/%m/%Y")) |>
      slice(which.max(Date.de.naissance)) |>
      mutate(Âge = as.integer(difftime(Sys.Date(), Date.de.naissance, units = "days") / 365.25))

    return(resultats)
  }


  elu_le_plus_jeune <- trouver_l_elu_le_plus_jeune(x)

  # Analyse des communes par moyenne d'âge
  communes_stats <- x |>
    mutate(
      Date.de.naissance = as.Date(Date.de.naissance, format = "%d/%m/%Y"),
      Age = as.integer(difftime(Sys.Date(), Date.de.naissance, units = "days") / 365.25)) |>
    group_by(Libellé.de.la.commune) |>
    summarise(
      age_moyen = mean(Age, na.rm = TRUE),
      min_age = min(Age, na.rm = TRUE),
      q1_age = quantile(Age, 0.25, na.rm = TRUE),
      mediane_age = median(Age, na.rm = TRUE),
      q3_age = quantile(Age, 0.75, na.rm = TRUE),
      max_age = max(Age, na.rm = TRUE)
    )

  # communes avec les moyennes d'âge plus faible et plus élevée
  commune_plus_jeune <- communes_stats |>
    filter(age_moyen == min(age_moyen, na.rm = TRUE))

  commune_plus_agee <- communes_stats |>
    filter(age_moyen == max(age_moyen, na.rm = TRUE))


  #Affichage des résultats

  cat("Nom du département: ",nom_departement, "\n")
  cat("Nombre de communes: ",nombre_commune,"\n")
  cat("Nombre d'élus dans le département: ", nombre_elu,"\n")
  cat("\nDistribution des âges des élu.e.s :", "\n")
  print(distribution_age)


  ##Infos élu le plus âgé
  cat("\nL'élu.e le/la plus agé.e du département:\n")
  cat("- Nom :", elu_plus_age$Nom.de.l.élu, "\n")
  cat("- Prénom :", elu_plus_age$Prénom.de.l.élu, "\n")
  cat("- Âge :", elu_plus_age$Âge,"ans\n")

  ##Infos élu le plus jeune
  cat("\nL'élu.e le/la plus jeune du département:\n")
  cat("- Nom :",  elu_le_plus_jeune $Nom.de.l.élu, "\n")
  cat("- Prénom :",  elu_le_plus_jeune$Prénom.de.l.élu, "\n")
  cat("- Âge :",  elu_le_plus_jeune$Âge, "ans\n")


  ## Affichage des statistiques par commune
  cat("\nCommune avec la moyenne d'âge la plus faible:", commune_plus_jeune$Libellé.de.la.commune, "\n")
  cat("Distribution des âges dans la commune:\n")
  cat("- Moyenne:", round(commune_plus_jeune$age_moyen, 1), "ans\n")
  cat("- Minimum:", commune_plus_jeune$min_age, "ans\n")
  cat("- 1er quartile:", commune_plus_jeune$q1_age, "ans\n")
  cat("- Médiane:", commune_plus_jeune$mediane_age, "ans\n")
  cat("- 3ème quartile:", commune_plus_jeune$q3_age, "ans\n")
  cat("- Maximum:", commune_plus_jeune$max_age, "ans\n")

  cat("\nCommune avec la moyenne d'âge la plus élevée:", commune_plus_agee$Libellé.de.la.commune, "\n")
  cat("Distribution des âges dans la commune:\n")
  cat("- Moyenne:", round(commune_plus_agee$age_moyen, 1), "ans\n")
  cat("- Minimum:", commune_plus_agee$min_age, "ans\n")
  cat("- 1er quartile:", commune_plus_agee$q1_age, "ans\n")
  cat("- Médiane:", commune_plus_agee$mediane_age, "ans\n")
  cat("- 3ème quartile:", commune_plus_agee$q3_age, "ans\n")
  cat("- Maximum:", commune_plus_agee$max_age, "ans\n")

}
