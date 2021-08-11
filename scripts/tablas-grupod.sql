use cobis

/****************** Tabla clientes ****************/
if OBJECT_ID('grupod_cliente') is not null
begin
	drop table grupod_cliente
	print 'entra borrando tabla cliente'
end

create table grupod_cliente(
	cl_id     				int 			not null,
	cl_cedula 				varchar(13) 	not null,
	cl_nombre				varchar(50)     not null,
	cl_apellido 		    varchar(50) 	null,
	cl_estado		        char(1) 	    not null,
	cl_fecha_crea			date			not null
)

if OBJECT_ID('grupod_producto') is not null
begin
	drop table grupod_producto
	print 'entra borrando tabla producto'
end

create table grupod_producto(
	pr_id    				int 			not null,
	pr_codigo 				varchar(5) 	    not null,
	pr_nombre				varchar(50)     not null,
	pr_precio    		    money        	null,
	pr_estado		        char(1) 	    not null,
	pr_fecha_crea			date			not null
)

if OBJECT_ID('grupod_factura') is not null
begin
	drop table grupod_factura
	print 'entra borrando tabla factura'
end

create table grupod_factura(
	fa_id    				int 			not null,
	fa_cedula_cli			int     	    not null,
	fa_total    		    money        	null,
	fa_estado		        char(1) 	    not null,
	fa_fecha_crea			date			not null
)

if OBJECT_ID('grupod_detalle_factura') is not null
begin
	drop table grupod_detalle_factura
	print 'entra borrando tabla detalle factura'
end

create table grupod_detalle_factura(
	fd_id_factura    		int 			not null,
	fd_codigo_pro  			int     	    not null,
	fd_cantidad             int				not null
)

go

//select * from grupod_cliente
//select * from grupod_producto
//select * from grupod_factura
//select * from grupod_detalle_factura
