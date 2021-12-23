/* LES BESOINS D’AFFICHAGE*/

/*1.*/
SELECT entcom.numcom  FROM entcom 
WHERE entcom.numfou = '9120';

/*2.*/
SELECT DISTINCT fournis.numfou FROM entcom;

/*3. Afficher le nombre de commandes fournisseurs passées, et 
 le nombre de fournisseur concernés*/
SELECT COUNT(*)'le nombre de commandes',
COUNT(fournis.numfou)' le nombre de fournisseurs'
FROM entcom;

/*4. Editer (comprendre afficher)  les produits ayant un stock 
-- inférieur ou égal au 
-- stock d'alerte et dont la quantité annuelle est inférieur 
--  à 1000 (informations à fournir : n° produit, 
-- libellé produit, stock, stock actuel d'alerte, quantité annuelle)*/
SELECT *
FROM produit
WHERE produit.stkphy <= produit.stkale
AND produit.qteann < 1000;

/*5. Quels sont les fournisseurs situés dans les départements 
-- 75 78 92 77 ?
-- L’affichage (département, nom fournisseur) sera effectué par
-- département décroissant, puis par ordre alphabétique*/
SELECT fournis.posfou, fournis.nomfou
FROM fournis
WHERE fournis.posfou LIKE '75%'
	OR fournis.posfou LIKE '78%'
	OR fournis.posfou LIKE '92%'
	OR fournis.posfou LIKE '77%'
ORDER BY fournis.posfou DESC, fournis.nomfou ASC;

/*ou*/
SELECT * FROM fournis
WHERE SUBSTRING(posfou, 1, 2) in (75, 78, 92, 77)
ORDER BY fournis.posfou DESC, fournis.nomfou ASC;

/*6. Quelles sont les commandes passées au mois de mars et avril ?*/
SELECT entcom.numcom
FROM entcom
WHERE MONTH(entcom.datcom) = 4
OR MONTH(entcom.datcom) = 3;
/* WHERE MONTH(entcom.datcom) BETWEEN 3 AND 4; */

/*7. Quelles sont les commandes du jour qui ont des observations
-- particulières ?
-- (Affichage numéro de commande, date de commande)*/
SELECT entcom.numcom, entcom.datcom
FROM entcom
WHERE date(datcom) = date(now()) 
AND entcom.obscom <> '';

/*8. Lister le total de chaque commande par total décroissant
-- (Affichage numéro de commande et total)*/
SELECT ligcom.numcom, SUM(ligcom.qtecde*ligcom.priuni) AS total
FROM ligcom
GROUP by 1
ORDER BY 2 DESC;

/*9.  Lister les commandes dont le total est supérieur à 10 000€ ; on exclura
-- dans le calcul du total les articles commandés en quantité supérieure
-- ou égale à 1000.
-- (Affichage numéro de commande et total)*/
SELECT ligcom.numcom, SUM(ligcom.qtecde*ligcom.priuni) AS total
FROM ligcom
WHERE ligcom.qtecde >= 1000
GROUP BY ligcom.numcom
HAVING total > 10000
ORDER BY 2 DESC;

/*10. Lister les commandes par nom fournisseur
-- (Afficher le nom du fournisseur, le numéro de commande et 
-- la date)*/
SELECT fournis.nomfou, entcom.numcom, entcom.datcom
FROM fournis
NATURAL JOIN entcom
ORDER BY fournis.nomfou

/*11. Sortir les produits des commandes ayant le mot "urgent' en observation?
-- (Afficher le numéro de commande, le nom du fournisseur, le libellé du
-- produit et le sous total = quantité commandée * Prix unitaire)*/
SELECT e.numcom, f.nomfou, p.libart, l.priuni*l.qtecde AS total 
FROM entcom e
JOIN fournis f using(numfou)
JOIN ligcom l using(numcom)
JOIN produit p using(codart)
WHERE e.obscom LIKE '%urgent%';

/*12. Coder de 2 manières différentes la requête suivante :
Lister le nom des fournisseurs susceptibles de livrer au moins un article */
SELECT DISTINCT fournis.nomfou 
FROM ligcom
JOIN entcom using(numcom)
JOIN fournis using(numfou)
WHERE ligcom.qtecde > ligcom.qteliv

/* ou*/
SELECT nomfou FROM fournis
WHERE nomfou IN (
	SELECT numfou FROM entcom
	WHERE numcom IN (
		SELECT numcom FROM ligcom
		WHERE qtecde > qteliv
	)
);

