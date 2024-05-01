# Projet de recuit simulé

Ce projet consiste en une implémentation en OCaml de l'algorithme de recuit simulé pour résoudre le problème du voyageur de commerce.

## Fichiers

Le projet se compose des fichiers suivants :

* `simulated_annealing.ml` : le code source contenant l'implémentation de l'algorithme de recuit simulé.
* `Makefile` : le fichier Makefile pour compiler et exécuter le programme.
* `LISEZMOI.md` : ce fichier, contenant des informations sur le projet et des instructions pour l'utiliser.

## Utilisation

Pour compiler et exécuter le programme, suivez les étapes suivantes :

1. Assurez-vous que vous avez OCaml installé sur votre système. Vous pouvez le télécharger depuis le site officiel : <https://ocaml.org/docs/install.html>.
2. Ouvrez un terminal et naviguez jusqu'au répertoire contenant les fichiers du projet.

Vous avez deux options pour exécuter le programme :

### Option 1 : Exécuter directement le fichier source

* Tapez `ocaml simulated_annealing.ml` pour exécuter le programme directement à partir du fichier source.

### Option 2 : Utiliser le Makefile

* Tapez `make` pour compiler le programme.
* Tapez `make run` pour exécuter le programme.
* Tapez `make clean` pour nettoyer les fichiers générés lors de la compilation.

## Paramètres

Lorsque vous exécutez le programme, vous serez invité à entrer deux paramètres :

* La température initiale (un nombre réel positif, il est recommandé de choisir 999)
* Le taux de refroidissement (un nombre réel compris entre 0 et 1, il est recommandé de choisir 0.99 pour obtenir de nombreuses itérations)

Le programme utilisera ces paramètres pour exécuter l'algorithme de recuit simulé et afficher le parcours optimisé et la distance totale.

## Auteurs

Ce projet a été réalisé par ILYAS TAHIR et Seydina mandione Dia dans le cadre du cours Projet Algorithmique et Complexité - 2ème Semestre à l'Université de Bourgogne.
