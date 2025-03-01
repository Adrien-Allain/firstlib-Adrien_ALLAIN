#' @noRd

plot_code_professions <- function(df){


  code_csp <- df |>
    group_by(Code.de.la.catégorie.socio.professionnelle) |>
    summarise(n = n()) |>
    arrange(desc(n))


  ggplot(code_csp)+
    aes(x = reorder(Code.de.la.catégorie.socio.professionnelle, n) , y = n)+
    geom_bar(stat = "identity", fill = "darkblue")+
    labs(title = "Nombre d'élus par CSP", x = "Code CSP", y = "Nombre d'élus")+
    theme_classic()
}
