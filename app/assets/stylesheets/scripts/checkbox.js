function init_toggle_lists() {
    $(".checklist input:checked").parent().addClass("selected");
    $(".checklist .chk-select").live('click', function() {
        event.preventDefault();
        $(this).parent().addClass("selected");
        $(this).parent().find(":checkbox").attr('checked', true);
    });
    $(".checklist .chk-deselect").live('click', function() {
        event.preventDefault();
        $(this).parent().removeClass("selected");
        $(this).parent().find(":checkbox").attr('checked', false);
    });
    //$(".togglelist input:checked").parent().addClass("selected");
    $(".togglelist .chk-select").live('click', function() {
        event.preventDefault();
        var p = $(this).parent().parent();
        $(".togglelist .chk-select").each(function() {
            if (p.get(0) === $(this).parent().parent().get(0)) {
                $(this).parent().removeClass("selected");
                $(this).parent().find(":checkbox").attr('checked', false);
            }
        });
        $(this).parent().addClass("selected");
        $(this).parent().find(":checkbox").attr('checked', true);
    });
    $(".togglelist .chk-deselect").live('click', function() {
        event.preventDefault();
    });
}
