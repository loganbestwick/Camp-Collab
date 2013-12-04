var Event = {
  init: function(){
    $('form#new_item').on('ajax:success', this.handleSuccess)
    $('div#item-list').on('ajax:success', 'a.dlt-item', this.handleSuccess)

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
