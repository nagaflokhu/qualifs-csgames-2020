## Langage utilisé

Haskell

## Dépendances

Glasgow Haskell Compiler : https://www.haskell.org/ghc/download.html

## Procédure d'exécution

1. `ghc epreuve1.hs`
2. (Par exemple) `echo 5 | ./epreuve1`

## Explication solution

`padovan_iter` "parcourt" la suite de Padovan. À chaque étape, la fonction
se rappelle des trois derniers éléments de la suite. Ceci lui permet de
calculer le prochain élément. Quand nous arrivons à la position recherchée,
nous retournons le dernier élément calculé.