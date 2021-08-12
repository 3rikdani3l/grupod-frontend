use cobis
go

IF OBJECT_ID ('dbo.sp_grupod_cliente') IS NOT NULL
	DROP PROCEDURE dbo.sp_grupod_cliente
GO

create procedure sp_grupod_cliente
   @s_srv                   varchar(30) = null,
   @s_ssn                   int         = null,
   @s_date                  datetime    = null,
   @s_ofi                   smallint    = null,
   @s_user                  varchar(30) = null,
   @s_rol		            smallint    = null,
   @s_term		            varchar(10) = null,
   @t_file		            varchar(14) = null,
   @t_trn		   	        int			= null,
   @t_debug              	char(1)     = 'N',
   @t_from               	varchar(32) = null,
   @i_operacion	   	        char(1),
   @i_cedula				varchar(10) = null,
   @i_nombre				varchar(50) = null,
   @i_apellido				varchar(50) = null,
   @i_telefono				varchar(10) = null,
   @i_direccion				varchar(200)= null,
   @o_codigo				int			= null out
 
as
declare
   @w_codigo_cli	int,
   @w_error       	int,
   @w_return       	int,
   @w_sp_name		varchar(30)
   
select @w_sp_name = 'sp_grupod_cliente'
-- Insertar cliente --
if @i_operacion = 'I'
begin
	if @i_cedula is null
    begin
      select @w_error =  1720824 
      goto ERROR_FIN
	end
	
	if @i_nombre is null
    begin
      select @w_error =  1720825 
      goto ERROR_FIN
	end
	
	if @i_apellido is null
    begin
      select @w_error =  1720826 
      goto ERROR_FIN
	end
	
	if @i_telefono is null
    begin
      select @w_error =  1720827 
      goto ERROR_FIN
	end
	
	if @i_direccion is null
    begin
      select @w_error =  1720828
      goto ERROR_FIN
	end
	
	select @w_codigo_cli = max(cl_id)
	from grupod_cliente
	
	if @w_codigo_cli is null  
		select @w_codigo_cli = 0
		
	select @w_codigo_cli = @w_codigo_cli + 1
	
	if exists(select cl_cedula from grupod_cliente where cl_cedula=@i_cedula)
	begin
		select @w_error = 1720793
		goto ERROR_FIN
	end
	
	insert into grupod_cliente
		(cl_id, 	      cl_cedula,     cl_nombre, 	    cl_apellido,
		 cl_estado,       cl_telefono,   cl_direccion, 		cl_fecha_crea)
	values
		(@w_codigo_cli,   @i_cedula,     @i_nombre,         @i_apellido,    
		 'V',             @i_telefono,   @i_direccion,      getdate())
		 
	select @o_codigo = @w_codigo_cli
end
-- Actualizar cliente -- 
if @i_operacion = 'U'
begin
	if @i_cedula is null
    begin
      select @w_error =  1720824 
      goto ERROR_FIN
	end
	
	if @i_nombre is null
    begin
      select @w_error =  1720825 
      goto ERROR_FIN
	end
	
	if @i_apellido is null
    begin
      select @w_error =  1720826 
      goto ERROR_FIN
	end
	
	if @i_telefono is null
    begin
      select @w_error =  1720827 
      goto ERROR_FIN
	end
	
	if @i_direccion is null
    begin
      select @w_error =  1720828
      goto ERROR_FIN
	end
	
	update grupod_cliente 
	set 
		cl_nombre 	      = @i_nombre, 
		cl_apellido       = @i_apellido,
		cl_telefono		  = @i_telefono,
		cl_direccion	  = @i_direccion,
		cl_fecha_crea     = getdate()
	where 
		cl_cedula         = @i_cedula	
end

if @i_operacion = 'S'
begin 
	select
		'nombre'          = cl_nombre,
		'apellido'        = cl_apellido,
		'telefono'        = cl_telefono,
		'direccion'       = cl_direccion 
	from
		grupod_cliente
	where 
		cl_estado         = 'V'
end

if @i_operacion = 'E'
begin 
	if @i_cedula is null
    begin
      select @w_error =  1720824 
      goto ERROR_FIN
	end
	
	update grupod_cliente 
	set 
		cl_estado 	      = 'E'
	where 
		cl_cedula         = @i_cedula	
end
return 0

ERROR_FIN:
begin
   exec cobis..sp_cerror
   @t_debug  = @t_debug,
   @t_file   = @t_file,
   @t_from   = @w_sp_name,				
   @i_num    = @w_error 
end
return @w_error

go

select * from grupod_cliente order by cl_id desc
