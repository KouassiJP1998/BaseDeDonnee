-- Création des tables --
CREATE TABLE OUVRAGES(
	codOuv char(4) not null,
	titOuv varchar(70),
	nbPages number(4),
	anEdit number(4),
	langue varchar(20),
	nomEdit varchar(50),
	nomAut varchar(50),
	prenomAut varchar(50),
	constraint pk_OUVRAGES primary key(codOuv),
	constraint ck_OUVRAGES_langue check(langue = 'Français' or langue = 'Anglais'),
	constraint ck_OUVRAGES_nbPages check(nbPages > 0)
);

CREATE TABLE EXEMPLAIRES(
	codEx char(5),
	codOuv char(4) not null,
	dateEntreeBib date,
	constraint pk_EXEMPLAIRES primary key(codex),
	constraint fk_EXEMPLAIRES_OUVRAGES foreign key(codOuv) references OUVRAGES
);

CREATE TABLE BIBLIOTHEQUES(
	codBib char(4),
	nomBib varchar(50),
	rueBib varchar(50),
	cpBib char(5),
	villeBib varchar(30),
	constraint  pk_BIBLIOTHEQUES primary key(codBib)
);

CREATE TABLE PERSONNES(
	codePers char(4),
	nomPers varchar(20),
	prenomPers varchar(20),
	ruePers varchar(50),
	cpPers char(5),
	villePers varchar(30),
	sexe char(1),
	dNaiss date,
	datInscript date,
	codBib char(4),
	constraint pk_PERSONNES primary key(codePers),
	constraint fk_PERSONNES_BIBLIOTHEQUES foreign key(codBib) references BIBLIOTHEQUES,
	constraint ck_PERSONNES_sexe check(sexe in('H','F')),
	constraint ck_PERSONNES_datInscript check(dNaiss < datInscript)
);

CREATE TABLE PRET (
	codEx char(5),
	codePers char(4) not null,
	dateP date,
	constraint pk_PRET primary key(codEx),
	constraint fk_PRET_EXEMPLAIRES foreign key(codEx) references EXEMPLAIRES,
	constraint fk_PRET_PERSONNES foreign key(codePers) references PERSONNES
);


CREATE TABLE PRESENT(
	codBib char(4),
	codOuv char(4),
	constraint pk_PRESENT primary key(codBib,codOuv),
	constraint fk_PRESENT_BIBLIOTHEQUES foreign key(codBib) references BIBLIOTHEQUES,
	constraint fk_PRESENT_OUVRAGES foreign key(codOuv) references OUVRAGES
);