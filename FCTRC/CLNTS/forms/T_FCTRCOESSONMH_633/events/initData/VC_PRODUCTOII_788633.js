
     
//Evento initData : Inicialización de datos del formulario, después de este evento se realiza el seguimiento de cambios en los datos
//ViewContainer: FormProducto
task.initData.VC_PRODUCTOII_788633 = function (entities, initDataEventArgs){

    console.log(entities)
    if(entities.Producto.codigo =='' || entities.Producto.codigo == null){
        entities.Producto.operacion = 'I'
        
    }else{
        entities.Producto.operacion = 'U'
        initDataEventArgs.commons.api.viewState.disable('VA_CODIGODGYZTMTQX_515883');
    }
    initDataEventArgs.commons.execServer = false;

};