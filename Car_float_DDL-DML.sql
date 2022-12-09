---Crear mi espacio de trabajo (esquema)
create schema susana_camacho authorization ymonrsxh;


--------- DDL: CREACIÓN DE TABLAS Y SUS CORRESPONDIENTES PK ---------
--- 1.Tabla cars
create table susana_camacho.cars(
	id_car varchar(50) not null, --PK
	id_model varchar(100) not null, --FK --> models -> id_model
	id_color varchar (50) not null, --FK --> colors -> id_color
	number_plate varchar(50) not null,
	total_kms integer not null,
	purch_date date not null default '4000-01-01',
	description varchar(300) null
);

--Creación de su correspondiente PK
alter table susana_camacho.cars
add constraint cars_PK primary key (id_car);


--- 2.Tabla models
create table susana_camacho.models(
	id_model varchar(50) not null, --PK
	model_name varchar(100) not null,
	id_brandgroup varchar (100) not null, --FK --> brands -> id_brandgroup
	description varchar(300) null
);

--Creación de su correspondiente PK
alter table susana_camacho.models
add constraint models_PK primary key (id_model);


--- 3.Tabla brands
create table susana_camacho.brands(
	id_brandgroup varchar(50) not null, --PK
	brand_name varchar(100) not null,
	id_group varchar (100) not null, --FK --> car_groups -> id_group
	description varchar(300) null
);

--Creación de su correspondiente PK
alter table susana_camacho.brands
add constraint brands_PK primary key (id_brandgroup);


--- 4.Tabla car_groups
create table susana_camacho.car_groups(
	id_group varchar(50) not null, --PK
	group_name varchar(100) not null,
	description varchar(300) null
);

--Creación de su correspondiente PK
alter table susana_camacho.car_groups
add constraint car_group_PK primary key (id_group);


--- 5.Tabla colors
create table susana_camacho.colors(
	id_color varchar(50) not null, --PK
	color_name varchar(100) not null,
	description varchar(300) null
);

--Creación de su correspondiente PK
alter table susana_camacho.colors
add constraint colors_PK primary key (id_color);


--- 6.Tabla record_insurances
create table susana_camacho.record_insurances(
	id_car varchar(50) not null, --PK, FK --> cars -> id_car 
	policy_number varchar(50) not null, --PK
	id_inscompany varchar(50) not null, --FK --> insurances -> id_inscompany
	date_start date not null default '4000-01-01',
	date_final date null default '4000-01-01',
	description varchar(300) null
);

--Creación de su correspondiente PK
alter table susana_camacho.record_insurances
add constraint record_insurances_PK primary key (id_car, policy_number);


--- 7.Tabla insurances
create table susana_camacho.insurances(
	id_inscompany varchar(50) not null, --PK
	company_name varchar(100) not null,
	description varchar(300) null
);

--Creación de su correspondiente PK
alter table susana_camacho.insurances
add constraint insurances_PK primary key (id_inscompany);


--- 8.Tabla car_test
create table susana_camacho.car_test(
	id_car varchar(50) not null, --PK, FK --> cars -> id_car 
	test_date date not null default '4000-01-01', --PK
	kms_test integer not null,
	test_price integer not null,
	type_currency varchar(50) not null, --FK --> currencies -> type_currency
	description varchar(300) null
);

--Creación de su correspondiente PK
alter table susana_camacho.car_test
add constraint car_test_PK primary key (id_car, test_date);


--- 9.Tabla currencies
create table susana_camacho.currencies(
	type_currency varchar(50) not null, --PK
	currency varchar(50) not null,
	description varchar(300) null
);

--Creación de su correspondiente PK
alter table susana_camacho.currencies
add constraint currencies_PK primary key (type_currency);


--------- CREACIÓN DE LAS FK DE LAS TABLAS ---------
--- Tabla_1 cars
alter table susana_camacho.cars
add constraint cars_models_FK foreign key (id_model)
references susana_camacho.models (id_model);

