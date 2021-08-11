---------consulta menu
-- select * from cew_menu where me_name = 'MNU_CMAM_TESTSub';

---------consulta permisos
-- select * from cew_menu_role where mro_id_menu = 7989;

DECLARE @v_id_menu 		INT,
		@v_id_producto 	INT,
		@v_rol			int,
		@v_url			varchar(300),
		@v_id_padre		varchar(50),
		@v_description	Varchar(255),
		@v_name_menu 	Varchar(100)

----------------------URL del Formulario----------------------
select @v_url = 'views/FCTRC/FCTRS/T_FCTRCBLSVQVRX_373/1.0.0/VC_LISTCLIETE_548373_TASK.html'
select * from cew_menu where me_url = @v_url
---------------------------------------------------------------

----------------------Nombre del menu principal-----------------------	
select @v_id_padre = me_id from cew_menu where me_name = 'MNU_CMAM_TEST'
----------------------------------------------------------------------

-------------MENU--------------
-----------Nombre-----------		
select @v_name_menu = 'MNU_CMAM_TESTSub'
----------Descripcion----------
select @v_description = 'menu test' 
--------------------------------


---------------Producto-----------------
SELECT @v_id_producto =pd_producto 
	FROM cl_producto
	where pd_descripcion = 'CLIENTES'	
-----------------------------------------

-------------Permisos de menu----------------
--  select * from ad_rol
select @v_rol=ro_rol from ad_rol
	where ro_descripcion = 'SEMILLERO'
-------------------------------------------

--------------conseguir el id del menu-------------------
SELECT @v_id_menu = max(me_id) FROM cew_menu
SELECT @v_id_menu =@v_id_menu +1

	
------------------Validacion Permisos------------------	

if exists(select 1 from cew_menu_role 
			where 
			mro_id_role = @v_rol 
			and 
			mro_id_menu = (select me_id from cew_menu where me_url = @v_url) 
			)
begin
	delete from cew_menu_role 
		where 
		mro_id_role = @v_rol 
		and 
		mro_id_menu = (select me_id from cew_menu where me_url = @v_url)

end

------------------Validacion menu ------------------
if exists(select 1 from cew_menu 
			where me_url = @v_url)
begin
	delete from cew_menu
		where me_url = @v_url

end
-------------------------------------------------


-------------Agrega menu y permisos-----------
insert into dbo.cew_menu (
	me_id,	me_id_parent,	me_name,	me_visible,
	me_url,	
	me_order,	me_id_cobis_product, 
	me_option, 	me_description,	 me_version,	me_container)
values (
	@v_id_menu,	 @v_id_padre,		@v_name_menu, 	   		1,
	@v_url,
		1, 			@v_id_producto,
	 	0, 		@v_description, 		NULL, 				'CWC')		

insert into cew_menu_role 
		(mro_id_menu, 	mro_id_role)
values 	(@v_id_menu,		@v_rol)
-----------------------------------------






