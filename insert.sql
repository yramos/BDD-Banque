--Insert Client
insert into Client (Client_id, Client_nom, Client_prenom, Client_telephone) 
  values(1,'MORA','Stéphane','0556051111');

  
--Insert TypeCompte
insert into TypeCompte (TypeCpte_id,TypeCpte_libelle,TypeCpte_pourcentInterets) 
  values(1,'Courant',null);
insert into TypeCompte (TypeCpte_id,TypeCpte_libelle,TypeCpte_pourcentInterets) 
  values(2,'Livret A',1.75);
insert into TypeCompte (TypeCpte_id,TypeCpte_libelle,TypeCpte_pourcentInterets) 
  values(3,'Compte épargne logement',1.25);


--Insert TypeOperation
insert into TypeOperation (TypeOp_id, TypeOp_libelle) 
  values(1,'Crédit de compte');
insert into TypeOperation (TypeOp_id, TypeOp_libelle) 
  values(2,'Retrait');
insert into TypeOperation (TypeOp_id, TypeOp_libelle) 
  values(3,'Paiement');
insert into TypeOperation (TypeOp_id, TypeOp_libelle) 
  values(4,'Clôture de compte');
insert into TypeOperation (TypeOp_id, TypeOp_libelle) 
  values(5,'Virement');
  
  
--Insert CatDepRev
insert into CatDepRev (CatDepRev_id,CatDepRev_libelle) 
  values(1,'Taxes');
insert into CatDepRev (CatDepRev_id,CatDepRev_libelle) 
  values(2,'Intérêt');
insert into CatDepRev (CatDepRev_id,CatDepRev_libelle) 
  values(3,'Alimentation');
insert into CatDepRev (CatDepRev_id,CatDepRev_libelle) 
  values(4,'Habillement');
insert into CatDepRev (CatDepRev_id,CatDepRev_libelle) 
  values(5,'Loisirs');
insert into CatDepRev (CatDepRev_id,CatDepRev_libelle) 
  values(6,'Automobile');
insert into CatDepRev (CatDepRev_id,CatDepRev_libelle) 
  values(7,'Informatique');
insert into CatDepRev (CatDepRev_id,CatDepRev_libelle) 
  values(8,'Sans Catégorie');
  
  
--Insert Compte
insert into Compte (Compte_id,Compte_dateCreation,Compte_plafond,
Compte_seuilMin,Compte_solde,Compte_idTypeCpte,Compte_idClient) 
  values(1,TO_DATE('11/09/2001','dd/mm/yyyy'),75000,10,25000,1,1);
insert into Compte (Compte_id,Compte_dateCreation,Compte_plafond,
Compte_seuilMin,Compte_solde,Compte_idTypeCpte,Compte_idClient) 
  values(2,TO_DATE('11/09/2004','dd/mm/yyyy'),22950,1.5,12000,2,1);
insert into Compte (Compte_id,Compte_dateCreation,Compte_plafond,
Compte_seuilMin,Compte_solde,Compte_idTypeCpte,Compte_idClient) 
  values(3,TO_DATE('01/01/1970','dd/mm/yyyy'),61200,225,50000,3,1);
  
  
--Insert Operation
/*Sans catégorie*/ --crédit de compte
insert into Operation (Op_id,Op_montant,Op_dateOp,Op_idCpteAPrelever,
Op_idCpteACrediter,Op_idTypeOp,Op_idCatDepRev) 
  values(1,2000,TO_DATE('05/02/2012','dd/mm/yyyy'),null,1,1,8);
/*Sans Catégorie*/ --virement
insert into Operation (Op_id,Op_montant,Op_dateOp,Op_idCpteAPrelever,
Op_idCpteACrediter,Op_idTypeOp,Op_idCatDepRev) 
  values(2,1000,TO_DATE('05/02/2012','dd/mm/yyyy'),2,1,5,8);
/*Informatique*/ -- paiement
insert into Operation (Op_id,Op_montant,Op_dateOp,Op_idCpteAPrelever,
Op_idCpteACrediter,Op_idTypeOp,Op_idCatDepRev) 
  values(3,900,TO_DATE('20/12/2012','dd/mm/yyyy'),1,null,3,7);
