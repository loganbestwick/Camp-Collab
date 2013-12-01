class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

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

  end

  def destroy
  end
end
