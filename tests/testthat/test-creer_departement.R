#Test Vérifier que classe "departement" est ajoutée si pas présente et que la classe a bien été ajoutée

test_that("La classe 'departement' est ajoutée si elle n'est pas présente", {
  df_test <- data.frame(
    Code.du.département = c("44", "78", "13", "22"),
    Libellé.du.département = c("Loire-Atlantique", "Yvelines", "Bouches-du-Rhône", "Côtes-d'Armor")
  )

  # Vérifier que la classe 'departement' n'est pas présente avant
  expect_false("departement" %in% class(df_test))

  # Appeler la fonction creer_departement
  df_test <- creer_departement(df_test)

  # Vérifier que la classe 'departement' a bien été ajoutée
  expect_true("departement" %in% class(df_test))
})
