drop table if exists gtop.interactions_smiles;
create table if not exists gtop.interactions_smiles
(select DISTINCT interactions.*,ligands.SMILES from interactions inner join ligands on interactions.ligand_id = ligands.`Ligand id`)