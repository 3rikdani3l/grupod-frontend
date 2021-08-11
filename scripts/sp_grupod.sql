use cobis
go

IF OBJECT_ID ('dbo.sp_grupod') IS NOT NULL
	DROP PROCEDURE dbo.sp_grupod
GO

create procedure sp_grupod
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
   @i_direccion				varchar(200)= null
 
as
declare
   @w_codigo_cli	int,
   @w_error       	int,
   @w_return       	int,
   @w_sp_name		varchar(30)
   
select @w_sp_name = 'sp_grupod'

if i_operacion = 'I'
begin

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


GO
