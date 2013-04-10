/*DROP TABLE Credit CASCADE CONSTRAINTS PURGE;*/
DROP TABLE LignesReleveCompte CASCADE CONSTRAINTS PURGE;
DROP TABLE ReleveDeCompte CASCADE CONSTRAINTS PURGE;
DROP TABLE Operation CASCADE CONSTRAINTS PURGE;
/*DROP TABLE Virement CASCADE CONSTRAINTS PURGE;*/
DROP TABLE Compte CASCADE CONSTRAINTS PURGE;
DROP TABLE CatDepRev CASCADE CONSTRAINTS PURGE; 
DROP TABLE TypeOperation CASCADE CONSTRAINTS PURGE;
DROP TABLE TypeCompte CASCADE CONSTRAINTS PURGE;
DROP TABLE Client CASCADE CONSTRAINTS PURGE;


CREATE TABLE Client (
  Client_id INT NOT NULL,
  Client_nom VARCHAR(50),
  Client_prenom VARCHAR(50),
  Client_telephone VARCHAR(10),
  CONSTRAINT PK_Client PRIMARY KEY (Client_id)
);

CREATE TABLE TypeCompte (
  TypeCpte_id INT NOT NULL,
  TypeCpte_libelle VARCHAR(100),
  TypeCpte_pourcentInterets NUMBER(5,2),
  CONSTRAINT PK_TypeCompte PRIMARY KEY (TypeCpte_id)
);

CREATE TABLE TypeOperation (
  TypeOp_id INT NOT NULL,
  TypeOp_libelle VARCHAR(100),
  CONSTRAINT PK_TypeOperation PRIMARY KEY (TypeOp_id)
);

CREATE TABLE CatDepRev (
  CatDepRev_id INT NOT NULL,
  CatDepRev_libelle VARCHAR(100),
  CONSTRAINT PK_CatDepRev PRIMARY KEY (CatDepRev_id)
);

CREATE TABLE Compte (
  Compte_id INT NOT NULL,
  Compte_dateCreation DATE,
  Compte_plafond DECIMAL,
  Compte_seuilMin NUMBER(5,2),
  Compte_solde DECIMAL,
  Compte_idTypeCpte INT,
  Compte_idClient INT,
  CONSTRAINT PK_Compte PRIMARY KEY (Compte_id),
  CONSTRAINT FK_Compte_TypeCompte FOREIGN KEY (Compte_idTypeCpte) REFERENCES TypeCompte(TypeCpte_id),
  CONSTRAINT FK_Compte_Client FOREIGN KEY (Compte_idClient) REFERENCES Client(Client_id)
);

/*CREATE TABLE Virement (
  Vir_id INT NOT NULL,
  Vir_montant DECIMAL,
  Vir_dateVir DATE,
  Vir_idCpteAPrelever INT,
  Vir_idCpteACrediter INT,
  Vir_idCatDepRev INT,
  Vir_idReleveDeCompte INT,
  CONSTRAINT PK_Virement PRIMARY KEY (Vir_id),
  CONSTRAINT FK_Virement_CpteAPrelever FOREIGN KEY (Vir_idCpteAPrelever) REFERENCES Compte(Compte_id),
  CONSTRAINT FK_Virement_CpteACrediter FOREIGN KEY (Vir_idCpteACrediter) REFERENCES Compte(Compte_id),
  CONSTRAINT FK_Virement_CatDepRev FOREIGN KEY ( Vir_idCatDepRev) REFERENCES  CatDepRev(CatDepRev_id),
  CONSTRAINT FK_Virement_ReleveDeCompte FOREIGN KEY (Vir_idReleveDeCompte) REFERENCES  ReleveDeCompte(ReleveDeCompte_id)
);*/

CREATE TABLE Operation (
  Op_id INT NOT NULL,
  Op_montant DECIMAL,
  Op_dateOp DATE,
  Op_idCpteAPrelever INT,
  Op_idCpteACrediter INT,
  Op_idTypeOp INT,
  Op_idCatDepRev INT,
  /*Op_idCpteAOperer INT,*/
  CONSTRAINT PK_Operation PRIMARY KEY (Op_id),
  CONSTRAINT FK_Operation_CpteAPrelever FOREIGN KEY (Op_idCpteAPrelever) REFERENCES Compte(Compte_id),
  CONSTRAINT FK_Operation_CpteACrediter FOREIGN KEY (Op_idCpteACrediter) REFERENCES Compte(Compte_id),
  CONSTRAINT FK_Operation_TypeOperation FOREIGN KEY (Op_idTypeOp) REFERENCES TypeOperation(TypeOp_id),
  CONSTRAINT FK_Operation_CatDepRev FOREIGN KEY (Op_idCatDepRev) REFERENCES CatDepRev(CatDepRev_id)
  /*CONSTRAINT FK_Operation_CpteAOperer FOREIGN KEY (Op_idCpteAOperer) REFERENCES  Compte(Compte_id),*/
);

CREATE TABLE ReleveDeCompte (
  ReleveDeCompte_id INT NOT NULL,
  ReleveDeCompte_dateEdition DATE,
  ReleveDeCompte_dateDebut DATE,
  ReleveDeCompte_dateFin DATE,
  CONSTRAINT PK_ReleveDeCompte PRIMARY KEY (ReleveDeCompte_id)
);

CREATE TABLE LignesReleveCompte (
    ReleveDeCompte_id INT NOT NULL,
    Op_id INT NOT NULL,
  CONSTRAINT PK_LRelCpte PRIMARY KEY (Op_id,ReleveDeCompte_id),
  CONSTRAINT FK_LRelCpte_Op_id FOREIGN KEY (Op_id) REFERENCES Operation(Op_id),
  CONSTRAINT FK_LRelCpte_RelCpte_id FOREIGN KEY (ReleveDeCompte_id) REFERENCES ReleveDeCompte(ReleveDeCompte_id)
);

/*CREATE TABLE Credit (
  Credit_id INT NOT NULL,
  Credit_pourcentageInterets DECIMAL,
  Credit_montant DECIMAL,
  Credit_dateDebut DATE,
  Credit_nombreMois INT,
  Credit_idCompte INT,
  CONSTRAINT PK_Credit PRIMARY KEY (Credit_id),
  CONSTRAINT FK_Credit_Compte FOREIGN KEY (Credit_idCompte) REFERENCES  Compte(Compte_id)
);*/