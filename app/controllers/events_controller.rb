class EventsController < ApplicationController

  def index
    @events = Event.where(:host_id => params[:host_id])
    @event = Event.new
    @host = Host.find(params[:host_id])
    if session[:host_id]
      render "index"
    else
      render "fail"
    end
  end

  def show
    @event = Event.find(params[:id])
    @hash = Gmaps4rails.build_markers(@event) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
    end

    @viewable = false
    @item = Item.new
    @guest = Guest.new
    @guests = Guest.where(event_id: @event.id)
    @host  = Host.find(params[:host_id])
    @items = @event.items
    @claimed = @items.where("guest_id IS NOT NULL or host_id IS NOT NULL")

    if @items != [] || @claimed != []
      @completion = ((@claimed.size.to_f/@items.size.to_f) * 100).to_i
    else
      @completion = 0
    end

    if session[:host_id] || Guest.exists?(token: params[:event_token], event_id: @event.id) || Guest.exists?(token: session[:guest_token], event_id: @event.id)
          session[:guest_token] = params[:event_token] if params[:event_token]
          session[:guest_id] = Guest.find_by_token(session[:guest_token]).id if session[:guest_token]
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
