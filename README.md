# Analyse SQL des ventes multi-région

## Problème
Une entreprise fictive dispose de 2 ans de transactions de ventes réparties
sur 5 régions, sans synthèse exploitable pour la direction commerciale.

## Outils
SQL (SQLite), 7 requêtes business + 1 requête avancée (fonction de fenêtrage)

## Processus
Import du CSV brut dans une base SQLite, puis rédaction de 7 requêtes
répondant à des questions business concrètes (CA global, par région,
par année, panier moyen, top clients, saisonnalité), complétées par un
classement des meilleurs clients par région via RANK() OVER PARTITION BY.

## Résultat
La région Sud génère à elle seule 28,4 % du chiffre d'affaires total, avec un CA de 460 868,30 € sur un total de 1 620 123,72 €.
Le panier moyen varie de 182,81 € à 392,77 € selon les régions, soit un écart de plus du double entre l'Est et le Centre, suggérant des stratégies de vente différenciées selon les marchés régionaux.
L'analyse de la saisonnalité montre que le mois de mai 2026 enregistre le chiffre d'affaires mensuel le plus élevé, avec 101 995,08 €, devant juin 2026 (94 775,18 €) et mai 2025 (90 468,24 €). Ces variations peuvent servir de base à l'anticipation des périodes de forte activité commerciale.