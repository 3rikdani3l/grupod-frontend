use cobis

exec cobis..sp_grupod_cliente @i_operacion = 'I', @i_cedula='0705833010', @i_nombre='Daniel', @i_apellido='Ordoñez', @i_telefono='0959999826', @i_direccion='Pasaje'

exec cobis..sp_grupod_cliente @i_operacion = 'E', @i_cedula='0705833028'

exec cobis..sp_grupod_cliente @i_operacion = 'S'

select * from grupod_cliente
select * from grupod_producto


update grupod_cliente 
	set 
		cl_estado 	      = 'V'
	where 
		cl_cedula         = '0705833028'

