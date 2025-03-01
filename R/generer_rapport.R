#' @title Générer rapport
#'
#' @description Cette fonction génère un rapport PDF se basant sur un modèle quarto stocké dans le dossier 'inst/' du package.
#' Elle utilise les codes de la commune et du département donnée, et sauvegarde le rapport en .pdf à la racine.
#'
#' @param commune Un code de commune sous forme de chaîne de caractères (ex : "44109").
#' @param departement Un code de département sous forme de chaîne de caractères (ex : "44").
#' @param output Le nom de sortie du fichier pdf généré, sous forme de chaîne de caractères.
#'
#' @return Aucun retour explicite. Un fichier PDF
#'
#' @examples
#' \dontrun{
#' generer_rapport(
#'   commune = "44109",
#'   departement = "44",
#'   output = "rapport_nantes.pdf"
#' )
#' }
#'
#' @import quarto
#' @import ggplot2
#'
#' @export
#'
generer_rapport <- function(code_commune, code_departement, output) {
# chemin du fichier modèle Quarto dans inst/
  chemin_modele <- system.file("modele.qmd", package = "firstlibAdrienALLAIN")

if (chemin_modele == "") {
  stop("Le fichier modele.qmd est introuvable dans le package.")
}


# Générer le rapport avec les paramètres fournis
quarto::quarto_render(
  input = chemin_modele,
  output_file = output,
  execute_params = list(code_commune = code_commune, code_departement = code_departement),
)


message("Rapport pdf généré avec succès : ", output)

}


