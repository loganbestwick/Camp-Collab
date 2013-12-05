class ItemsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @item = Item.new(name: params[:item][:name], price: params[:item][:price], event_id: params[:event_id])
    if @item.save
      @items = Host.find(session[:host_id]).events.find(params[:event_id]).items
      @claimed = @event.items.where("guest_id IS NOT NULL or host_id IS NOT NULL")
      @completion = completion(@claimed, @event.items)
      render_items_partial
     else
      redirect_to host_event_path(session[:host_id], @event)
    end
  end

  def update
    @item = Item.find(params[:id])
    @event = Event.find(params[:event_id])
    @item.update_attributes(params[:item])
    @claimed = @event.items.where("guest_id IS NOT NULL or host_id IS NOT NULL")
    @completion = completion(@claimed, @event.items)
    render_items_partial
  end

  def destroy
    Item.find(params[:id]).destroy
    @event = Event.find(params[:event_id])
    @items = @event.items
    render_items_partial
  end

  def important
    @event = Event.find(params[:event_id])
    @items = Item.all
    @item = Item.find(params[:id])
    @item.toggle(:important)
    @item.save
    render_items_partial

  end

  def completion(claimed, total)
    if total != [] || claimed != []
      return ((claimed.size.to_f/total.size.to_f) * 100).to_i
    else
      return 0
    end
  end

end


