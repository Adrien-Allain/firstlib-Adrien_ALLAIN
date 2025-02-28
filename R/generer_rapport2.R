
#' @export
#'
generer_rapport2 <- function(commune, departement, output) {
  quarto::quarto_render(
    input = file.path("Users","adrienallain","Desktop","Master","S2","R avancé","Projet","firstlibAdrienALLAIN",
                      "inst", "modele.qmd"),

    output_file = output,
    execute_params = list(
      code_commune = commune,
      code_departement = departement
    )
  )
}
