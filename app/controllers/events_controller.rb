class EventsController < ApplicationController

  def index
    @events = Event.all
    @event = Event.new
    @host = Host.find(params[:host_id])
  end

  def show
    @item = Item.new
    @host  = Host.find(params[:host_id])
    @event = Event.find(params[:id])
    @items = @event.items
  end

  def create
    @host = Host.find(params[:host_id])
    @event = Event.create(params[:event])
    redirect_to host_event_path(@host, @event)
  end

  def destroy
  end
end