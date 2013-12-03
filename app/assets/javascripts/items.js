var Event = {
  init: function(){
    $('form#new_item').on('ajax:success', this.handleSuccess)
    $('.add_item').on('click', function(){$('div#add_item').toggleClass()})
    // $('div#item-list').on('ajax:success', 'a.dlt-item', this.handleSuccess)
    $('table.table.table-striped.test').on('ajax:success', 'td a.dlt-item', this.handleSuccess)
    $('div#item-list').on('ajax:error', 'a.dlt-item', this.handleError)
    // $('div#item-list').on('ajax:error', 'a.dlt-item', function() {console.log("error")})
  },

  handleSuccess: function(e, response) {
    debugger
    $('div#item-list').html(response)
  },

   handleError: function(e, response) {
    debugger
  }
}

$(document).ready(function(){

  Event.init();
})

// $('td #important').change(function(){console.log("changed!")})
$('td #important').change(function(){
  $.ajax({
    url: '/events/'
  })
})




  // $('#checkbox_id').change(function(){
  //       $.get('controller/action?inst_id='+$(this).val(), function(data,status){
  //           if(status == 'success'){
  //             alert(data)
  //            }
  //       })