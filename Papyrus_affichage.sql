/* LES BESOINS D’AFFICHAGE*/

/*1.*/
SELECT entcom.numcom  FROM entcom 
WHERE entcom.numfou = '9120';

/*2.*/
SELECT DISTINCT fournis.numfou FROM fournis
JOIN entcom
ON fournis.numfou = entcom.numfou;

/*3.*/
SELECT COUNT(entcom.numcom)'le nombre de commandes',
COUNT(fournis.numfou)' le nombre de fournisseurs'
FROM entcom
JOIN fournis
ON fournis.numfou = entcom.numfou;

/*4.*/
SELECT produit.codart, produit.libart, produit.stkphy, produit.stkale, produit.qteann
FROM produit
WHERE produit.stkphy <= produit.stkale
AND produit.qteann < 1000;

/*5.*/
SELECT fournis.posfou, fournis.nomfou
FROM fournis
WHERE fournis.posfou LIKE '75%'
	OR fournis.posfou LIKE '78%'
	OR fournis.posfou LIKE '92%'
	OR fournis.posfou LIKE '77%'
ORDER BY fournis.posfou DESC;
/*ORDER BY fournis.nomfou*/

/*6.*/
SELECT entcom.numcom
FROM entcom
WHERE MONTH(entcom.datcom) = 4
OR MONTH(entcom.datcom) = 3;

/*7.*/
SELECT entcom.numcom, entcom.datcom
FROM entcom
WHERE entcom.obscom <> '';

/*8.*/
SELECT ligcom.numcom, ligcom.qtecde*ligcom.priuni AS total
FROM ligcom
ORDER BY ligcom.qtecde*ligcom.priuni DESC;

/*9.*/
SELECT ligcom.numcom, ligcom.qtecde*ligcom.priuni AS total
FROM ligcom
WHERE ligcom.qtecde*ligcom.priuni > 10000
AND ligcom.qtecde < 1000;

/*10.*/
SELECT fournis.nomfou, entcom.numcom, entcom.datcom
FROM fournis
JOIN entcom
ON fournis.numfou = entcom.numfou
ORDER BY fournis.nomfou;

/*11.*/
SELECT entcom.numcom, fournis.nomfou, produit.libart, ligcom.priuni*ligcom.qtecde AS total 
FROM entcom
JOIN fournis
ON fournis.numfou = entcom.numfou
JOIN ligcom
ON ligcom.numcom = entcom.numcom
JOIN produit
ON ligcom.codart = produit.codart
WHERE entcom.obscom = 'Commande urgente';

/*12.*/
SELECT entcom.numfou 
FROM entcom
WHERE entcom.numcom != 0;
/* ou*/
SELECT entcom.numfou
FROM entcom
WHERE entcom.numcom <> '';

/*13.*/
SELECT entcom.numcom, entcom.datcom
FROM entcom
WHERE entcom.numfou = (
	SELECT entcom.numfou
	FROM entcom
	WHERE entcom.numcom = 70210);

/*14.*/
SELECT produit.libart, vente.prix1 
FROM produit
JOIN vente
ON produit.codart = vente.codart
WHERE vente.prix1 < 
	(SELECT MIN(vente.prix1) 
	FROM vente 
	JOIN produit 
	ON produit.codart = vente.codart 
	WHERE produit.libart LIKE 'r%');

/*15.?
SELECT vente.numfou
FROM vente
JOIN produit
ON vente.codart = produit.codart
WHERE produit.stkphy <= 1.5*produit.stkale
ORDER BY produit.codart;
ORDER BY vente.codart*/

/*15.*/
SELECT fournis.numfou
FROM fournis
JOIN entcom
ON fournis.numfou = entcom.numfou
JOIN ligcom
ON entcom.numcom = ligcom.numcom
JOIN produit
ON ligcom.codart = produit.codart
WHERE produit.stkphy <= 1.5*produit.stkale
ORDER BY fournis.numfou;
/*ORDER BY produit.codart*/

/*16.*/
SELECT fournis.numfou FROM fournis
JOIN entcom
ON fournis.numfou = entcom.numfou
JOIN ligcom
ON entcom.numcom = ligcom.numcom
JOIN produit
ON ligcom.codart = produit.codart
WHERE produit.stkphy <= 1.5*produit.stkale
AND (ligcom.derliv - entcom.datcom) <=30
ORDER BY fournis.numfou;
/*ORDER BY produit.codart*/

/*17.*/
SELECT fournis.numfou, produit.stkphy FROM fournis
JOIN entcom
ON fournis.numfou = entcom.numfou
JOIN ligcom
ON entcom.numcom = ligcom.numcom
JOIN produit
ON ligcom.codart = produit.codart
ORDER BY produit.stkphy DESC;

/*18.*/
SELECT produit.codart FROM produit
JOIN ligcom
ON produit.codart = ligcom.codart
WHERE ligcom.qtecde > 0.9*produit.qteann;


/*LES BESOINS DE MISE A JOUR*/
/*1.*/
UPDATE vente 
SET vente.prix1 = 1.04*vente.prix1, vente.prix2 = 1.02*vente.prix2 
WHERE vente.numfou = '9180';

/*2.*/
UPDATE vente 
SET vente.prix2 = 0.98*vente.prix1 
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