class GuestsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @token = SecureRandom.urlsafe_base64
    @guest = Guest.new(name: params[:guest][:name], email: params[:guest][:email], event_id: @event.id, token: @token)
    @guest.save
    GuestMailer.guest_invitation(@event, @guest).deliver
    render_guests_partial
  end

end