alter table susana_camacho.cars
add constraint cars_colors_FK foreign key (id_color)
references susana_camacho.colors (id_color);

--- Tabla_2 models
alter table susana_camacho.models
add constraint models_brand_FK foreign key (id_brandgroup)
references susana_camacho.brands (id_brandgroup);

--- Tabla_3 brands
alter table susana_camacho.brands
add constraint brandgroups_FK foreign key (id_group)
references susana_camacho.car_groups (id_group);

--- Tabla_6 record_insurances
alter table susana_camacho.record_insurances
add constraint record_insurances_FK foreign key (id_car)
references susana_camacho.cars (id_car);

alter table susana_camacho.record_insurances
add constraint insurances_companies_FK foreign key (id_inscompany)
references susana_camacho.insurances (id_inscompany);

--- Tabla_8 car_test
alter table susana_camacho.car_test
add constraint car_test_FK foreign key (id_car)
references susana_camacho.cars (id_car);

alter table susana_camacho.car_test
add constraint test_currency_FK foreign key (type_currency)
references susana_camacho.currencies (type_currency);


--------- DML: INTRODUCCIÓN DE DATOS EN LAS TABLAS ---------
--- Tabla_4 car_groups
insert into susana_camacho.car_groups
(id_group, group_name)
values ('01', 'BMW Group');

insert into susana_camacho.car_groups
(id_group, group_name)
values ('02', 'PSA Groupe');

insert into susana_camacho.car_groups
(id_group, group_name)
values ('03', 'FCA');

insert into susana_camacho.car_groups
(id_group, group_name)
values ('04', 'Ford');

insert into susana_camacho.car_groups
(id_group, group_name)
values ('05', 'Honda');

insert into susana_camacho.car_groups
(id_group, group_name)
values ('06', 'Hyundai');

insert into susana_camacho.car_groups
(id_group, group_name)
values ('07', 'Nissan Motor Corporation');

insert into susana_camacho.car_groups
(id_group, group_name)
values ('08', 'Volkswagen');


--- Tabla_5 colors
insert into susana_camacho.colors
(id_color, color_name)
values ('01', 'Negro');

insert into susana_camacho.colors
(id_color, color_name)
values ('02', 'Rojo');

insert into susana_camacho.colors
(id_color, color_name)
values ('03', 'Blanco');

insert into susana_camacho.colors
(id_color, color_name)
values ('04', 'Gris');

insert into susana_camacho.colors
(id_color, color_name)
values ('05', 'Verde');

insert into susana_camacho.colors
(id_color, color_name)
values ('06', 'Azul');

insert into susana_camacho.colors
(id_color, color_name)
values ('07', 'Amarillo');


--- Tabla_7 insurances
insert into susana_camacho.insurances
(id_inscompany, company_name)
values ('01', 'Alllianz');

insert into susana_camacho.insurances
(id_inscompany, company_name)
values ('02', 'Mapfre');

insert into susana_camacho.insurances
(id_inscompany, company_name)
values ('03', 'Mutua Madrileña');

insert into susana_camacho.insurances
(id_inscompany, company_name)
values ('04', 'Axa');

insert into susana_camacho.insurances
(id_inscompany, company_name)
values ('05', 'Liberty');


--- Tabla_9 currencies
insert into susana_camacho.currencies
(type_currency, currency, description)
values ('01', 'EUR', 'Euros');

insert into susana_camacho.currencies
(type_currency, currency, description)
values ('02', 'USD', 'Dolares');

insert into susana_camacho.currencies
(type_currency, currency, description)
values ('03', 'GBP', 'Libras');

insert into susana_camacho.currencies
(type_currency, currency, description)
values ('04', 'JPY', 'Yenes');


--- Tabla_3 brands
insert into susana_camacho.brands
(id_brandgroup, brand_name, id_group)
values ('01', 'BMW', '01');

