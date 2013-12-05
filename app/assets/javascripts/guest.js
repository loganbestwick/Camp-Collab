var Event = {
  init: function(){
    $('form#new_item').on('ajax:success', this.handleItem)
    $('div#item-list').on('ajax:success', 'a.dlt-item', this.handleItem)
    $('div#item-list').on('ajax:success', 'a.add_importance', this.handleItem)
    $('div#item-list').on('ajax:success', 'a.btn.btn-mini', this.handleItem)
    $('div#item-list').on('ajax:success', 'a.unclaim', this.handleItem)
    $('form#new_guest').on('ajax:success', this.handleGuest)
  },

  handleItem: function(e, response) {
    $('div#item-list').html(response)
  },

  handleGuest: function(e, response){
    $('div#guest-list').html(response)
  },

  handleError: function(e, response) {
  },
}

$(document).ready(function(){
  Event.init()

})


  <script type="text/javascript">
  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers(<%=raw @hash.to_json %>);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
    handler.getMap().setZoom(12);
  });

  </script>