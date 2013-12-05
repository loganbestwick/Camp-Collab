var Event = {
  init: function(){
    $('form#new_item').on('ajax:success', this.handleSuccess)
    $('form#new_guest').on('ajax:success', function(){console.log("successs")})

    $('div#item-list').on('ajax:success', 'a.dlt-item', this.handleSuccess)
    $('div#item-list').on('ajax:success', 'a.add_importance', this.handleSuccess)
    $('div#item-list').on('ajax:success', 'a.btn.btn-mini', this.handleSuccess)
    $('div#item-list').on('ajax:success', 'a.unclaim', this.handleSuccess)
  },

  handleSuccess: function(e, response) {
    $('div#item-list').html(response)
  },

   handleError: function(e, response) {
  }
}

$(document).ready(function(){
  Event.init()

})