insert into susana_camacho.brands
(id_brandgroup, brand_name, id_group)
values ('02', 'Peugeot', '02');

insert into susana_camacho.brands
(id_brandgroup, brand_name, id_group)
values ('03', 'Alfa', '03');

insert into susana_camacho.brands
(id_brandgroup, brand_name, id_group)
values ('04', 'Ford', '04');

insert into susana_camacho.brands
(id_brandgroup, brand_name, id_group)
values ('05', 'Honda', '05');

insert into susana_camacho.brands
(id_brandgroup, brand_name, id_group)
values ('06', 'Hyundai', '06');

insert into susana_camacho.brands
(id_brandgroup, brand_name, id_group)
values ('07', 'Renault', '07');

insert into susana_camacho.brands
(id_brandgroup, brand_name, id_group)
values ('08', 'Volkswagen', '08');


--- 2.Tabla models
insert into susana_camacho.models
(id_model, model_name, id_brandgroup)
values ('01', 'Romeo', '03');

insert into susana_camacho.models
(id_model, model_name, id_brandgroup)
values ('02', 'X5', '01');

insert into susana_camacho.models
(id_model, model_name, id_brandgroup)
values ('03', 'Focus', '04');

insert into susana_camacho.models
(id_model, model_name, id_brandgroup)
values ('04', 'Tucson', '06');

insert into susana_camacho.models
(id_model, model_name, id_brandgroup)
values ('05', 'Clio', '07');

insert into susana_camacho.models
(id_model, model_name, id_brandgroup)
values ('06', '308', '02');

insert into susana_camacho.models
(id_model, model_name, id_brandgroup)
values ('07', 'Civic', '05');

insert into susana_camacho.models
(id_model, model_name, id_brandgroup)
values ('08', 'Stilo', '03');

insert into susana_camacho.models
(id_model, model_name, id_brandgroup)
values ('09', 'Polo', '08');


--- Tabla_1 cars
insert into susana_camacho.cars
(id_car, id_model, id_color, number_plate, total_kms, purch_date)
values ('0001', '01', '01', '7991-BHX', 108887, '2011-09-06');

insert into susana_camacho.cars
(id_car, id_model, id_color, number_plate, total_kms, purch_date)
values ('0002', '09', '05', '0628-BSD', 210553, '2013-11-11');

insert into susana_camacho.cars
(id_car, id_model, id_color, number_plate, total_kms, purch_date)
values ('0003', '07', '04', '4840-HTS', 140947, '2018-06-01');

insert into susana_camacho.cars
(id_car, id_model, id_color, number_plate, total_kms, purch_date)
values ('0004', '03', '03', '2039-DLT', 198576, '2019-01-05');

insert into susana_camacho.cars
(id_car, id_model, id_color, number_plate, total_kms, purch_date)
values ('0005', '05', '01', '9473-CLX', 173098, '2017-10-08');

insert into susana_camacho.cars
(id_car, id_model, id_color, number_plate, total_kms, purch_date)
values ('0006', '08', '02', '1733-FNS', 97456, '2011-03-10');

insert into susana_camacho.cars
(id_car, id_model, id_color, number_plate, total_kms, purch_date)
values ('0007', '02', '07', '8746-GND', 108887, '2013-12-15');

insert into susana_camacho.cars
(id_car, id_model, id_color, number_plate, total_kms, purch_date)
values ('0008', '06', '01', '9091-CKT', 986450, '2010-07-29');

insert into susana_camacho.cars
(id_car, id_model, id_color, number_plate, total_kms, purch_date)
values ('0009', '04', '06', '7991-FPV', 109764, '2012-10-17');

insert into susana_camacho.cars
(id_car, id_model, id_color, number_plate, total_kms, purch_date)
values ('0010', '01', '04', '6941-BNV', 229876, '2013-05-02');

insert into susana_camacho.cars
(id_car, id_model, id_color, number_plate, total_kms, purch_date)
values ('0011', '05', '03', '6594-HMJ', 60474, '2015-04-13');


