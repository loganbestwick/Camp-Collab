class ApplicationController < ActionController::Base
  protect_from_forgery

  def render_items_partial
    render json: {:template => render_to_string(partial: 'items', :locals => {:items => @items, :event => @event}), :completion => @completion}
  end
  def render_guests_partial
   render json: render_to_string(partial: 'guests', :locals => {:event => @event}).to_json
  end

  def progress_bar_claimed
    @claimed = @event.items.where("guest_id IS NOT NULL or host_id IS NOT NULL")
    @completion = completion(@claimed, @event.items)
  end
end
