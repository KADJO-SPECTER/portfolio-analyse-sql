-- Question 1 : Chiffre d'affaires total et nombre de transactions
SELECT  
    ROUND(SUM(montant), 2) AS chiffre_affaires_total, 
    COUNT(*) AS nombre_transactions
FROM ventes;

-- Question 2 : Chiffre d'affaires par region, classe du plus fort au plus faible
SELECT 
    region, 
    ROUND(SUM(montant), 2) AS chiffre_affaires_region
FROM ventes
GROUP BY region
ORDER BY chiffre_affaires_region DESC;

-- Question 3 : Évolution du chiffre d'affaires par année
SELECT
    strftime('%Y', date) AS annee,
    ROUND(SUM(montant), 2) AS chiffre_affaires_annee
FROM ventes
GROUP BY annee
ORDER BY annee;

-- Question 4 : Catégorie de produit la plus rentable par région
SELECT
    region,
    produit_categorie,
    ROUND(SUM(montant), 2) AS chiffre_affaires_categorie
FROM ventes
GROUP BY region, produit_categorie
ORDER BY region, chiffre_affaires_categorie DESC;

-- Question 5 : Top 20 des clients par montant total dépensé
SELECT
    id_client,
    ROUND(SUM(montant), 2) AS montant_total_depense
FROM ventes
GROUP BY id_client
ORDER BY montant_total_depense DESC
LIMIT 20;

-- Question 6 : Panier moyen par région
SELECT
    region,
    ROUND(AVG(montant), 2) AS panier_moyen
FROM ventes
GROUP BY region
ORDER BY panier_moyen DESC;

-- Question 7 : Mois avec le chiffre d'affaires le plus élevé (saisonnalité)
SELECT
    strftime('%Y-%m', date) AS mois,
    ROUND(SUM(montant), 2) AS chiffre_affaires_mois
FROM ventes
GROUP BY mois
ORDER BY chiffre_affaires_mois DESC
LIMIT 5;

-- Classement des 3 meilleurs clients par region
SELECT * FROM (
    SELECT
        region,
        id_client,
        ROUND(SUM(montant), 2) AS montant_total_depense,
        RANK() OVER (PARTITION BY region ORDER BY SUM(montant) DESC) AS rang_client
    FROM ventes
    GROUP BY region, id_client
) 
WHERE rang_client <= 3
   
