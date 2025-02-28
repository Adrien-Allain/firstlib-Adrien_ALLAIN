#Test Vérifier que classe "commune" est ajoutée si pas présente et que la classe a bien été ajoutée

test_that("La classe 'commune' est ajoutée si elle n'est pas présente", {
  df_test <- data.frame(
    Code.du.département = c("44", "78", "13", "22"),
    Libellé.du.département = c("Loire-Atlantique", "Yvelines", "Bouches-du-Rhône", "Côtes-d'Armor")
  )

  # Vérifier que la classe 'commune' n'est pas présente avant
  expect_false("commune" %in% class(df_test))

  # Appeler la fonction creer_commune
  df_test <- creer_commune(df_test)

  # Vérifier que la classe 'commune' a bien été ajoutée
  expect_true("commune" %in% class(df_test))
})
