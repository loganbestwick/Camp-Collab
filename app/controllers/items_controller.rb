class ItemsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @item = Item.new(name: params[:item][:name], price: params[:item][:price], event_id: params[:event_id])
    if @item.save
      @items = Host.find(session[:host_id]).events.find(params[:event_id]).items
      progress_bar_claimed
      render_items_partial
     else
      redirect_to host_event_path(session[:host_id], @event)
    end
  end

  def update
    @item = Item.find(params[:id])
    @event = Event.find(params[:event_id])
    @item.update_attributes(params[:item])
    progress_bar_claimed
    render_items_partial
  end

  def destroy
    Item.find(params[:id]).destroy
    @event = Event.find(params[:event_id])
    @items = @event.items
    progress_bar_claimed
    render_items_partial
  end

  def important
    @event = Event.find(params[:event_id])
    @items = Item.all
    @item = Item.find(params[:id])
    @item.toggle(:important)
    @item.save
    progress_bar_claimed
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


