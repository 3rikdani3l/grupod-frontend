/*
Consultas
select * from grupod_producto


*/


use cobis
go

IF OBJECT_ID ('dbo.sp_grupod_producto') IS NOT NULL
	DROP PROCEDURE dbo.sp_grupod_producto
GO

create procedure sp_grupod_producto
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
   @i_codigo				varchar(5)  = null,
   @i_nombre				varchar(50) = null,
   @i_precio				money       = null,
   @o_codigo				int			= null out
 
as
declare
   @w_codigo_pro	int,
   @w_error       	int,
   @w_return       	int,
   @w_sp_name		varchar(30)
   
select @w_sp_name = 'sp_grupod_producto'


-------------------------Insertar producto ---------------------------
if @i_operacion = 'I'
begin
	if @i_codigo is null
    begin
      select @w_error =  1720830 
      goto ERROR_FIN
	end
	
	if @i_nombre is null
    begin
      select @w_error =  1720831 
      goto ERROR_FIN
	end
	
	if @i_precio is null
    begin
      select @w_error =  1720832 
      goto ERROR_FIN
	end
	
	select @w_codigo_pro = max(pr_id)
	from grupod_producto
	
	if @w_codigo_pro is null  
		select @w_codigo_pro = 0
		
	select @w_codigo_pro = @w_codigo_pro + 1
	
	if exists(select pr_codigo from grupod_producto where pr_codigo=@i_codigo)
	begin
		select @w_error = 1720829
		goto ERROR_FIN
	end
	
	insert into grupod_producto
		(pr_id, 	      pr_codigo,     pr_nombre, 	    pr_precio,       pr_estado,   pr_fecha_crea)
	values
		(@w_codigo_pro,   @i_codigo,     @i_nombre,         @i_precio,       'V',         getdate())
		 
	select @o_codigo = @w_codigo_pro
end
-----------------------------------------------------------------------------



--------------------------- Actualizar producto --------------------------- 
if @i_operacion = 'U'
begin
	if @i_codigo is null
    begin
      select @w_error =  1720830 
      goto ERROR_FIN
	end
	
	if @i_nombre is null
    begin
      select @w_error =  1720831 
      goto ERROR_FIN
	end
	
	if @i_precio is null
    begin
      select @w_error =  1720832 
      goto ERROR_FIN
	end
	
	update grupod_producto 
	set 
		pr_nombre         = @i_nombre,
		pr_precio		  = @i_precio,
		pr_fecha_crea     = getdate()
	where 
		pr_codigo         = @i_codigo	
end
------------------------------------------------------------------------------------------



-------------------Borrar Registro--------------------------------------------------------
if @i_operacion = 'E'
begin 
	if @i_codigo is null
    begin
      select @w_error =  1720830 
      goto ERROR_FIN
	end
	
	update grupod_producto 
	set 
		pr_estado 	      = 'E'
	where 
		pr_codigo         = @i_codigo
end
----------------------------------------------------------------------------------------------------


---------------------------Buscar------------------------------------------------------------
if @i_operacion = 'Q'
begin

	if @i_codigo is null
    begin
      select @w_error =  1720806 
      goto ERROR_FIN
	end
	
	if not exists (select 1 from grupod_producto where pr_codigo = @i_codigo)
	begin
      select @w_error = 1720818 
      goto ERROR_FIN
	end
	
	select 
		'q_id'				=pr_id,
		'codigo'			=pr_codigo,
		'nombre'			=pr_nombre,
		'precio'			=pr_precio,
		'estado' 			=pr_estado,
		'fechaCreacion'		=convert(varchar(10),pr_fecha_crea,111)
	from grupod_producto where pr_codigo = @i_codigo
	
end
----------------------------------------------------------------------------------------------------



---------------------------Listar------------------------------------------------------------
if @i_operacion = 'S'
begin
		
	select 
		's_id'				=pr_id,
		'codigo'			=pr_codigo,
		'nombre'			=pr_nombre,
		'precio'			=pr_precio,
		'estado' 			=pr_estado,
		'fechaCreacion'		=convert(varchar(10),pr_fecha_crea,111)
	from grupod_producto where pr_estado = 'V' 
	
end
----------------------------------------------------------------------------------------------------


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

