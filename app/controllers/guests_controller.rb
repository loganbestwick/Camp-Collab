class GuestsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @token = SecureRandom.urlsafe_base64
    @guest = Guest.new(name: params[:guest][:name], email: params[:guest][:email], event_id: @event.id, token: @token)
    @guest.save
    redirect_to host_event_path(session[:host_id], @event)
  end

  def new
    @guests = Guest.all
    @guest = Guest.new
  end

end