/*13. Coder de 2 manières différentes la requête suivante
Lister les commandes (Numéro et date) dont le fournisseur est celui de
la commande 70210 */
SELECT entcom.numcom, entcom.datcom
FROM entcom
WHERE entcom.numfou = (
	SELECT entcom.numfou
	FROM entcom
	WHERE entcom.numcom = 70210);

/* ou */
SELECT e.numcom, e.datcom
FROM entcom e
JOIN entcom e2 USING (numfou)
WHERE e2.numcom = 70210

/*14. Dans les articles susceptibles d’être vendus, 
-- lister les articles moins chers (basés sur Prix1) 
-- que le moins cher des rubans (article dont le premier 
-- caractère commence par R). 
-- On affichera le libellé de l’article et prix1*/
SELECT vente.codart, vente.prix1 
FROM vente
WHERE vente.prix1 < 
	(SELECT MIN(vente.prix1) 
	FROM vente 
	WHERE vente.codart LIKE 'r%')

/*15. Afficher la liste des fournisseurs susceptibles de livrer 
-- les produits dont le stock est inférieur ou égal à 150 % du 
-- stock d'alerte. La liste est triée par produit puis fournisseur*/
SELECT fournis.numfou, stkphy, stkale*1.5
FROM fournis f
JOIN entcom e USING (numfou)
JOIN ligcom l USING (numcom)
JOIN produit p USING (codart)
WHERE p.stkphy <= 1.5*p.stkale
	AND 
	l.qtecde > l.qteliv 
ORDER BY p.codart, f.numfou

/*16. Éditer la liste des fournisseurs susceptibles de livrer les 
-- produit dont le stock est inférieur ou égal à 150 % du stock 
-- d'alerte et un délai de livraison d'au plus 30 jours. 
-- La liste est triée par fournisseur puis produit*/
SELECT f.numfou
FROM produit p
JOIN ligcom l USING (codart)
JOIN entcom e USING (numcom)
JOIN fournis f USING (numfou)
JOIN vente v ON v.codart = p.codart AND v.numfou = f.numfou
WHERE p.stkphy <= 1.5*p.stkale
AND v.delliv < 30
AND l.qtecde > l.qteliv;

/*17. Avec le même type de sélection que ci-dessus, sortir 
-- un total des stocks par fournisseur trié par total décroissant*/
SELECT f.numfou, SUM(produit.stkphy) 
FROM fournis f
JOIN entcom USING (numfou)
JOIN ligcom USING (numcom)
JOIN produit USING (codart)
GROUP BY f.numfou
ORDER BY 2 DESC;

/*18. En fin d'année, sortir la liste des produits dont la quantité réellement
commandée dépasse 90% de la quantité annuelle prévue. */
SELECT p.codart, SUM(l.qtecde), p.qteann*0.9 AS total
FROM produit p
JOIN ligcom l USING(codart)
GROUP BY codart
HAVING sum(l.qtecde) > total;

/* 19. Calculer le chiffre d'affaire par fournisseur pour l'année 2018 sachant
que les prix indiqués sont hors taxes et que le taux de TVA est 20%.*/
SELECT f.nomfou, 
	SUM(l.priuni*l.qtecde) AS "chiffre d'affaire hors txes",
	SUM(l.priuni*l.qtecde)*0.2 AS "TVA",
	SUM(l.priuni*l.qtecde)*1.2 AS "chiffre d'affaire TTC"
FROM ligcom l
JOIN entcom e USING(numcom)
JOIN fournis f USING(numfou)
GROUP BY f.nomfou
ORDER BY 2 DESC;

/* 20. Existe-t-il des lignes de commande non cohérentes avec 
les produits vendus par les fournisseurs? */
SELECT l.codart, e.numfou
FROM ligcom l
JOIN entcom e USING(numcom)
EXCEPT
SELECT codart, numfou FROM vente;



/*LES BESOINS DE MISE A JOUR*/
/*1.*/
UPDATE vente 
SET vente.prix1 = 1.04*vente.prix1, vente.prix2 = 1.02*vente.prix2 
WHERE vente.numfou = '9180';

/*2.*/
UPDATE vente 
SET vente.prix2 = vente.prix1
WHERE vente.prix2 = 0;

/*3.*/
UPDATE entcom 
JOIN fournis 
ON fournis.numfou = entcom.numfou
SET entcom.obscom = '*****' 
WHERE fournis.satisf < 5;

/*4.*/
DELETE
FROM produit
WHERE produit.codart = 'I110';

/*5. Suppression des entête de commande qui n'ont aucune ligne */
