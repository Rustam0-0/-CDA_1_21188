1. select * from employe;
2. select *from dept;
3. SELECT employe.nom, employe.dateemb, employe.nosup, employe.nodep, employe.salaire FROM employe;
4. SELECT employe.titre FROM `employe` ;
5. SELECT DISTINCT employe.titre FROM `employe`;
6. SELECT employe.nom, employe.noemp, employe.nodep FROM `employe`
   WHERE employe.titre = "Secrétaire";
7. SELECT dept.nom, dept.nodept FROM dept
   WHERE dept.nodept > 40;
8. SELECT employe.nom, employe.prenom FROM employe
   WHERE employe.nom > employe.prenom;
9. SELECT employe.nom, employe.salaire, employe.nodep FROM employe
   WHERE employe.titre = 'Représentant' AND employe.nodep = 35 AND employe.salaire > 20000
10. SELECT employe.nom, employe.titre, employe.salaire FROM employe
WHERE employe.titre = 'Représentant' OR employe.titre = 'Président';
11. SELECT employe.nom, employe.titre, employe.nodep, employe.salaire FROM employe
WHERE employe.nodep = 34 AND (employe.titre = 'Représentant' OR employe.titre = 'Secrétaire');
12. SELECT employe.nom, employe.titre, employe.nodep, employe.salaire FROM employe
WHERE employe.titre = 'Représentant' OR (employe.titre = 'Secrétaire' AND employe.nodep = 34);
13. SELECT employe.nom, employe.salaire FROM employe
WHERE employe.salaire >20000 AND employe.salaire <30000;
14. NOT EXISTS
15. SELECT employe.nom FROM employe
WHERE employe.nom LIKE 'H%';
16. SELECT employe.nom FROM employe
WHERE employe.nom LIKE '%n';
17. SELECT employe.nom FROM employe
WHERE employe.nom LIKE '__u%';
18. SELECT employe.salaire, employe.nom FROM employe
WHERE employe.nodep=41
ORDER BY employe.salaire;
19. SELECT employe.salaire, employe.nom FROM employe
WHERE employe.nodep=41
ORDER BY employe.salaire DESC;
20. SELECT employe.titre, employe.salaire, employe.nom FROM employe
ORDER BY employe.titre, employe.salaire DESC;
21. SELECT employe.tauxcom, employe.salaire, employe.nom
FROM employe
WHERE employe.tauxcom IS NOT NULL
ORDER BY employe.tauxcom;
22. SELECT employe.nom, employe.salaire, employe.tauxcom, employe.titre
FROM employe
WHERE employe.tauxcom IS NULL;
23. SELECT employe.nom, employe.salaire, employe.tauxcom, employe.titre
FROM employe
WHERE employe.tauxcom IS NOT NULL;
24. SELECT employe.nom, employe.salaire, employe.tauxcom, employe.titre
FROM employe
WHERE employe.tauxcom < 15;
25. SELECT employe.nom, employe.salaire, employe.tauxcom, employe.titre
FROM employe
WHERE employe.tauxcom > 15;
26. SELECT employe.nom, employe.salaire, employe.tauxcom, 
round(employe.salaire*employe.tauxcom/100, 0) AS 'la commission'
FROM employe
WHERE employe.tauxcom IS NOT NULL;
27. SELECT employe.nom, employe.salaire, employe.tauxcom, round(employe.salaire*employe.tauxcom/100, 0) AS 'la commission'
FROM employe
WHERE employe.tauxcom IS NOT NULL
ORDER BY employe.tauxcom;
28. 