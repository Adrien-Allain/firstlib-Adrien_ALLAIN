library(testthat)
library(dplyr)
library(lubridate)

# Création d'un dataframe de test
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
  Date.de.naissance = c("01-01-1950", "15-06-1970", "10-09-1985", "Pas une date"),
  Code.de.la.catégorie.socio.professionnelle = c("1","2","3","4"),
  Libellé.de.la.catégorie.socio.professionnelle = c("A","B","C","D"),
  Date.de.début.du.mandat = c("01-01-1950", "15-06-1970", "10-09-1985", "10-08-2020"),
  Libellé.de.la.fonction = c("A","B","C","D"),
  Date.de.début.de.la.fonction = c("01-01-1950", "15-06-1970", "10-09-1985", "10-08-2020"),
  Code.nationalité = c("FR","FR","FR","FR")
)



# Test de la pertinence des résultats pour un jeu de données fixé
test_that("calcul_distribution_age retourne des quantiles corrects", {
  result <- suppressWarnings(calcul_distribution_age(df_test))
  expect_type(result, "double") # Vérifie que la sortie est numérique
  expect_length(result, 5) # Vérifie qu'on obtient bien 5 quantiles
})


