## Langage utilisé

Ruby

## Dépendances

Interpréteur Ruby : https://www.ruby-lang.org/en/downloads/

## Procédure d'exécution

`ruby epreuve1.rb`

### Explication solution

On itère de 1 à 100. Pour chaque numéro, s'il est divisible par 3 et 5, on
imprime FizzBuzz. Sinon, s'il est divisible par 3 ou par 5, on imprime Fizz
ou Buzz, respectivement. Sinon, on imprime le numéro. Il est importat de
vérifier la condition pour FizzBuzz avant les deux autres, parce que sinon on
pourrait imprimer Fizz ou Buzz en trop.