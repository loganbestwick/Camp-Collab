require 'spec_helper'

feature 'Create Event' do

  context 'on host events display page' do

    it 'can create event with valid input' do
      visit root_path
      host = Host.create name: "Logan", password: "password", email: "goob@foob.com", phone: "4123457575"
      fill_in 'login_email',   with: host.email
      fill_in 'login_password', with: host.password
      click_button "Log in"
      visit host_events_path(host)
      fill_in 'event_name',   with: "Test Event"
      fill_in 'event_address', with: "717 California"
      expect{click_button "Create Event"}.to change{Event.all.count}.by(1)
      expect(page).to have_content "Test Event"
     end

     it 'goes to the event index page is a name is not passed in to the form' do
      host = Host.create name: "Logan", password: "password", email: "goob@foob.com"
      visit root_path
      fill_in 'login_email',   with: host.email
      fill_in 'login_password', with: host.password
      click_button "Log in"
      visit host_events_path(host)
      fill_in 'event_name',   with: nil
      click_button "Create Event"
      expect(page).to have_content("Name can't be blank")
     end

   end
 end

 feature 'Delete Event' do

  context 'on host events display page' do

    it 'can delete an event' do
      host = Host.create name: "Logan", password: "password", email: "goob@foob.com"
      event = Event.create name: "whatever", host_id: 1, address: "Jenner Inn & Event Center, 25050 California 1, Jenner, CA"
      visit root_path
      fill_in 'login_email',   with: host.email
      fill_in 'login_password', with: host.password
      click_button "Log in"
      visit host_events_path(host)
      expect{click_link "Delete"}.to change{Event.all.count}.by(-1)
      expect(page).to_not have_content "Test Event"
     end

   end
 end

 feature 'add custom item' do

  context 'on single event page' do

    it 'can create a new item' do
      host = Host.create name: "Logan", password: "password", email: "goob@foob.com"
      visit root_path
      fill_in 'login_email',   with: host.email
      fill_in 'login_password', with: host.password
      click_button "Log in"
      visit host_events_path(host)
      fill_in 'event_name',   with: "New Event"
      fill_in 'event_address', with: '717 California'
      click_button "Create Event"
      fill_in 'item_name', with: "Test Item"
      expect{click_button "Create Item"}.to change{Item.all.count}.by(1)
      expect(page).to have_content "Test Item"
    end

    #Pending test as toggling the important attribute is currently not working
    xit 'can change the state of an item to important' do
      host = Host.create name: "Logan", password: "password", email: "goob@foob.com"
      event = Event.create name: "Test Event #2", host_id: host.id
      item = Item.create name: "Test Item #2", event_id: event.id
      visit root_path
      fill_in 'login_email',   with: "goob@foob.com"
      fill_in 'login_password', with: "password"
      click_button 'Log in'
      click_link 'Test Event #2'
      expect(page).to have_content("Test Event #2")
      expect(page).to have_content("Test Item #2")
      expect{click_link "Important"}.to change{item.reload.important}
    end

    it 'can change the state of an item to purchased' do
      host = Host.create name: "Logan", password: "password", email: "goob@foob.com"
      event = Event.create name: "Test Event #2", host_id: host.id, address: "717 California"
      item = Item.create name: "Test Item #2", event_id: event.id
      guest = Guest.create
      guest_2 = Guest.create
      guest_3 = Guest.create
      visit root_path
      fill_in 'login_email',   with: host.email
      fill_in 'login_password', with: 'password'
      click_button 'Log in'
      click_link 'Test Event #2'
      expect(page).to have_content("Test Event #2")
      expect(page).to have_content("I got it")
      expect{click_link "I got it"}.to change{item.reload.purchased}
    end

  end
end
