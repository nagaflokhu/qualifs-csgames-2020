## Langage utilisé

Haskell

## Dépendances

Glasgow Haskell Compiler : https://www.haskell.org/ghc/download.html
Unordered Containers: https://hackage.haskell.org/package/unordered-containers

## Assomptions

1. Tous les noeuds sont en orbite directe ou indirecte avec le centre de
   masse. En d'autres mots, les données forment un seul arbre dont la racine
   est le centre de masse.
2. Tous les identifiants de noeuds sont uniques.
3. Il y a un seul chemin à partir de chaque noeud jusqu'au centre de masse.

## Partie 1

### Procédure d'exécution

1. `ghc epreuve3-partie1.hs`
2. `./epreuve3-partie1 < carte.txt`, où `carte.txt` est un fichier quelconque
   contenant une carte telle que celle utilisée dans le repo CSGames

### Explication solution

Avec une bonne représentation des orbites, la partie 1 est pratiquement
résolue lors de la construction même de la structure de données représentant
les orbites.

Chaque noeud peut simplement être représenté par une entrée dans un hash map.
Le hash map associe l'identifiant des noeuds au nombre d'orbites (directes et
indirectes) découlant de ce noeud.

On commence par créer un hash map qui retourne 0 lorsqu'on essaie d'accéder à
un élément qui n'est pas présent. Puis, pour chaque ligne en entrée, on
associe dans le hash map le nombre d'orbites du parent + 1 à l'identifiant de
chaque nouveau noeud. Si un noeud est ajouté plusieurs fois, seule la plus
grande valeur est gardée.

La partie 1 est résolue de manière naturelle à l'aide d'un arbre et d'une
recherche en largeur légèrement modifiée. Afin de pouvoir construire l'arbre
efficacement, j'utiliserai un hash table qui associe les identifiants de
noeuds à leurs descendants directs

On commence la recherche en profondeur au centre de masse avec 0 orbites. On
ajoute ensuite chaque enfant à une liste contenant les noeuds qu'on veut
visiter. Chaque enfant sera associé à la profondeur courante + 1. Ceci
représente le nombre d'orbites directes et indirectes de ce noeud.

Étant donné qu'il peut y avoir plusieurs chemins entre le centre de masse et
chaque noeud, on sauvegarde la profondeur des noeuds dans une map (hash
table), ce qui permet de sauvegarder la profondeur maximale pour chaque noeud
et d'en prendre la somme à la fin.

## Partie 2

### Procédure d'exécution

### Explication solution