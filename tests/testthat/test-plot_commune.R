library(dplyr)
library(purrr)
library(lubridate)
library(ggplot2)


# Test 1 : Vérifier l'appel de validate_schema et la gestion de plusieurs communes
test_that("La fonction vérifie que le dataframe contient une seule commune et appelle validate_schema", {
  df_multiple_communes <- data.frame(
    Code.du.département = c("44", "78", "13", "22"),
    Libellé.du.département = c("Loire-Atlantique", "Yvelines", "Bouches-du-Rhône", "Côtes-d'Armor"),
    Code.de.la.collectivité.à.statut.particulier = c("1","2","3","4"),
    Libellé.de.la.collectivité.à.statut.particulier = c("A","B","C","D"),
    Code.de.la.commune = c("1","2","3","4"),
    Libellé.de.la.commune = c("A","B","C","D"),
    Nom.de.l.élu = c("Nom1", "Nom2", "Nom3","Nom4"),
    Prénom.de.l.élu = c("Prenom1","Prenom2","Prenom3","Prenom4"),
    Code.sexe = c("F","H","H","F"),
    Date.de.naissance = c("01-01-1950", "15-06-1970", "10-09-1985", "pas une date"),
    Code.de.la.catégorie.socio.professionnelle = c("1","2","3","4"),
    Libellé.de.la.catégorie.socio.professionnelle = c("A","B","C","D"),
    Date.de.début.du.mandat = c("01-01-1950", "15-06-1970", "10-09-1985", "10-08-2020"),
    Libellé.de.la.fonction = c("A","B","C","D"),
    Date.de.début.de.la.fonction = c("01-01-1950", "15-06-1970", "10-09-1985", "10-08-2020"),
    Code.nationalité = c("FR","FR","FR","FR")
  )
  # Test si la fonction génère une erreur pour plusieurs communes
  expect_error(plot_commune(df_multiple_communes), "Le df contient plusieurs communes")

})
#Test 2 Vérifie si le titre est réalisé comme demandé
test_that("plot_commune affiche correctement le titre avec le nom de la commune et du département", {
  df_1_commune <- data.frame(
    Code.du.département = c("44", "78", "13", "22"),
    Libellé.du.département = c("1", "1", "1", "1"),
    Code.de.la.collectivité.à.statut.particulier = c("1","2","3","4"),
    Libellé.de.la.collectivité.à.statut.particulier = c("A","B","C","D"),
    Code.de.la.commune = c("1","1","1","1"),
    Libellé.de.la.commune = c("A","A","A","A"),
    Nom.de.l.élu = c("Nom1", "Nom2", "Nom3","Nom4"),
    Prénom.de.l.élu = c("Prenom1","Prenom2","Prenom3","Prenom4"),
    Code.sexe = c("F","H","H","F"),
    Date.de.naissance = c("01-01-1950", "15-06-1970", "10-09-1985", "pas une date"),
    Code.de.la.catégorie.socio.professionnelle = c("1","2","3","4"),
    Libellé.de.la.catégorie.socio.professionnelle = c("A","B","C","D"),
    Date.de.début.du.mandat = c("01-01-1950", "15-06-1970", "10-09-1985", "10-08-2020"),
    Libellé.de.la.fonction = c("A","B","C","D"),
    Date.de.début.de.la.fonction = c("01-01-1950", "15-06-1970", "10-09-1985", "10-08-2020"),
    Code.nationalité = c("FR","FR","FR","FR")
  )
  # Générer le graphique
  plot_obj <- plot_commune(df_1_commune)

  # Extraire le titre du graphique
  plot_data <- ggplot_build(plot_obj)
  plot_title <- plot_data$plot$labels$title

  # Vérifier que le titre contient la commune et le département
  expect_true(grepl("A - 1", plot_title))
})
