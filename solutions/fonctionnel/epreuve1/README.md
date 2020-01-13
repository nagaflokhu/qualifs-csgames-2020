## Langage utilisé

Haskell

## Dépendances

Glasgow Haskell Compiler : https://www.haskell.org/ghc/download.html

## Version 1

### Procédure d'exécution

1. `ghc epreuve1.hs`
2. (Par exemple) `echo 5 | ./epreuve1`

### Explication solution

`padovan_iter` "parcourt" la suite de Padovan. À chaque étape, la fonction
se rappelle des trois derniers éléments de la suite. Ceci lui permet de
calculer le prochain élément. Quand nous arrivons à la position recherchée,
nous retournons le dernier élément calculé.

## Version 2

### Procédure d'exécution

Pareil que pour version 1, sauf qu'on remplace `epreuve1` par `epreuve1v2`.

### Explication solution

En fait cette solution est la première qui m'est venue en tête mais j'avais
oublié l'existence de `zipWith3`. La solution est simple: on crée une
liste/un stream infini dont les trois premiers éléments sont connus (1, 1, 1)
et dont les autres éléments correspondent à la définition de la suite de
Padovan (padovan_n = padovan_n-3 + padovan_n-2). Cette solution fonctionne
parce que Haskell évalue Padovan de manière paresseuse.