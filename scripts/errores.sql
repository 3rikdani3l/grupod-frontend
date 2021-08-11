--select * from cl_errores where numero between 1720000 and 1730000 order by numero desc

/******************** Error cedula repetida ********************/

if exists(select 1 from cl_errores where mensaje = 'ERROR: La cedula ya existe - Grupo D')
begin
	delete from cl_errores where mensaje = 'ERROR: La cedula ya existe - Grupo D'
end

insert into dbo.cl_errores (numero, severidad, mensaje)
values (1720823, 1, 'ERROR: La cedula ya existe - Grupo D')

/******************** Error nombre vacio ********************/

if exists(select 1 from cl_errores where mensaje = 'ERROR: El nombre no puede ser vacio - Grupo D')
begin
	delete from cl_errores where mensaje = 'ERROR: El nombre no puede ser vacio - Grupo D'
end

insert into dbo.cl_errores (numero, severidad, mensaje)
values (1720824, 1, 'ERROR: El nombre no puede ser vacio - Grupo D')

/******************** Error apellido vacio ********************/

if exists(select 1 from cl_errores where mensaje = 'ERROR: El apellido no puede ser vacio - Grupo D')
begin
	delete from cl_errores where mensaje = 'ERROR: El apellido no puede ser vacio - Grupo D'
end

insert into dbo.cl_errores (numero, severidad, mensaje)
values (1720825, 1, 'ERROR: El apellido no puede ser vacio - Grupo D')

/******************** Error telefono vacio ********************/

if exists(select 1 from cl_errores where mensaje = 'ERROR: El telefono no puede ser vacio - Grupo D')
begin
	delete from cl_errores where mensaje = 'ERROR: El telefono no puede ser vacio - Grupo D'
end

insert into dbo.cl_errores (numero, severidad, mensaje)
values (1720826, 1, 'ERROR: El telefono no puede ser vacio - Grupo D')

/******************** Error direccion vacio ********************/

if exists(select 1 from cl_errores where mensaje = 'ERROR: La direccion no puede ser vacio - Grupo D')
begin
	delete from cl_errores where mensaje = 'ERROR: La direccion no puede ser vacio - Grupo D'
end

insert into dbo.cl_errores (numero, severidad, mensaje)
values (1720827, 1, 'ERROR: La direccion no puede ser vacio - Grupo D')

