# Programmation Fonctionnelle

## Contraintes

Vous **devez** utiliser un des langages suivant: Haskell ou Clojure.

Vous **devez** fournir une liste des dépendances à installer en utilisant les noms/liens comme sur https://packages.ubuntu.com

Vous **devez** fournir un fichier README qui dit: le langage utilisé, et la procédure pour exécuter vos solutions.

## Épreuve 1

Vous devez écrire un programme prenant un nombre entier `x` supérieur ou égal à 0 en paramètre (passé au moment de l'exécution par la ligne de commande). Votre programme doit afficher le `x`ième nombre de la [Suite de Padovan](https://fr.wikipedia.org/wiki/Suite_de_Padovan).

## Épreuve 2

Il vous faut écrire un programme qui, donné une suite de lignes de caractès ASCII ayant chacune le même nombre de colonnes, détermine le caractère qui apparaît le plus souvent dans cette colonne. Votre programme doit ensuite afficher le résultat de la concaténation de ce caractère pour chacune des colonnes, en ordre.

Dans le cas où plusieurs caractères apparaîssent le même nombre de fois dans une colonne, on choisit celui avec la [valeur ASCII](https://www.ascii-code.com/) la plus basse.

Les caractères donnés seront tous des caractères affichables (valeurs décimales entre 32 et 126 inclusivement).

Par exemple, si ceci est donné en entrée:

```
palneic
bmzkbmd
czusoem
eheucht
innmwbe
fcglxez
rktvgpk
csgozly
gsscmes
uxhajls
cnghmpd
ervaddi
hjpxurs
xsmrmeb
hwgabmh
```

Le caractère le plus commun dans la première colonne est c; dans la seconde, s; dans la troisième, g, et ainsi de suite. La combinaison de ces caractères renvoie la sortie attendue : `csgames`.

## Épreuve 3

Cette épreuve est adaptée à partir du défi pour le jour 6 de l'[Advent of Code 2019](https://adventofcode.com/2019/day/6)

Vous recevrez en entrée une liste d'orbites.

Chaque objet, à l'exception du *centre de masse* (dénoté `COM` dans l'input) est en orbite directe autour d'un seul autre objet.

Si `Y` est en orbite autour de `Z` et que `X` est en orbite autour de `Y`, alors `X` est en orbite **indirecte** autour de `Z`. Cette chaîne d'orbites indirectes peut être d'une longueur arbitraire.

Chaque ligne de l'entrée est au format suivant : `X)Y`. Ceci signifie que `Y` est en orbite directe autour de `X`.

Par exemple, la carte suivante:

```
COM)B
B)C
C)D
D)E
E)F
B)G
G)H
D)I
E)J
J)K
K)L
```

Sa représentation visuelle est:

```
        G - H       J - K - L
       /           /
COM - B - C - D - E - F
               \
                I
```

Dans cette représentation visuelle, quand deux objets sont connectés par une ligne, celui de droite est en orbite directe autour de celui de gauche.

On peut donc compter le nombre total d'orbites ainsi:

 - D est en orbite directe autour de C et est en orbite indirecte autour de B et COM, un total de 3 orbites.
 - L est en orbite directe autour de K et est en orbite indirecte autour de J, E, D, C, B, et COM, un total de 7 orbites.
 - COM n'est en orbite autour de rien.

Et ainsi de suite pour un total de 42 orbites directes et indirectes.

### Partie 1

Écrivez un programme qui calcule et affiche le nombre total d'orbites pour une carte donnée.

### Partie 2

Étant donné le même format de carte, écrivez un programme qui calcule la distance la plus courte entre deux objets.

La distance correspond aux nombres d'objets entre le point de départ de celui d'arrivée incluant le point d'arrivée. Dans la représentation visuelle, il s'agit du nombre de traits (`-, / ou \`).

Votre programme doit lire la carte par l'entrée standard (STDIN) et prendre deux paramètres en ligne de commande, soit les deux objets entre lesquels calculer la distance.

Dans la carte donnée en exemple, la distance entre `I` et `L` serait donc de 5.
