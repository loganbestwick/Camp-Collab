class ItemsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @item = Item.new(name: params[:item][:name], price: params[:item][:price], event_id: params[:event_id])
    if @item.save
      @items = Item.all
      render json: {item_add: render_to_string(partial: 'items', :locals => {:items => @items})}
    else
      redirect_to host_event_path(session[:host_id], @event)
    end
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

  def important
    @item = Item.find(params[:id])
    @item.toggle(:important)
    @item.save
    redirect_to host_event_path(session[:host_id], Event.find(params[:event_id]))
  end

end
