
#' @export
#'
generer_rapport2 <- function(code_commune, code_departement, output) {
  # Chemin du fichier modèle Quarto dans inst/
  chemin_modele <- system.file("modele.qmd", package = "firstlibAdrienALLAIN")

  if (chemin_modele == "") {
    stop("Le fichier modele.qmd est introuvable dans le package.")
  }

  # Créer un dossier de sortie spécifique
  output_dir <- dirname(output)  # Extraire le dossier parent du fichier de sortie
  if (!dir.exists(output_dir)) {
    dir.create(output_dir, recursive = TRUE)  # Créer le dossier s'il n'existe pas
  }

  # Définir le répertoire de travail temporairement
  old_wd <- setwd(output_dir)
  on.exit(setwd(old_wd))  # Restaurer le répertoire de travail à la fin

  # Générer le rapport avec les paramètres fournis
  quarto::quarto_render(
    input = chemin_modele,
    output_file = basename(output),  # Utiliser uniquement le nom du fichier
    execute_params = list(code_commune = code_commune, code_departement = code_departement)
  )

  message("Rapport généré avec succès : ", output)
}
