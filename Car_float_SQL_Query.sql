-------------------- SQL QUERY --------------------
-- Sacar un listado que contenga la siguiente información:
	-- Nombre modelo, marca y grupo de coches (los nombre de todos)
	-- Fecha de compra
	-- Matricula
	-- Nombre del color del coche
	-- Total kilómetros
	-- Nombre empresa que esta asegurado el coche
	-- Numero de póliza


select m.model_name,
		b.brand_name,
		cg.group_name,
		c.purch_date,
		c.number_plate,
		c2.color_name,
		c.total_kms,
		ri.policy_number,
		i.company_name
from susana_camacho.cars c
left join susana_camacho.models m on c.id_model = m.id_model
left join susana_camacho.brands b on m.id_brandgroup = b.id_brandgroup
left join susana_camacho.car_groups cg on b.id_group = cg.id_group
left join susana_camacho.colors c2 on c.id_color = c2.id_color 
left join susana_camacho.record_insurances ri on c.id_car = ri.id_car 
left join susana_camacho.insurances i on ri.id_inscompany = i.id_inscompany
order by m.model_name asc ;
