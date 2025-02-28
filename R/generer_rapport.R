#' @title Générer un rapport Quarto pour une commune et un département
#'
#' @description Cette fonction génère un rapport HTML se basant sur un modèle quarto stocké dans le dossier 'inst/' du package.
#' Elle utilise les codes de la commune et du département donnée, et sauvegarde le rapport dans un dossier html.
#'
#' @param commune Un code de commune sous forme de chaîne de caractères (ex : "44109").
#' @param departement Un code de département sous forme de chaîne de caractères (ex : "44").
#' @param output Chemin de sortie du fichier HTML généré, sous forme de chaîne de caractères.
#'
#' @return Aucun retour explicite. Un fichier html
#'
#' @examples
#' \dontrun{
#' generer_rapport(
#'   commune = "44109",
#'   departement = "44",
#'   output = "rapport_nantes.html"
#' )
#' }
#'
#' @import quarto
#' @import ggplot2
#'
#' @export
#'
generer_rapport <- function(commune, departement, output) {
  # Chemin du fichier modèle Quarto dans inst/
  chemin_modele <- system.file("modele.qmd", package = "firstlibAdrienALLAIN")

  if (chemin_modele == "") {
    stop("Le fichier modèle.qmd est introuvable dans le package.")
  }

  # Charger le modèle Quarto et remplacer les paramètres dans le YAML
  contenu_modele <- readLines(chemin_modele)

  # Remplacer les paramètres dans le YAML
  contenu_modele <- gsub("commune: .*", paste("commune:", commune), contenu_modele)
  contenu_modele <- gsub("departement: .*", paste("departement:", departement), contenu_modele)

  # Sauvegarder le modèle modifié temporairement
  chemin_modele_temp <- tempfile(fileext = ".qmd")
  writeLines(contenu_modele, chemin_modele_temp)

  # Vérifier si le fichier temporaire a bien été créé
  if (!file.exists(chemin_modele_temp)) {
    stop("Le fichier temporaire du modèle n'a pas été créé.")
  }

  # Générer le rapport avec les paramètres mis à jour
  quarto::quarto_render(
    input = chemin_modele_temp,
    output_file = output,
    execute_params = list(commune = commune, departement = departement)
  )

  message("Rapport généré avec succès : ", output)
}


