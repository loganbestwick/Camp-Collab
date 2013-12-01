class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @event = Event.find(params[:event_id])
    @item = Item.create(name: params[:item][:name], price: params[:item][:price], event_id: params[:event_id])

    redirect_to host_event_path(session[:host_id], @event)
  end

  def update
    @item = Item.find(params[:id])
    @event = Event.find(params[:event_id])
    @items = Item.where(event_id: params[:event_id], purchased: false)
    @item.update_attributes(params[:item])

    if @items.length == 0
      @event.update_attributes(completed: true)
    end

    redirect_to host_event_path(session[:host_id], Event.find(params[:event_id]))
  end

  def destroy
  end

end
