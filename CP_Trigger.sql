-- 1.Mettez en place ce trigger, puis ajoutez un produit dans une commande, vérifiez que le champ total est bien mis à jour
DELIMITER |
CREATE TRIGGER maj_total AFTER INSERT ON lignedecommande
    FOR EACH ROW
    BEGIN
        DECLARE id_c INT;
        DECLARE tot DOUBLE;
        SET id_c = NEW.id_commande; -- nous captons le numéro de commande concerné
        SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande=id_c); -- on recalcul le total
        UPDATE commande SET total = (tot*(100-remise)/100) 
        WHERE id=id_c; -- on stocke le total dans la table commande;
END |
DELIMITER ;

-- pour tester
INSERT INTO lignedecommande (id_commande, id_produit, quantite, prix)
VALUES (2, 3, 4, 20);


--2. Ce trigger ne fonctionne que lorsque l'on ajoute des produits dans la commande, 
--les modifications ou suppressions ne permettent pas de recalculer le total.
-- Modifiez le code ci-dessus pour faire en sorte que la modification ou 
-- la suppression de produit recalcul le total de la commande.

DELIMITER |
CREATE TRIGGER update_total AFTER UPDATE ON lignedecommande
    FOR EACH ROW
    BEGIN
        DECLARE id_c INT;
        DECLARE tot DOUBLE;
        SET id_c = NEW.id_commande; -- nous captons le numéro de commande concerné
        SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande=id_c); -- on recalcul le total
        UPDATE commande SET total = (tot*(100-remise)/100)
        WHERE id=id_c; -- on stocke le total dans la table commande;
END |
DELIMITER ;

-- pour tester
UPDATE lignedecommande
SET prix = 35
WHERE id_commande = 2;


DELIMITER |
CREATE TRIGGER delete_total AFTER DELETE ON lignedecommande
    FOR EACH ROW
    BEGIN
        DECLARE id_c INT;
        DECLARE tot DOUBLE;
        SET id_c = OLD.id_commande; -- nous captons le numéro de commande concerné
        SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande=id_c); -- on recalcul le total
        UPDATE commande SET total = (tot*(100-remise)/100)
        WHERE id=id_c; -- on stocke le total dans la table commande;
END |
DELIMITER ;


-- 3. Un champ remise était prévu dans la table commande. Prenez en compte ce champ dans le code de votre trigger.

