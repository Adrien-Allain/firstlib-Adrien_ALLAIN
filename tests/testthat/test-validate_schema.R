#Test 1 df valide
test_that("validate_schema ne lance pas d'erreur pour un dataframe valide", {
  # Création d'un dataframe valide
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


  # Test : la fonction ne doit pas renvoyer d'erreur pour un dataframe valide
  expect_silent(validate_schema(df_test))
})

#Test 2 df invalide
test_that("validate_schema lance une erreur pour un dataframe avec une colonne manquante", {
  # Création d'un dataframe invalide (colonne manquante)
  df_invalide_colonne_manquante <- data.frame(
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
    Date.de.début.de.la.fonction = c("01-01-1950", "15-06-1970", "10-09-1985", "10-08-2020")
  )

  # Test : la fonction doit renvoyer une erreur pour un dataframe avec une colonne manquante
  expect_error(validate_schema(df_invalide_colonne_manquante),
               "Erreur : Le schéma des colonnes du dataframe ne correspond pas au format attendu.")
})
