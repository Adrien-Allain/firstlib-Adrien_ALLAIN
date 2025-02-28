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
#' @export
#'
generer_rapport <- function(commune, departement, output) {
# chemin du fichier modèle Quarto dans inst/
  chemin_modele <- system.file("modele.qmd", package = "firstlibAdrienALLAIN")

if (chemin_modele == "") {
  stop("Le fichier modèle modele.qmd est introuvable dans le package.")
}

# Générer le rapport avec les paramètres fournis
quarto::quarto_render(
  input = chemin_modele,
  output_file = output,
  execute_params = list(commune = commune, departement = departement)
)

message("Rapport généré avec succès : ", output)

}


