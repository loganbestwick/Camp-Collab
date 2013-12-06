var Event = {
  init: function(){
    $('form#new_item').on('ajax:success', this.handleItem)
    $('div#item-list').on('ajax:success', 'a.dlt-item', this.handleItem)
    $('div#item-list').on('ajax:success', 'a.add_importance', this.handleItem)
    $('div#item-list').on('ajax:success', 'a.btn.btn-mini', this.handleItem)
    $('div#item-list').on('ajax:success', 'a.unclaim', this.handleItem)
    $('form#new_guest').on('ajax:success', this.handleGuest)
    $('#essential_button').on('ajax:success', this.handleItem)
  },

  handleItem: function(e, response) {
    $('.bar').css('width', response.completion+'%')
    $('#progress_message').html('Camping trip is <strong>' +response.completion+'%</strong> covered')
    $('div#item-list').html(response.template)
    $('#item_name').val('')
    // $('#essential_button').addClass('btn-success')
  },

  handleGuest: function(e, response){
    $('#guest_name').val('')
    $('#guest_email').val('')
    $('div#guest-list').html(response)

  },

   handleError: function(e, response) {
  },
}

$(document).ready(function(){
  Event.init()

  $('#guestslist').hide()
})
