## Langage utilisé

Haskell

## Dépendances

Glasgow Haskell Compiler : https://www.haskell.org/ghc/download.html
Unordered Containers: https://hackage.haskell.org/package/unordered-containers
Heap: https://hackage.haskell.org/package/heap

## Partie 1

### Assomptions

Mes deux solutions assument qu'il y a un seul chemin à partir de chaque noeud
jusqu'au centre de masse.

### Procédure d'exécution

1. `ghc epreuve3-partie1[-v2].hs`
2. `./epreuve3-partie1 < carte.txt`, où `carte.txt` est un fichier quelconque
   contenant une carte telle que celle utilisée dans le repo CSGames

### Version 1

### Explication solution

Avec une bonne représentation des orbites, la partie 1 est pratiquement
résolue lors de la construction même de la structure de données représentant
les orbites.

Chaque noeud peut simplement être représenté par une entrée dans un hash map.
Le hash map associe l'identifiant des noeuds au nombre d'orbites (directes et
indirectes) découlant de ce noeud.

Cette solution assume que les noeuds sont en ordre: en premier viennent les
orbites directes avec le centre de masse, puis les orbites avec un degré de
séparation avec le centre de masse, etc.

### Version 2

### Explication solution

Cette solution ne recquiert pas que les noeuds soient donnés dans un ordre
particulier en entrée. La solution est identique à la version 1, sauf qu'au
lieu de stocker le nombre d'orbites entre un noeud donné et le centre de
masse dans la hash map, je stocke une fonction qui reçoit la hash map finale
en paramètre et calcule le nombre d'orbites à la toute fin.

## Partie 2

### Procédure d'exécution

1. `ghc epreuve3-partie2.hs`
2. `./epreuve3-partie2 id1 id2 < carte.txt`, où `carte.txt` est un fichier
   quelconque contenant une carte telle que celle utilisée dans le repo
   CSGames, et `id1` et `id2` sont des identifiants de noeuds.

### Explication solution

En gros, j'ai construit un graphe bidiriectionnel où chaque noeud est associé
1) aux noeuds qui sont en orbite immédiate autour de lui et 2) aux noeuds
autour desquels il est en orbite immédiate. Ensuite, j'ai appliqué Dijkstra
pour trouver le chemin le plus court du premier noeud au deuxième noeud
spécifié en entrée.