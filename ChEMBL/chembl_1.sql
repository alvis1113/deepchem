drop table if exists IC50_KN;
create table IC50_KN


select T4.* from
(
select
	T3.*,
	target_dictionary.pref_name,
	target_dictionary.organism
from
	(
		select
			T2.*,
			assays.tid
		from
			(
				select
					assay_id,
					standard_value,
					standard_units,
					canonical_smiles
				from
					(
						select
							activities.*,
							compound_structures.canonical_smiles
						from
							activities
						left join compound_structures ON
							activities.molregno = compound_structures.molregno
					) T
				where
					T.standard_type = "IC50"
					and T.standard_units = "nM"
			) T2
		left join assays on
			T2.assay_id = assays.assay_id
	) T3
left join target_dictionary on
	T3.tid = target_dictionary.tid
) T4
where T4.organism = "Homo sapiens" or T4.organism = "Rattus norvegicus" or T4.organism = "Mus musculus"

;
