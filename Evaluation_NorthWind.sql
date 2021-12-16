-- 1 - Liste des contacts français
SELECT
    customers.CompanyName 'Société',
    customers.ContactName 'Contact',
    customers.ContactTitle 'Fonction',
    customers.Phone 'Téléphone'
FROM
    customers
WHERE
    customers.Country = 'France';

-- 2 - Produits vendus par le fournisseur « Exotic Liquids »
SELECT
    products.ProductName,
    products.UnitPrice
FROM
    products
JOIN suppliers ON products.SupplierID = suppliers.SupplierID
WHERE
    suppliers.CompanyName = 'Exotic Liquids';

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
HAVING
    COUNT(orders.OrderID) > 10;