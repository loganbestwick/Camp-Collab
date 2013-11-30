class EventsController < ApplicationController

  def index
    # @host = Host.find(params[:id])
    @events = Event.all
    @event = Event.new
  end

  def show
    @item = Item.new
    @host  = Host.find(params[:id])
    @event = Event.find(params[:id])
    @items = @event.items
  end

  def create
    @event = Event.create(params[:event])
    redirect_to host_event_path(@event)
  end

  def destroy
  end
end