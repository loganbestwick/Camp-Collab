class GuestMailer < ActionMailer::Base

  def guest_invitation(event, guest)
    @guest = guest
    @event = event
    @host = Host.find(event.host_id)
    mail(to: "#{@guest.email}",
         subject: "#{@host.name} has invited you on a camping trip!",
         from: "campcollabteam@gmail.com")
  end
end
