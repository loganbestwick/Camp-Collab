class EventsController < ApplicationController

  def index
    @events = Event.all
    @event = Event.new
    @host = Host.find(params[:host_id])
    if session[:host_id]
      render "index"
    else
      render "fail"
    end
  end

  def show
    @viewable = false
    @item = Item.new
    @guest = Guest.new
    @host  = Host.find(params[:host_id])
    @event = Event.find(params[:id])
    @items = @event.items
    @guests = Guest.where(event_id: @event.id)
    if Guest.exists?(token: params[:event_token], event_id: @event.id) || session[:host_id]
      render "show"
    else
      render "fail"
    end
  end

  def create
    @events = Event.all
    @host = Host.find(params[:host_id])
    @event = Event.create(params[:event])
    @host.events << @event
    if @event.save
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