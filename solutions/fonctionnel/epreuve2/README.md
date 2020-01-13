## Langage utilisé

Clojure

## Dépendances

Compilateur/interpréteur Clojure: https://clojure.org/guides/getting_started

## Version 1

### Procédure d'exécution

1. (Par exemple) `print "allo\ntoua\n" | clojure epreuve2.clj`

### Explication de la solution

Pour chaque ligne donnée dans STDIN, je génère un vecteur de hash maps, qui
associent une lettre à un numéro. Il y a le même nombre de hash maps dans
chaque vecteur qu'il y a de colonnes dans le texte donné en entrée.

Initialement, chaque lettre est associée au numéro 1, puisqu'une lettre
apparaît une seule fois à une position donnée sur une rangée. Ensuite,
il suffit de combiner les hash maps correspondant à chaque colonne, en
s'assurant que les nombres associés à une même lettre dans différents hash
maps soient additionnés.

Finalement, on retourne le vecteur contenant la combinaison des hash maps
pour chaque colonne, pour chaque hash map dans ce vecteur on trouve la
lettre ayant été comptée le plus de fois, et on imprime la concaténation
de ces lettres.