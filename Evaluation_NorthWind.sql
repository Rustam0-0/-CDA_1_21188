-- 1) Requêtes d'intérrogation sur la base NorthWind

-- 1 - Liste des contacts français
SELECT
    customers.CompanyName 'Société',
    customers.ContactName 'Contact',
    customers.ContactTitle 'Fonction',
    customers.Phone 'Téléphone'
FROM
    customers
WHERE customers.Country = 'France';



-- 2 - Produits vendus par le fournisseur « Exotic Liquids »
SELECT
    products.ProductName,
    products.UnitPrice
FROM
    products
JOIN suppliers ON products.SupplierID = suppliers.SupplierID
WHERE suppliers.CompanyName = 'Exotic Liquids';



-- 3 - Nombre de produits vendus par les fournisseurs Français dans l’ordre décroissant
SELECT DISTINCT
    suppliers.CompanyName 'Fournisseur',
    COUNT(DISTINCT order_details.ProductID) 'Nbre produits'
FROM
    products
JOIN order_details ON products.ProductID = order_details.ProductID
JOIN suppliers ON suppliers.SupplierID = products.SupplierID
WHERE
    suppliers.Country = 'France'
GROUP BY
    suppliers.CompanyName
ORDER BY COUNT(DISTINCT order_details.ProductID) DESC;



-- 4 - Liste des clients Français ayant plus de 10 commandes
SELECT
    customers.CompanyName 'Client',
    COUNT(orders.OrderID) 'Nbre commandes'
FROM
    customers
JOIN orders ON orders.CustomerID = customers.CustomerID
WHERE
    customers.Country = 'France'
GROUP BY
    customers.CompanyName
HAVING COUNT(orders.OrderID) > 10;



-- 5 - Liste des clients ayant un chiffre d’affaires > 30.000
SELECT
    customers.CompanyName 'Client',
    SUM(
        order_details.UnitPrice * order_details.Quantity
    ) 'CA',
    customers.Country 'Pays'
FROM
    customers
JOIN orders ON customers.CustomerID = orders.CustomerID
JOIN order_details ON order_details.OrderID = orders.OrderID
GROUP BY
    customers.CompanyName
HAVING
    SUM(
        order_details.UnitPrice * order_details.Quantity
    ) > 30000
ORDER BY
    SUM(
        order_details.UnitPrice * order_details.Quantity
    )
DESC;



-- 6 – Liste des pays dont les clients ont passé commande de produits fournis par «Exotic Liquids»
SELECT
    DISTINCT customers.Country 'Pays'
FROM
    customers
JOIN orders ON orders.CustomerID = customers.CustomerID
JOIN order_details ON order_details.OrderID = orders.OrderID
JOIN products ON products.ProductID = order_details.ProductID
JOIN suppliers ON suppliers.SupplierID = products.SupplierID
WHERE
    suppliers.CompanyName = 'Exotic Liquids'
ORDER BY customers.Country;



-- 7 – Montant des ventes de 1997
SELECT
    SUM(
        order_details.Quantity * order_details.UnitPrice
    ) 'Montant Ventes 97'
FROM
    order_details
JOIN orders ON order_details.OrderID = orders.OrderID
WHERE YEAR(orders.OrderDate) = 1997;



-- 8 –  Montant des ventes de 1997 mois par mois
SELECT
    MONTH(orders.OrderDate) 'Mois 97',
    SUM(
        order_details.Quantity * order_details.UnitPrice
    ) 'Montant Ventes'
FROM
    orders
JOIN order_details ON order_details.OrderID = orders.OrderID
WHERE
    YEAR(orders.OrderDate) = 1997
GROUP BY MONTH(orders.OrderDate);


-- 9 – Depuis quelle date le client « Du monde entier » n’a plus commandé ? 
SELECT
    orders.OrderDate 'Date de dernière commande'
FROM
    orders
JOIN customers ON orders.CustomerID = customers.CustomerID
WHERE
    customers.CompanyName = 'Du monde entier'
ORDER BY
    OrderDate
DESC
LIMIT 1;


-- 10 – Quel est le délai moyen de livraison en jours ?
SELECT
    ROUND(
        AVG(
            DATEDIFF(
                orders.ShippedDate,
                orders.OrderDate
            )
        ),
        0
    ) 'Délai moyen de livraison en jours'
FROM orders;



-- 2) Procédures stockées

-- Depuis quelle date le client «  » n’a plus commandé ?
-- requête 9
DELIMITER |
CREATE PROCEDURE Dern_commande(IN cli VARCHAR(40))
BEGIN
SELECT
    orders.OrderDate 'Date de dernière commande'
FROM
    orders
JOIN customers ON orders.CustomerID = customers.CustomerID
WHERE
    customers.CompanyName LIKE cli
ORDER BY
    OrderDate
DESC
LIMIT 1;
END |
DELIMITER ;

CALL Dern_commande("");

SHOW CREATE PROCEDURE Dern_commande;


-- requête 10
DELIMITER |
CREATE PROCEDURE time_limit()
BEGIN
SELECT
    ROUND(
        AVG(
            DATEDIFF(
                orders.ShippedDate,
                orders.OrderDate
            )
        ),
        0
    ) 'Délai moyen de livraison en jours'
FROM orders;
END |
DELIMITER ;

CALL time_limit();



--3) Mise en place d'une règle de gestion
DELIMITER $$
CREATE TRIGGER before_insert_order_details
BEFORE INSERT 
ON order_details
FOR EACH ROW
BEGIN
    DECLARE same_country int;
    SET same_country = (SELECT suppliers.SupplierID
        FROM order_details
        JOIN orders ON orders.`OrderID` = order_details.OrderID
        JOIN customers ON customers.CustomerID = orders.CustomerID
        JOIN products ON products.ProductID = order_details.ProductID
        JOIN suppliers ON suppliers.SupplierID = products.SupplierID
        WHERE suppliers.Country = customers.Country
            AND order_details.ProductID = NEW.ProductID 
            AND order_details.OrderID = NEW.OrderID);
        IF same_country IS NULL
        THEN
        SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'pays vendeur et client correspondre pas!';
    END IF;
END $$
DELIMITER ;