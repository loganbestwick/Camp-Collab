class ApplicationController < ActionController::Base
  protect_from_forgery

  def render_items_partial
    render json: render_to_string(partial: 'items', :locals => {:items => @items, :event => @event}).to_json
  end
  def render_guests_partial
    render json: render_to_string(partial: 'guest', :locals => {:event => @event}).to_json
  end
end
