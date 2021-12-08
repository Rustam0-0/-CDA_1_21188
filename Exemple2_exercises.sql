----------Jointures ----------

SELECT employe.prenom, dept.noregion
FROM employe
JOIN dept
ON employe.nodep = dept.nodept;

SELECT dept.nodept AS 'num dep', dept.nom AS 'nom dep', employe.nom AS 'nom emp'
FROM employe
JOIN dept
ON employe.nodep = dept.nodept
GROUP BY dept.nodept;

SELECT employe.nom FROM employe
JOIN dept
ON employe.nodep = dept.nodept
WHERE dept.nom = 'Distribution';

----------Auto-jointures----------

SELECT employe.nom, employe.salaire, patron.nom AS 'son patron', patron.salaire AS 'salaire du patron'
FROM employe
JOIN employe AS patron
ON patron.noemp = employe.nosup
WHERE employe.nosup IS NOT NULL
AND employe.salaire > patron.salaire

----------Sous-requêtes----------

SELECT employe.nom, employe.titre
FROM employe
WHERE employe.titre = 
(SELECT employe.titre FROM employe WHERE employe.nom = 'Amartakaldire')

