
//Start signature to Callback event to VA_VABUTTONAUHIJSF_103883
task.executeCommandCallback.VA_VABUTTONAUHIJSF_103883 = function(entities, executeCommandCallbackEventArgs) {
    let nav = executeCommandCallbackEventArgs.commons.api.navigation; 
    nav.closeModal({});
};
