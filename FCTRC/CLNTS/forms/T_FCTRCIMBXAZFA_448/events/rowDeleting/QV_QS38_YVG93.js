
//gridRowDeleting QueryView: QV_QS38_YVG93
//Se ejecuta antes de que los datos eliminados en una grilla sean comprometidos.
task.gridRowDeleting.QV_QS38_YVG93 = function (entities,gridRowDeletingEventArgs) {
    
    entities.Producto.operacion = 'E'
     gridRowDeletingEventArgs.commons.execServer = true;
     //gridRowDeletingEventArgs.commons.serverParameters.Producto = true;

};




