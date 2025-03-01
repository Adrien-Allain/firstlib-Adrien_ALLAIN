#' @noRd
compter_nombre_d_elus <- function(df){
  #Création du schéma à respecter

  df |>
    select(Nom.de.l.élu,Prénom.de.l.élu,Date.de.naissance) |> #parmis ces colonnes :
    distinct() |> #Garde uniquement les lignes uniques (équivalent de unique)
    nrow() #Retourne le nombre de lignes
}
