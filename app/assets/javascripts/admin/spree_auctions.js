//= require admin/spree_backend


$(document).on('click', '.move_up', function() {
    nav_id = $(this).attr('id')
    $.ajax({
        type: 'GET',
        url: 'sort_nav_up?id='+nav_id +'.json',
        contentType: 'application/json',
        dataType: 'html',
        success: function(){
            window.location.reload()
        },
        error: function(e){
            alert("error");
        }

    });

});

$(document).on('click', '.move_down', function() {
    nav_id = $(this).attr('id')
    $.ajax({
        type: 'GET',
        url: 'sort_nav_down?id='+nav_id +'.json',
        contentType: 'application/json',
        dataType: 'html',
        success: function(){
            window.location.reload()
        },
        error: function(e){
            alert("error");
        }

    });

});


