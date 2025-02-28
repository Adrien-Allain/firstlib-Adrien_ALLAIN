library(dplyr)
library(lubridate)


# Test 1 : Vérification de l'affichage des informations de la commune
test_that("Les informations de la commune sont correctement affichées", {
  # Création dataframe de test
  df_test <- data.frame(
    Code.du.département = c("44", "78", "13", "22"),
    Libellé.du.département = c("Loire-Atlantique", "Yvelines", "Bouches-du-Rhône", "Côtes-d'Armor"),
    Code.de.la.collectivité.à.statut.particulier = c("1", "2", "3", "4"),
    Libellé.de.la.collectivité.à.statut.particulier = c("A", "B", "C", "D"),
    Code.de.la.commune = c("1", "1", "1", "1"),
    Libellé.de.la.commune = c("A", "A", "A", "A"),
    Nom.de.l.élu = c("Nom1", "Nom2", "Nom3", "Nom4"),
    Prénom.de.l.élu = c("Prenom1", "Prenom2", "Prenom3", "Prenom4"),
    Code.sexe = c("F", "H", "H", "F"),
    Date.de.naissance = c("01-01-1950", "15-06-1970", "10-09-1985", "10-09-1985"),
    Code.de.la.catégorie.socio.professionnelle = c("1", "2", "3", "4"),
    Libellé.de.la.catégorie.socio.professionnelle = c("A", "B", "C", "D"),
    Date.de.début.du.mandat = c("01-01-1950", "15-06-1970", "10-09-1985", "10-08-2020"),
    Libellé.de.la.fonction = c("A", "B", "C", "D"),
    Date.de.début.de.la.fonction = c("01-01-1950", "15-06-1970", "10-09-1985", "10-08-2020"),
    Code.nationalité = c("FR", "FR", "FR", "FR")
  )

  # Capturer la sortie de la fonction summary_commune
  output <- capture.output(summary_commune(df_test))

  # Vérifier que certaines informations sont présentes dans la sortie
  expect_true(any(grepl("Nom de la commune", output)))
  expect_true(any(grepl("Nombre d'élu.e.s de la commune", output)))
  expect_true(any(grepl("L'élu.e le/la plus agé.e", output)))
})

# Test 2 : Vérifier que la fonction utilise correctement 'compter_nombre_d_elus'
test_that("summary_commune utilise correctement compter_nombre_d_elus", {
  df_test <- data.frame(
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
  class(df_test) <- c("commune", class(df_test))  # Ajouter le type 'commune'

  # Vérifier que 'compter_nombre_d_elus' retourne bien 4
  expect_equal(compter_nombre_d_elus(df_test), 4)
})
