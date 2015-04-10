function sendNewTask(data){
    //var o = $.param(data,true);
    $.ajax({
        method: "POST",
        url: "/todolists/create",
        data: data
      }).done(function( msg ) {
          alert( "Data Saved: " + msg );
    });
}
$(document).ready(function(){
    $(".button-new").bind("click",function(){
        var t = $(this).parent().parent().find("input[type='text']");
        sendNewTask({id:t.attr("data-id"), data:t.val()});
    });
});
