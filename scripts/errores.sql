/******************** Errores para clientes ********************/
if exists(select 1 from cl_errores where mensaje = 'ERROR: La cedula ya existe - Grupo D')
begin
	delete from cl_errores where mensaje = 'ERROR: La cedula ya existe - Grupo D'
end

if exists(select 1 from cl_errores where mensaje = 'ERROR: La cedula no puede ser vacio - Grupo D')
begin
	delete from cl_errores where mensaje = 'ERROR: La cedula no puede ser vacio - Grupo D'
end

if exists(select 1 from cl_errores where mensaje = 'ERROR: El nombre no puede ser vacio - Grupo D')
begin
	delete from cl_errores where mensaje = 'ERROR: El nombre no puede ser vacio - Grupo D'
end

if exists(select 1 from cl_errores where mensaje = 'ERROR: El apellido no puede ser vacio - Grupo D')
begin
	delete from cl_errores where mensaje = 'ERROR: El apellido no puede ser vacio - Grupo D'
end

if exists(select 1 from cl_errores where mensaje = 'ERROR: El telefono no puede ser vacio - Grupo D')
begin
	delete from cl_errores where mensaje = 'ERROR: El telefono no puede ser vacio - Grupo D'
end

if exists(select 1 from cl_errores where mensaje = 'ERROR: La direccion no puede ser vacio - Grupo D')
begin
	delete from cl_errores where mensaje = 'ERROR: La direccion no puede ser vacio - Grupo D'
end

/******************** Error cedula repetida ********************/
insert into dbo.cl_errores (numero, severidad, mensaje)
values (1720823, 1, 'ERROR: La cedula ya existe - Grupo D')

/******************** Error cedula vacia ********************/
insert into dbo.cl_errores (numero, severidad, mensaje)
values (1720824, 1, 'ERROR: La cedula no puede ser vacio - Grupo D')

/******************** Error nombre vacio ********************/
insert into dbo.cl_errores (numero, severidad, mensaje)
values (1720825, 1, 'ERROR: El nombre no puede ser vacio - Grupo D')

/******************** Error apellido vacio ********************/
insert into dbo.cl_errores (numero, severidad, mensaje)
values (1720826, 1, 'ERROR: El apellido no puede ser vacio - Grupo D')

/******************** Error telefono vacio ********************/
insert into dbo.cl_errores (numero, severidad, mensaje)
values (1720827, 1, 'ERROR: El telefono no puede ser vacio - Grupo D')

/******************** Error direccion vacio ********************/
insert into dbo.cl_errores (numero, severidad, mensaje)
values (1720828, 1, 'ERROR: La direccion no puede ser vacio - Grupo D')


/******************** Errores para productos ********************/
if exists(select 1 from cl_errores where mensaje = 'ERROR: El codigo ya existe - Grupo D')
begin
	delete from cl_errores where mensaje = 'ERROR: El codigo ya existe - Grupo D'
end

if exists(select 1 from cl_errores where mensaje = 'ERROR: El codigo no puede ser vacio - Grupo D')
begin
	delete from cl_errores where mensaje = 'ERROR: El codigo no puede ser vacio - Grupo D'
end

if exists(select 1 from cl_errores where mensaje = 'ERROR: El nombre no puede ser vacio - Grupo D')
begin
	delete from cl_errores where mensaje = 'ERROR: El nombre no puede ser vacio - Grupo D'
end

if exists(select 1 from cl_errores where mensaje = 'ERROR: El precio no puede ser vacio - Grupo D')
begin
	delete from cl_errores where mensaje = 'ERROR: El precio no puede ser vacio - Grupo D'
end

/******************** Error codigo repetido ********************/
insert into dbo.cl_errores (numero, severidad, mensaje)
values (1720829, 1, 'ERROR: El codigo ya existe - Grupo D')

/******************** Error codigo vacio ********************/
insert into dbo.cl_errores (numero, severidad, mensaje)
values (1720830, 1, 'ERROR: El codigo no puede ser vacio - Grupo D')

/******************** Error precio vacio ********************/
insert into dbo.cl_errores (numero, severidad, mensaje)
values (1720831, 1, 'ERROR: El precio no puede ser vacio - Grupo D')

select * from cl_errores where numero between 1720000 and 1730000 order by numero desc
