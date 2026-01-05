Le but de ce TP est de démontrer que différents algorithmes d’apprentissage sont préférables pour différents jeux de données.

Téléchargez [vowel](https://hastie.su.domains/ElemStatLearn/datasets/vowel.train) et [waveform](https://hastie.su.domains/ElemStatLearn/datasets/waveform.train) (pas besoin des données test).

Utilisez [`cross_validate`](https://scikit-learn.org/stable/modules/cross_validation.html#the-cross-validate-function-and-multiple-metric-evaluation) sur chaque jeux de données, avec chaque algorithme d’apprentissage.

* [LogisticRegressionCV](https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.LogisticRegressionCV.html)
* [DummyClassifier](https://scikit-learn.org/stable/modules/generated/sklearn.dummy.DummyClassifier.html#sklearn.dummy.DummyClassifier)


## extra points

* +10 si vous codez une classe `GlmnetCV` avec méthodes `fit` et `predict` basés sur [cvglmnet](https://glmnet-python.readthedocs.io/en/latest/glmnet_vignette.html#Logistic-Regression).

