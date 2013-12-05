$(document).on('click', '#prevtab', function() {
    var currentTab = $("#event_form_tabs").find(".active")
    currentTab.removeClass('active')
    currentTab.prev('div').addClass('active')
});

$(document).on('click', '#nexttab', function() {
    var currentTab = $("#event_form_tabs").find(".active")
    currentTab.removeClass('active')
    currentTab.next('div').addClass('active')
});

$('.timepicker').pickatime()