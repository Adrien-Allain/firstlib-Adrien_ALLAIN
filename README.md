---
title: "firstlibAdrienALLAIN"
output:
  html_document:
    code_folding: show
    highlight: espresso
---


<!-- badges: start -->
<!-- badges: end -->

# Aperçu

**firstlibAdrienALLAIN** est un package sous R pour l'analyse de données des élus municipaux.


## Fonctionnalités 

- `Analyse des élus`
- `Résumés des communes et départements`
- `Génération de rapports pdf automatisés`


## Installation

Vous pouvez installer la version de développement du package directement depuis GitHub en utilisant cette commande : 
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


## Obtenir de l'aide 

Si vous rencontrez des difficultés à utiliser certaines fonctions ou si vous voulez signaler un bug, vous pouvez me contacter à cette email : adrienallain4@gmail.com

## Contribuer 

Pour contribuer au développement de ce package, cela se passe sur GitHub ! (https://github.com/Adrien-Allain/firstlib-Adrien_ALLAIN)


