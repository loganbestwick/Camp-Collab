
var Event = {
  init: function(){
    $('form#new_item').on('ajax:success', this.ajaxitem)
    $('form#new_menu').on('ajax:error', function(){
      console.log("errors")
    })
  },

  ajaxitem: function(e, response) {
    $('div.item-list').html(response.item_add)
  }
}

$(document).ready(function(){

  Event.init();

})