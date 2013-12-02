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
    @events = Event.all
    @host = Host.find(params[:host_id])
    @event = Event.create(params[:event])
    @host.events << @event
    if @host.save
      redirect_to host_event_path(@host, @event)
    else
      render "index"
    end
  end

  def destroy
    @host = Host.find(params[:host_id])
    @event = Event.find(params[:id])
    @specific_event = @host.events.find(params[:id])
    @specific_event.destroy
    redirect_to host_events_path(@host)
  end
end