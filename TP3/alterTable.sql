--ALTER TABLE OUVRAGES MODIFY titOuv varchar(70);
-- Vérification avec : DESC OUVRAGES --
-- + verification DESC EXEMPLAIRES --

--ALTER TABLE PRET ADD(dateRet date);
UPDATE PRET set dateRet = sysdate + 20;
-- Par défaut un livre devra être rendu 20 jours après qu'il ait été emprunté --



-- Cotisation pour les moins de 25 ans ou plus de 60 ans --
--ALTER TABLE PERSONNES ADD(mtCotis number(2));

UPDATE PERSONNES set mtCotis = 20 
WHERE (EXTRACT(YEAR FROM sysdate)-EXTRACT(YEAR from dNaiss)) < 25
OR (EXTRACT(YEAR FROM sysdate)-EXTRACT(YEAR from dNaiss)) > 60;

-- Cotisation pour les autres personnes --
UPDATE PERSONNES set mtCotis = 45 
WHERE (EXTRACT(YEAR FROM sysdate)-EXTRACT(YEAR from dNaiss)) > 25
AND (EXTRACT(YEAR FROM sysdate)-EXTRACT(YEAR from dNaiss)) < 60;

UPDATE PERSONNES set mtCotis = mtCotis-(mtCotis*10/100)
WHERE (EXTRACT(YEAR FROM sysdate)-EXTRACT(YEAR from datInscript)) > 5;

