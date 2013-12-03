class ItemsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @item = Item.new(name: params[:item][:name], price: params[:item][:price], event_id: params[:event_id])
    if @item.save
      @items = Host.find(session[:host_id]).events.find(params[:event_id]).items
      render json: render_to_string(partial: 'items', :locals => {:items => @items, :event => @event}).to_json
     else
      redirect_to host_event_path(session[:host_id], @event)
    end
  end

  def update
    @item = Item.find(params[:id])
    @event = Event.find(params[:event_id])
    @items = Item.where(event_id: params[:event_id], purchased: false)
    @item.update_attributes(params[:item])
    redirect_to host_event_path(session[:host_id], Event.find(params[:event_id]))
  end

  def destroy
    p '*'*1000
    Item.find(params[:id]).destroy
    # Host.find(session[:host_id]).events.find(params[:event_id]).items.find(params[:id]).destroy
    @event = Event.find(params[:event_id])
    @items = @event.items
    # render text: "it fucking worked"
    render json: render_to_string(partial: 'items', :locals => {:items => @items, :event => @event}).to_json
  end

  def important
    @event = Event.find(params[:event_id])
    @item = Item.find(params[:id])
    @item.toggle(:important)
    @item.save
    redirect_to host_event_path(session[:host_id], @event)
  end


end


