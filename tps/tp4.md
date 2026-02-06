Le but de ce TP est de faire la validation croisée en parallèle sur une grappe de calcul en python.

Téléchargez [`MNIST_FashionMNIST.csv`](https://rcdata.nau.edu/genomic-ml/cv-same-other-paper/data_Classif/MNIST_FashionMNIST.csv) qui contient deux jeux de données.
Ce sont deux jeux de données de classification d’image, à 10 classes, et à 70 000 lignes chacun.

Écrire 4 fichiers python

* `combinaisons.py` 
  * définir les jeux de données dans une dictionnaire, `dict_données`.
  * définir les algos d’apprentissage dans une dictionnaire, `dict_algos`.
  * dans `if __name__=="__main__"` écrire un fichier `combinaisons.csv` avec une ligne pour chaque combinaison (données, algo, division) que vous voulez calculer en parallèle, et écrire `combinaisons.sh` dans lequel on a `python calculer_une_combinaison.py $SLURM_ARRAY_TASK_ID`.
* `calculer_une_combinaison.py` 
  * `from combinaisons import dict_données, dict_algos`
  * unpack `sys.argv` pour obtenir la valeur de `SLURM_ARRAY_TASK_ID`.
  * lire la ligne numero `SLURM_ARRAY_TASK_ID` dans `combinaisons.csv`.
  * fait l’apprentissage et la prédiction pour la combinaison correspondant.
  * écrire une ligne de résultats dans un fichier csv (taux d’erreur pour l’ensemble test).
* `résultats.py` lit les différents fichiers de résultats (chacun avec une ligne), et écrit un seul fichier `résultats.csv` (avec plusieurs lignes).
* `figure.py` lit le fichier `résultats.csv` et écrit fichiers PNG (sorties graphiques).

Utilisez la validation croisée à 10 divisions (faire la division vous-même, sans utilser sklearn).

Utlilsez les mêmes 3 algorithmes d’apprentissage que dans le TP1.

* [LogisticRegressionCV](https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.LogisticRegressionCV.html)
* `GridSearchCV(cv=3)` avec `KNeighborsClassifier` pour coder les plus proches voisins, avec nombre de voisins entre 1 et 40. 
* [DummyClassifier](https://scikit-learn.org/stable/modules/generated/sklearn.dummy.DummyClassifier.html#sklearn.dummy.DummyClassifier) pour donnée un niveau d’erreur de base.

Lancer les calculs sur la grappe du cours.

Utilisez plotnine pour dessiner les résultats.

* X = taux d’erreur
* Y = algorithme
* un point pour chaque division de validation croisée
* `facet_grid()` un panneau pour chaque jeu de données

Comme ça 

![alt](tp1-err-dots.png)

![alt](tp1-err-facets.png)

Écrire une réponse à ces questions :

* pour MNIST, quel algorithme donne les meilleures prédictions ?
* pour FashionMNIST, quel algorithme donne les meilleures prédictions ?
* est-ce que les résultats dans python sont cohérénts avec R ?
* Combien de tâches avez-vous calculé en parallèle sur la grappe ?
* Ça a pris combien de temps entre le lancement et la récuperation de résultats ?
* Combien de CPUs avez-vous sur votre ordinateur ?
* Si vous faites les mêmes calculs sur votre ordinateur, combien de temps estimez-vous que ça prend ?
* D’après ces différences en temps de calcul, la grappe est combien de fois plus vite que votre ordinateur ?

Soumettez un fichier PDF avec vos codes, vos réponses, et vos graphiques.

* mettez en gras une section « extra points » si vous tenter les exercises facultatives ci-dessous.
* suivez [les standards dans la rédaction de code python](https://docs.google.com/document/d/1Co1y6bvnNdadnzwAt575JFLkIvGZsQ35ED3QJgMfA3Y/edit?tab=t.0)

## extra points

* +10 si vous dessinez un graphique représentant le temps de calcul de chaque algorithme.
* +10 si vous rajoutez un autre algorithme d’apprentissage (forêt aléatoire, arbre de décision, boosting, et cætera).
* +10 si vous dessinez un graphique avec le taux d’erreur pour chaque nombre de voisins.
* +10 si vous rajoutez `geom_text` avec la moyenne ± écart type, trier Y par moyenne, et un autre `geom_text` avec P d’un T-test pour savoir s’il y a une différence significative entre les algos, comme ça

![alt](tp1-err-pval.png)


