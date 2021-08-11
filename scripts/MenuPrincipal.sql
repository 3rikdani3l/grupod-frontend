use cobis
---------consulta menu
--select * from cew_menu where me_name = 'MNU_CMAM_TEST';

---------consulta permisos
--select * from cew_menu_role where mro_id_menu = 7987;

---------consulta sub menus
--select * from cew_menu where me_id_parent = 7987;
go

declare @v_id_menu 		int,
		@v_id_producto 	int,
		@v_rol 			int,
		@v_description	Varchar(255),
		@v_name_menu 	Varchar(100)
		
-------------MENU--------------
-----------Nombre-----------		
select @v_name_menu = 'MNU_GRUPOD'
----------Descripcion----------
select @v_description = 'menu grupo d' 
--------------------------------

---------- Rol del menu--------
select @v_rol=ro_rol from ad_rol
	where ro_descripcion = 'SEMILLERO'
-----------------------------------

-----------Producto------------------
SELECT @v_id_producto =pd_producto 
	FROM cl_producto
	where pd_descripcion = 'CLIENTES'
--------------------------------------

------------Si existe borra el Menu y Menu rol (permisos del menu para verlo)--------
if exists(select 1 from cew_menu 
			where me_name = @v_name_menu)
begin
	select @v_id_menu = me_id from cew_menu where me_name = @v_name_menu
	
	delete from cew_menu_role
		where mro_id_menu = @v_id_menu and mro_id_role = @v_rol
	
	-------para poder borrar debe borrar todo los submenus vinculados
	delete from cew_menu
		where me_name = @v_name_menu

end
----------------------------------------------------------------------

----------------- Agrega menu-----------------------------

SELECT @v_id_menu = max(me_id) FROM cew_menu

SELECT @v_id_menu =@v_id_menu +1


	

INSERT INTO dbo.cew_menu 
(
	me_id, 		me_id_parent,  					me_name, 	me_visible, 
	me_url, 		me_order, 		me_id_cobis_product,  	me_option, 
	me_description, me_version, 	me_container
)
VALUES 
(
	@v_id_menu, 		NULL, 		@v_name_menu,				 1, 
	NULL, 					1, 			@v_id_producto, 			0, 
	@v_description, 		NULL, 				'CWC')

--------------------------------------------

---------------------- Agrega permisos del menu por rol------------------	
insert into cew_menu_role 
		(mro_id_menu, 	mro_id_role)
values 	(@v_id_menu,		@v_rol)
-------------------------------------------------------------------------

select * from cew_menu where me_name = @v_name_menu;
select * from cew_menu_role where mro_id_menu = @v_id_menu;