--- Tabla_6 record_insurances
insert into susana_camacho.record_insurances
(id_car, policy_number, id_inscompany, date_start, date_final)
values ('0001', '7474987365', '01', '2007-09-17', '2012-08-30');

insert into susana_camacho.record_insurances
(id_car, policy_number, id_inscompany, date_start, date_final)
values ('0002', '0984759845', '03', '2004-03-01', '2015-06-05');

insert into susana_camacho.record_insurances
(id_car, policy_number, id_inscompany, date_start, date_final)
values ('0003', '8446923847', '01', '2010-07-10', '2011-07-10');

insert into susana_camacho.record_insurances
(id_car, policy_number, id_inscompany, date_start, date_final)
values ('0004', '4784687598', '03', '2019-03-11', '2020-01-01');

insert into susana_camacho.record_insurances
(id_car, policy_number, id_inscompany, date_start, date_final)
values ('0005', '9754349407', '04', '2011-11-05', '2013-11-05');

insert into susana_camacho.record_insurances
(id_car, policy_number, id_inscompany, date_start, date_final)
values ('0006', '2958654987', '05', '2017-06-22', '2020-03-30');

insert into susana_camacho.record_insurances
(id_car, policy_number, id_inscompany, date_start, date_final)
values ('0007', '3409875378', '01', '2021-02-08', '2021-12-02');

insert into susana_camacho.record_insurances
(id_car, policy_number, id_inscompany, date_start, date_final)
values ('0008', '5698576980', '02', '2005-09-03', '2009-01-15');

insert into susana_camacho.record_insurances
(id_car, policy_number, id_inscompany, date_start, date_final)
values ('0009', '4328674980', '03', '2012-05-10', '2018-07-05');

insert into susana_camacho.record_insurances
(id_car, policy_number, id_inscompany, date_start, date_final)
values ('0010', '8936558390', '01', '2020-12-15', '2022-01-07');

insert into susana_camacho.record_insurances
(id_car, policy_number, id_inscompany, date_start, date_final)
values ('0011', '6789970701', '02', '2013-06-10', '2019-05-01');


--- 8.Tabla car_test
insert into susana_camacho.car_test
(id_car, test_date, kms_test, test_price, type_currency)
values ('0001', '2019-01-29', 125689, 95, '01');

insert into susana_camacho.car_test
(id_car, test_date, kms_test, test_price, type_currency)
values ('0002', '2018-07-10', 094857, 75, '01');

insert into susana_camacho.car_test
(id_car, test_date, kms_test, test_price, type_currency)
values ('0003', '2020-08-16', 198036, 100, '03');

insert into susana_camacho.car_test
(id_car, test_date, kms_test, test_price, type_currency)
values ('0004', '2021-04-04', 205789, 80, '01');

insert into susana_camacho.car_test
(id_car, test_date, kms_test, test_price, type_currency)
values ('0005', '2021-10-13', 099687, 90, '01');

insert into susana_camacho.car_test
(id_car, test_date, kms_test, test_price, type_currency)
values ('0006', '2017-05-18', 103987, 105, '01');

insert into susana_camacho.car_test
(id_car, test_date, kms_test, test_price, type_currency)
values ('0007', '2022-03-19', 189003, 120, '03');

insert into susana_camacho.car_test
(id_car, test_date, kms_test, test_price, type_currency)
values ('0008', '2019-01-29', 125689, 70, '01');

insert into susana_camacho.car_test
(id_car, test_date, kms_test, test_price, type_currency)
values ('0009', '2020-10-10', 081249, 85, '02');

insert into susana_camacho.car_test
(id_car, test_date, kms_test, test_price, type_currency)
values ('0010', '2018-07-20', 117252, 105, '01');

insert into susana_camacho.car_test
(id_car, test_date, kms_test, test_price, type_currency)
values ('0011', '2021-09-24', 075098, 65, '01');

