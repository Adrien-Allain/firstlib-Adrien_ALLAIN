---
title: "firstlibAdrienALLAIN"
output:
  html_document:
    code_folding: show
    highlight: morph
---


<!-- badges: start -->
<!-- badges: end -->

# Bienvenue

Bienvenue sur la documentation de **firstlibAdrienALLAIN**, un package sous R pour l'analyse de données des élus municipaux.


## Fonctionnalités 

<div class="bubble">Analyse des élus</div> 
<div class="bubble">Résumés des communes et départements</div> 
<div class="bubble">Génération de rapports pdf automatisés</div>


## Installation

Pour installer le package, utilisez la commande suivante dans R :
``` r
remotes::install_github("Adrien-Allain/firstlibAdrienALLAIN")
```

## Exemple d'utilisation 

Voici un exemple pour illustrer comment utiliser le package dans R : 
``` r
library(firstlibAdrienALLAIN)

summary_departement(data)
```

## Fonctionnalités principales

**`summary_commune()`** : Un résumé des informations concernant une commune comme le nombre d'élus, distribution des âges des élus ou des informations sur l'élu le plus âgé.

**`summary_departement()`** : Un résumé des informations relatives à un département comme le nombre de commune, le nombre d'élus ainsi que des informations concernant l'élu le plus âgé et le plus jeune et des statistiques sur la commune ayant la moyenne d'âge la plus élevée et la plus faible.

**`generer_rapport()`** : Pour générer des rapports au format **PDF** avec des analyses sur les communes et départements.






