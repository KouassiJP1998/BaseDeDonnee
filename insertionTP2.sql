-- PARTIE 1 : --
-- VALIDE --
INSERT INTO OUVRAGES VALUES('DH11', 'La délicatesse du homard', 260, 2026, 'Français', 'Bookelis', 'Manel', 'Laure');

-- VALIDE --
INSERT INTO OUVRAGES VALUES('CE25', 'Chagrin d''école', 304, 2007, 'Français', 'Gallimard', 'Pennac', 'Daniel');

-- Sujet à erreur : doublons --
-- VALIDE, correction -> Changement valeur identifiant(codOuv) --
INSERT INTO OUVRAGES VALUES('CE26', 'Le cas malaussene t.1 ils m''ont menti', 306, 2017, 'Français', 'Gallimard', 'Pennac', 'Daniel');

--BIBLIOTHEQUES--
INSERT INTO BIBLIOTHEQUES VALUES('MTAL', 'Médiathèque André Labarrère', 'Place Marguerite Laborde', '64000', 'Pau');

INSERT INTO BIBLIOTHEQUES VALUES('MTJU', 'Médiathèque de Jurançon', 'Rue Louis Barthou', '64110', 'Jurançon');


--PRESENT--
-- Erreur : valeur inexistante , clé étrangère --
-- Correction : Affectation valeur existante --
INSERT INTO PRESENT VALUES('MTAL','DH11');

INSERT INTO PRESENT VALUES('MTJU','DH11');

INSERT INTO PRESENT VALUES('MTAL','CE26');

-- Erreur doublon sur la clé primaire concaténée --
INSERT INTO PRESENT VALUES('MTJU','CE26');


-- PARTIE 2 --
-- 1ère bulle --
INSERT INTO PERSONNES VALUES ('MB58', 'Mansoif', 'Gérard', '51 Rte Saint Emilion', '33000', 'Bordeaux', 'H', '10/04/1980','12/06/2002', NULL);
INSERT INTO OUVRAGES VALUES ('ML01', 'Millénium, t.1 : Les Hommes qui n''aimaient pas les femmes', NULL, 2007, 'Français', NULL, NULL, NULL);
INSERT INTO PRET('08S55', 'MB58', '16/01/2017');

-- 2ème bulle --
INSERT INTO PERSONNES VALUES ('PP92', 'Pourmontailecol', 'Saturnin', '12 rue des Pyrénées', '64000', 'Pau', 'H','07/04/1994','23/03/2003',NULL);
INSERT INTO OUVRAGES VALUES('PM08' , 'Je ne sais pas maigrir' , NULL, 2007, 'Français', NULL, NULL, NULL);
INSERT INTO PRET VALUES('07D02', 'PP92', '18/01/2017');

INSERT INTO OUVRAGES VALUES('CK12', 'Les cerfs-volants de Kaboul', NULL, 2007, 'Français', NULL, NULL, NULL);
INSERT INTO PRET VALUES('08N14', 'PP92', '18/01/2017');

INSERT INTO OUVRAGES VALUES('ML02', 'Millénium, t.2 : La fille qui rêvait d'' bidon d''essence et d''une allumette', NULL, 2007, 'Français', NULL, NULL, NULL);
INSERT INTO PRET VALUES ('08D25', 'PP92', '18/01/2017');

-- 3ème bulle --
INSERT INTO PERSONNES VALUES('AB22', 'Audos', 'Jamel', '33 rue Docteur Psy', '33000', 'Bordeaux', 'H', '15/01/1990', '14/02/2005', NULL);
INSERT INTO OUVRAGES VALUES ('HB04', 'Horreur boréale', NULL, 2007, 'Français', NULL, NULL, NULL);
INSERT INTO PRET VALUES('08J63', 'AB22', '19/01/2017');