/*Taxes*/ --paiement
insert into Operation (Op_id,Op_montant,Op_dateOp,Op_idCpteAPrelever,
Op_idCpteACrediter,Op_idTypeOp,Op_idCatDepRev) 
  values(4,4,TO_DATE('11/09/2012','dd/mm/yyyy'),1,null,3,1);
/*Interets*/ --credit de compte
insert into Operation (Op_id,Op_montant,Op_dateOp,Op_idCpteAPrelever,
Op_idCpteACrediter,Op_idTypeOp,Op_idCatDepRev) 
  values(5,10,TO_DATE('20/06/2012','dd/mm/yyyy'),null,2,1,2);
insert into Operation (Op_id,Op_montant,Op_dateOp,Op_idCpteAPrelever,
Op_idCpteACrediter,Op_idTypeOp,Op_idCatDepRev) 
  values(6,100,TO_DATE('20/06/2012','dd/mm/yyyy'),null,3,1,2);
/*Alimentation*/ --paiement
insert into Operation (Op_id,Op_montant,Op_dateOp,Op_idCpteAPrelever,
Op_idCpteACrediter,Op_idTypeOp,Op_idCatDepRev) 
  values(7,90,TO_DATE('14/07/2012','dd/mm/yyyy'),1,null,3,3);
/*Habillement*/ --paiement
insert into Operation (Op_id,Op_montant,Op_dateOp,Op_idCpteAPrelever,
Op_idCpteACrediter,Op_idTypeOp,Op_idCatDepRev) 
  values(8,200,TO_DATE('18/01/2012','dd/mm/yyyy'),1,null,3,4);
/*Loisir*/ -- paiement
insert into Operation (Op_id,Op_montant,Op_dateOp,Op_idCpteAPrelever,
Op_idCpteACrediter,Op_idTypeOp,Op_idCatDepRev) 
  values(9,3000,TO_DATE('15/08/2012','dd/mm/yyyy'),2,null,3,5);
/*Automobile*/ --paiement
insert into Operation (Op_id,Op_montant,Op_dateOp,Op_idCpteAPrelever,
Op_idCpteACrediter,Op_idTypeOp,Op_idCatDepRev) 
  values(10,654,TO_DATE('05/12/2012','dd/mm/yyyy'),1,null,3,6);


--ReleveDeCompte
insert into ReleveDeCompte (ReleveDeCompte_id,ReleveDeCompte_dateEdition,ReleveDeCompte_dateDebut,ReleveDeCompte_dateFin) 
  values(1,TO_DATE('01/06/2012','dd/mm/yyyy'),TO_DATE('01/01/2012','dd/mm/yyyy'),TO_DATE('31/05/2012','dd/mm/yyyy'));
insert into ReleveDeCompte (ReleveDeCompte_id,ReleveDeCompte_dateEdition,ReleveDeCompte_dateDebut,ReleveDeCompte_dateFin) 
  values(2,TO_DATE('01/01/2013','dd/mm/yyyy'),TO_DATE('01/06/2012','dd/mm/yyyy'),TO_DATE('31/12/2012','dd/mm/yyyy'));
  

--LignesReleveCompte
/*Relevé 6 premiers mois*/
insert into LignesReleveCompte (ReleveDeCompte_id,Op_id) 
  values(1,1);
insert into LignesReleveCompte (ReleveDeCompte_id,Op_id) 
  values(1,2);
insert into LignesReleveCompte (ReleveDeCompte_id,Op_id) 
  values(1,7);
/*Relevé 6 derniers mois*/
insert into LignesReleveCompte (ReleveDeCompte_id,Op_id) 
  values(2,3);
insert into LignesReleveCompte (ReleveDeCompte_id,Op_id) 
  values(2,4);
insert into LignesReleveCompte (ReleveDeCompte_id,Op_id) 
  values(2,5);
insert into LignesReleveCompte (ReleveDeCompte_id,Op_id) 
  values(2,6);
insert into LignesReleveCompte (ReleveDeCompte_id,Op_id) 
  values(2,8);
insert into LignesReleveCompte (ReleveDeCompte_id,Op_id) 
  values(2,9);
insert into LignesReleveCompte (ReleveDeCompte_id,Op_id) 
  values(2,10);
  
  
--