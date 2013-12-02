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
    @guests = Guest.where(event_id: @event.id)
  end

  def create
    @host = Host.find(params[:host_id])
    @event = Event.create(params[:event])
    @host.events << @event
    redirect_to host_event_path(@host, @event)
  end

  def destroy
    @host = Host.find(params[:host_id])
    @event = Event.find(params[:id])
    @specific_event = @host.events.find(params[:id])
    @specific_event.destroy
    redirect_to host_events_path(@host)
  end
end