-- Jointures----------

SELECT employe.prenom, dept.noregion
FROM employe
JOIN dept
ON employe.nodep = dept.nodept;

SELECT dept.nodept AS 'num dep', dept.nom AS 'nom dep', employe.nom AS 'nom emp'
FROM employe
JOIN dept
ON employe.nodep = dept.nodept
ORDER BY dept.nodept;

SELECT employe.nom FROM employe
JOIN dept
ON employe.nodep = dept.nodept
WHERE dept.nom = 'Distribution';

-- Auto-jointures----------

SELECT employe.nom, employe.salaire, patron.nom 'son patron', patron.salaire 'salaire du patron'
FROM employe
JOIN employe AS patron
ON patron.noemp = employe.nosup
WHERE employe.nosup IS NOT NULL
AND employe.salaire > patron.salaire;

-- Sous-requêtes----------

SELECT employe.nom, employe.titre
FROM employe
WHERE employe.titre = 
(SELECT employe.titre FROM employe WHERE employe.nom = 'Amartakaldire');

SELECT employe.nom, employe.salaire, employe.nodep
FROM employe
WHERE employe.salaire > ANY(SELECT employe.salaire FROM employe WHERE employe.nodep = 31);

SELECT employe.nom, employe.salaire, employe.nodep
FROM employe
WHERE employe.salaire > ALL(SELECT employe.salaire FROM employe WHERE employe.nodep = 31);

SELECT employe.nom, employe.titre
FROM employe
WHERE employe.nodep = 31 AND employe.titre IN 
(SELECT employe.titre FROM employe WHERE employe.nodep = 32);

SELECT employe.nom, employe.titre
FROM employe
WHERE employe.nodep = 31 AND employe.titre NOT IN 
(SELECT employe.titre FROM employe WHERE employe.nodep = 32);

SELECT employe.nom, employe.titre, employe.salaire
FROM employe
WHERE
employe.titre =(SELECT employe.titre FROM employe WHERE employe.nom = 'Fairent')
AND 
employe.salaire =(SELECT employe.salaire FROM employe WHERE employe.nom ='Fairent')
AND employe.nom != 'Fairent';

-- Requêtes externes----------

SELECT dept.nodept, dept.nom AS 'dep nom', employe.nom AS 'emp nom'
FROM dept
LEFT JOIN employe
ON dept.nodept = employe.nodep
ORDER BY dept.nodept;

-- Les groupes--------------
-- 1.Calculer le nombre d''employés de chaque titre--
SELECT employe.titre,
COUNT(employe.noemp)
FROM employe
GROUP BY employe.titre;

-- 2.Calculer la moyenne des salaires et leur somme, par région--
SELECT employe.nodep,
round(AVG(employe.salaire),0) 'moyenne',
SUM(employe.salaire) 'somme'
FROM employe
GROUP BY employe.nodep;

-- 3.Afficher les numéros des départements ayant au moins 3 employés.--
SELECT employe.nodep, COUNT(employe.noemp) 'nombre d\'employés'
FROM employe
GROUP BY employe.nodep
HAVING COUNT(employe.noemp) > 2;

-- 4.Afficher les lettres qui sont l'initiale d'au moins trois employés--
WITH tab AS (
SELECT LEFT (employe.prenom,1) 'initiale' FROM employe
UNION ALL
SELECT LEFT (employe.nom,1) FROM employe
)
SELECT initiale, COUNT(*) 'nombre'
FROM tab
GROUP BY initiale
HAVING COUNT(*) > 2;

-- 5.Rechercher le salaire maximum et le salaire minimum parmi tous les salariés et l'écart entre les deux.
SELECT MAX(employe.salaire)'max_s', MIN(employe.salaire)'min_s', 
MAX(employe.salaire)-MIN(employe.salaire)'écart'
FROM employe;

-- 6.Rechercher le nombre de titres différents
SELECT COUNT(distinct employe.titre)'nombre de titres différents'
FROM employe;

-- 7.Pour chaque titre, compter le nombre d'employés possédant ce titre
SELECT employe.titre, COUNT(*)'nombre'
FROM employe
GROUP BY employe.titre;

-- 8.Pour chaque nom de département, afficher le nom du département et le nombre d'employés
SELECT dept.nom, COUNT(employe.noemp)'nombre d\'emloyés'
FROM dept
JOIN employe
ON dept.nodept = employe.nodep
GROUP BY dept.nom;

-- 9.Rechercher les titres et la moyenne des salaires par titre dont la moyenne est supérieure à la moyenne des salaires des Représentants
SELECT employe.titre, AVG(employe.salaire)
FROM employe
GROUP BY titre
HAVING AVG(employe.salaire) > 
	(SELECT AVG(employe.salaire) 
	FROM employe 
	WHERE employe.titre = 'représentant');
	
-- 10.Rechercher le nombre de salaires renseignés et le nombre de taux de commission renseignés
SELECT COUNT(employe.salaire), COUNT(employe.tauxcom)
FROM employe
WHERE salaire IS NOT NULL OR tauxcom IS NOT NULL;