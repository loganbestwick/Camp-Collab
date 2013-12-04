var Event = {
  init: function(){
    $('form#new_item').on('ajax:success', this.handleSuccess)
    $('.add_item').on('click', this.handleSuccess)
    $('div#item-list').on('ajax:success', 'a.dlt-item', this.handleSuccess)
    $('div#item-list').on('ajax:error', 'a.dlt-item', this.handleError)
  },

  handleSuccess: function(e, response) {
    $('div#add_item').toggleClass()
    $('div#item-list').html(response)
  },

   handleError: function(e, response) {
  }
}

$(document).ready(function(){
  Event.init()


})
