
    
//Evento onCloseModalEvent : Evento que actua como listener cuando se cierra ventanas modales.
//ViewContainer: FormProductos
task.onCloseModalEvent = function (entities, onCloseModalEventArgs){
    
    
    if(onCloseModalEventArgs.closedViewContainerID!=''){
        onCloseModalEventArgs.commons.api.grid.refresh('QV_QS38_YVG93');
    }
    console.log(onCloseModalEventArgs);
    
    onCloseModalEventArgs.commons.execServer = false;

};