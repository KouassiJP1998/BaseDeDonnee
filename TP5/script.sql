-- Requête I --
-- Combien d’ouvrages sont répertoriés dans la base. --
SELECT COUNT(CODOUV) AS NBOUVRAGES
FROM OUVRAGES2;

-- Requête II --
-- Combien d'ouvrages écrits par "Larsson" ont été répertoriés en bibiliothèque avant 2015 --
SELECT COUNT(DISTINCT O.CODOUV) AS NBEXEMPLAIRES
FROM OUVRAGES2 O,EXEMPLAIRES2 E,PRESENT2 PR
WHERE O.CODOUV = PR.CODOUV
AND E.CODOUV = O.CODOUV
AND EXTRACT(YEAR from DATEENTBIB) < 2015
AND NOMAUT='Larsson';

-- Requête III --
-- Combien de personnes empruntent des exemplaires d’un ouvrage de Larsson --
SELECT COUNT(DISTINCT P.CODPERS) AS NBEMPRUNTEURS
FROM PERSONNES2 P,PRET2 PR,EXEMPLAIRES2 E, OUVRAGES2 O
WHERE PR.CODPERS = P.CODPERS
AND PR.CODEX = E.CODEX
AND E.CODOUV = O.CODOUV
AND NOMAUT='Larsson';

-- Requête IV --
-- Quelle est la date de prêt la plus ancienne --
SELECT MIN(DATEP)
FROM PRET2;

-- Requête V --
-- Donnez le nom et le prénom de la personne qui a le prêt le plus ancien --
SELECT NOMPERS,PRENOMPERS
FROM PERSONNES2 P,PRET2 PR
WHERE P.CODPERS = PR.CODPERS
AND PR.DATEP <= MIN(PR.DATEP);
-- Non fonctionnel --

-- Requête VI --
-- Quel est le montant total des cotisations de la bibliothèque "André Labarrère" --
SELECT SUM(MTCOTIS) AS MontantTotalCotis
FROM PERSONNES2 P,BIBLIOTHEQUES2 B
WHERE P.CODBIB = B.CODBIB
AND NOMBIB LIKE '% André Labarrère';

-- PARTIE II --

--Requête 1--
SELECT NOMAUT,PRENOMAUT,COUNT(O.CODOUV)
FROM OUVRAGES2 O,BIBLIOTHEQUES2 B,PRESENT2 P
WHERE O.CODOUV = P.CODOUV
AND P.CODBIB = B.CODBIB
GROUP BY NOMAUT,PRENOMAUT;

--Requête 2--
SELECT NOMBIB,VILLEBIB,COUNT(DISTINCT O.NOMAUT) AS NBAUTEUR
FROM BIBLIOTHEQUES2 B , OUVRAGES2 O , PRESENT2 P
WHERE B.CODBIB = P.CODBIB
AND P.CODOUV = O.CODOUV
GROUP BY NOMBIB,VILLEBIB;

--Requête 3--

SELECT NOMAUT,PRENOMAUT,COUNT(E.CODEX)
FROM EXEMPLAIRES2 E, OUVRAGES2 O
WHERE E.CODOUV = O.CODOUV
AND ANEDIT = 2016
GROUP BY NOMAUT,PRENOMAUT;

--Requête 4--
SELECT O.CODOUV,O.TITOUV,COUNT(E.CODEX)
FROM PRET2 P, EXEMPLAIRES2 E,OUVRAGES2 O
WHERE E.CODOUV = O.CODOUV
AND P.CODEX = E.CODEX
AND P.DATERET > sysdate
GROUP BY O.CODOUV,O.TITOUV;

-- PARTIE III --

--Requête 1--
SELECT P.NOMPERS,P.PRENOMPERS,COUNT(E.CODEX) AS NBEXPRETE
FROM PERSONNES2 P,PRET2 PR, EXEMPLAIRES2 E
WHERE P.CODPERS = PR.CODPERS
AND E.CODEX = PR.CODEX
GROUP BY P.NOMPERS,P.PRENOMPERS
HAVING COUNT(E.CODEX) > 5;


