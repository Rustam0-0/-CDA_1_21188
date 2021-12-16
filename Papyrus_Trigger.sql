CREATE TABLE ARTICLES_A_COMMANDER(
    codart CHAR(4),
    date_com DATE NOT NULL DEFAULT (CURRENT_DATE),
    qte INT,
    FOREIGN KEY(codart) REFERENCES produit(codart)
);

CREATE TRIGGER after_products_update
AFTER UPDATE 
ON produit
FOR EACH ROW
BEGIN    
    IF (new.stkphy < new.stkale)
    THEN
        IF NOT EXISTS(SELECT codart FROM commander_articles WHERE codart = new.codart)
        THEN
        INSERT INTO ARTICLES_A_COMMANDER(codart, qte, date_com)
        VALUES(new.codart, (new.stkale - new.stkphy), CURRENT_DATE);
        ELSE 
        UPDATE ARTICLES_A_COMMANDER
        SET codart = new.codart, qte = (new.stkale - new.stkphy), date_com = CURRENT_DATE
        WHERE codart = new.codart;
        END IF;
    ELSE
    DELETE FROM ARTICLES_A_COMMANDER WHERE codart = new.codart;
    END IF;
END