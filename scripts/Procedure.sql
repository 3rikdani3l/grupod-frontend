/*

-----------------Consulta de Procedure-------------------
select * from ad_procedure WHERE pd_stored_procedure = 'sp_sem_cliente'
select * from ad_procedure WHERE pd_archivo = 'sp_prueba_error.sp'
select * from ad_procedure where pd_procedure = 172117

select * from ad_procedure where pd_procedure between 172000  and 173000
select * from ad_procedure where pd_base_datos = 'cobis'

---------------Consulta transacciones-----------------------------
select * from ad_pro_transaccion where pt_producto =172
select * from ad_pro_transaccion where pt_procedure = 172475


---------------Consulta de permisos---------------------------
select * from ad_tr_autorizada where ta_transaccion =70707257


----------------------Consulta basica----------------------
select * from ad_procedure WHERE pd_stored_procedure = 'sp_grupod_cliente'
select * from ad_pro_transaccion where pt_procedure = 172540
select * from ad_tr_autorizada where ta_transaccion =70707285

----------------------Consulta basica----------------------
select * from ad_procedure WHERE pd_stored_procedure = 'sp_grupod_producto'
select * from ad_pro_transaccion where pt_procedure = 172540
select * from ad_tr_autorizada where ta_transaccion =70707286

----172472
*/

use cobis

declare 
	@v_id_producto 	int,
	@v_id_p_min		int,
	@v_id_p_max		int,
	@v_id_p_new		int,
	@v_max_trans	int,
	@v_id_rol 		int,
	@v_name_ps		varchar(40),
	@v_name_ps_f	varchar(14),
	@v_produc_abre	varchar(5),
	@v_name_db		varchar(30)
	
-------------Nombre------------------------
select @v_name_ps ='sp_grupod_producto' 
-------------------------------------------

-------------Nombre del archivo-------------
select @v_name_ps_f ='gd_producto.sp'
-------------------------------------------

-------------Abreviatura del producto-------
-- select * from cl_producto
select @v_produc_abre = 'CLI' 
-------------------------------------------

-------------Nombre de la base de datos----
select @v_name_db = 'cobis'
-------------------------------------------

--------------------------ROL----------------------------------------------------
---- select * from ad_rol
select @v_id_rol = ro_rol from ad_rol where ro_descripcion = 'SEMILLERO'
------------------------------------------------------------------------------


-------------------------id del producto---------------------------------------------------
select @v_id_producto = pd_producto from cl_producto where pd_abreviatura = @v_produc_abre 
-----------------------------------------------------------------------------------------------------

-------------------------rango de productos procedure -------------------------
select @v_id_p_min = @v_id_producto * 1000
select @v_id_p_max =(@v_id_producto+1)* 1000
print @v_id_p_min 
print @v_id_p_max
---------------------------------------------------------------------------

-------------------------NEW id del procedure --------------------------------------------------------------------
select @v_id_p_new =max(pd_procedure) from ad_procedure where pd_procedure between @v_id_p_min and @v_id_p_max
select @v_id_p_new = @v_id_p_new +1
print @v_id_p_new
---------------------------------------------------------------------------------------------------------------------

------------------------- N max transaciones ---------------------------------------------------
select @v_max_trans =max(pt_transaccion) from ad_pro_transaccion where pt_producto =@v_id_producto
select * from ad_pro_transaccion where pt_producto =@v_id_producto
select @v_max_trans= @v_max_trans+1
print @v_max_trans
----------------------------------------------------------------------------------------------------

---------------------------Agregar el procedure---------------------------------------------------------
INSERT INTO dbo.ad_procedure (
	pd_procedure, 	pd_stored_procedure,  		pd_base_datos, 
	pd_estado, 	   		pd_fecha_ult_mod, 			pd_archivo)
VALUES (
	@v_id_p_new, 			@v_name_ps, 			@v_name_db, 
	'V', 					   getdate(), 			@v_name_ps_f)
----------------------------------------------------------------------------------------------------

----------------------------Agrega la transaccion --------------------------------------------------
INSERT INTO dbo.ad_pro_transaccion (
	pt_producto, 		pt_tipo, 		pt_moneda, 		pt_transaccion, 
	pt_estado, 	pt_fecha_ult_mod, 	pt_procedure, 			pt_especial)
VALUES (
	@v_id_producto, 		'R', 				0, 			@v_max_trans, 
	'V', 				getdate(), 		@v_id_p_new, 					NULL)
----------------------------------------------------------------------------------------------------

---------------------------------------Agrega los permisos------------------------------
INSERT INTO dbo.ad_tr_autorizada (
	ta_producto, 		ta_tipo, 			ta_moneda, 	ta_transaccion, 	
	ta_rol, 		ta_fecha_aut, 		ta_autorizante, 	ta_estado, 		
	ta_fecha_ult_mod)
VALUES (
	@v_id_producto,   	'R', 	  					0, 	   @v_max_trans,
	@v_id_rol, 			getdate(), 		@v_id_producto,				'V', 		
	getdate())
-------------------------------------------------------------------------------------------	



/*

delete from dbo.ad_procedure 
		where pd_procedure = 172433
		
*/

/*

delete from dbo.ad_pro_transaccion 
		where 
		pt_transaccion = 70707234
		and
		pt_procedure = 172433
		
*/




