library(dplyr)
library(lubridate)

#Test validate schema
test_that("DF correspond au schéma",{
  df_test <- data.frame(
    Code.du.département = c("44", "78", "13", "22"),
    Libellé.du.département = c("Loire-Atlantique", "Loire-Atlantique", "Loire-Atlantique", "Loire-Atlantique"),
    Code.de.la.collectivité.à.statut.particulier = c("1","2","3","4"),
    Libellé.de.la.collectivité.à.statut.particulier = c("A","B","C","D"),
    Code.de.la.commune = c("1","2","3","4"),
    Libellé.de.la.commune = c("A","B","C","D"),
    Nom.de.l.élu = c("Nom1", "Nom2", "Nom3","Nom4"),
    Prénom.de.l.élu = c("Prenom1","Prenom2","Prenom3","Prenom4"),
    Code.sexe = c("F","H","H","F"),
    Date.de.naissance = c("01-01-1950", "15-06-1970", "10-09-1985", "10-09-1985"),
    Code.de.la.catégorie.socio.professionnelle = c("1","2","3","4"),
    Libellé.de.la.catégorie.socio.professionnelle = c("A","B","C","D"),
    Date.de.début.du.mandat = c("01-01-1950", "15-06-1970", "10-09-1985", "10-08-2020"),
    Libellé.de.la.fonction = c("A","B","C","D"),
    Date.de.début.de.la.fonction = c("01-01-1950", "15-06-1970", "10-09-1985", "10-08-2020"),
    Code.nationalité = c("FR","FR","FR","FR")
  )



  #la fonction ne doit pas renvoyer d'erreur pour un dataframe valide
  expect_silent(validate_schema(df_test))

})

#Test la fonction sort bien l'affichage correctement

test_that("Les informations sont correctement affichés",{
df_test <- data.frame(
  Code.du.département = c("44", "78", "13", "22"),
  Libellé.du.département = c("Loire-Atlantique", "Loire-Atlantique", "Loire-Atlantique", "Loire-Atlantique"),
  Code.de.la.collectivité.à.statut.particulier = c("1","2","3","4"),
  Libellé.de.la.collectivité.à.statut.particulier = c("A","B","C","D"),
  Code.de.la.commune = c("1","2","3","4"),
  Libellé.de.la.commune = c("A","B","C","D"),
  Nom.de.l.élu = c("Nom1", "Nom2", "Nom3","Nom4"),
  Prénom.de.l.élu = c("Prenom1","Prenom2","Prenom3","Prenom4"),
  Code.sexe = c("F","H","H","F"),
  Date.de.naissance = c("01-01-1950", "15-06-1970", "10-09-1985", "10-09-1985"),
  Code.de.la.catégorie.socio.professionnelle = c("1","2","3","4"),
  Libellé.de.la.catégorie.socio.professionnelle = c("A","B","C","D"),
  Date.de.début.du.mandat = c("01-01-1950", "15-06-1970", "10-09-1985", "10-08-2020"),
  Libellé.de.la.fonction = c("A","B","C","D"),
  Date.de.début.de.la.fonction = c("01-01-1950", "15-06-1970", "10-09-1985", "10-08-2020"),
  Code.nationalité = c("FR","FR","FR","FR")
)

# Capturer la sortie de la fonction summary_departement
output <- capture.output(summary_departement(df_test))

# Vérifier que certaines informations sont présentes dans la sortie
expect_true(any(grepl("Nom du département", output)))
expect_true(any(grepl("Nombre de communes", output)))
expect_true(any(grepl("Nombre d'élus dans le département", output)))
})

#Test : La fonction utilise correctement compter_nombre_d_elus()
test_that("compter_nombre_d_elus fonctionne correctement", {
  # Création d'un jeu de données factice pour le test
  df_test <- data.frame(
    Code.du.département = c("44", "78", "13", "22"),
    Libellé.du.département = c("Loire-Atlantique", "Loire-Atlantique", "Loire-Atlantique", "Loire-Atlantique"),
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

  expect_equal(compter_nombre_d_elus(df_test), 4)


  df_loire_atl <- df_test[df_test$Libellé.du.département == "Loire-Atlantique", ]
  expect_equal(compter_nombre_d_elus(df_loire_atl), 4)

  df_commune_A <- df_test[df_test$Libellé.de.la.commune == "A", ]
  expect_equal(compter_nombre_d_elus(df_commune_A), 1)

  #Test avec un dataframe vide
  df_vide <- df_test[0, ]
  expect_equal(compter_nombre_d_elus(df_vide), 0)

})





