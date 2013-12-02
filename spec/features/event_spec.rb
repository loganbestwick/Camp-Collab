require 'spec_helper'

feature 'Create Event' do

  context 'on host events display page' do

    it 'can create event with valid input' do
      host = Host.create name: "Logan", password: "password", email: "goob@foob.com"
      visit host_events_path(host)
      fill_in 'event_name',   with: "Test Event"
      expect{click_button "Create Event"}.to change{Event.all.count}.by(1)
      expect(page).to have_content "Event Name: Test Event"
     end

     it 'goes to the event index page is a name is not passed in to the form' do
      host = Host.create name: "Logan", password: "password", email: "goob@foob.com"
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
      visit host_events_path(host)
      fill_in 'event_name',   with: "Test Event"
      click_button "Create Event"
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
      visit host_events_path(host)
      fill_in 'event_name',   with: "New Event"
      click_button "Create Event"
      fill_in 'item_name', with: "Test Item"
      expect{click_button "Create Item"}.to change{Item.all.count}.by(1)
      expect(page).to have_content "Test Item"
    end

    it 'can change the state of an item to important' do
      host = Host.create name: "Logan", password: "password", email: "goob@foob.com"
      event = Event.create name: "Test Event #2", host_id: host.id
      item = Item.create name: "Test Item #2", event_id: event.id
      visit root_path
      fill_in 'email',   with: "goob@foob.com"
      fill_in 'password', with: "password"
      click_button 'Log in'
      click_link 'Test Event #2'
      expect(page).to have_content("Event Name: Test Event #2")
      expect(page).to have_content("Test Item #2")
      expect{click_link "Important"}.to change{item.reload.important}
    end

    it 'can change the state of an item to purchased' do
      host = Host.create name: "Logan", password: "password", email: "goob@foob.com"
      event = Event.create name: "Test Event #2", host_id: host.id
      item = Item.create name: "Test Item #2", event_id: event.id
      visit root_path
      fill_in 'email',   with: host.email
      fill_in 'password', with: 'password'
      click_button 'Log in'
      click_link 'Test Event #2'
      expect(page).to have_content("Event Name: Test Event #2")
      expect(page).to have_content("Purchase")
      expect{click_link "Purchase"}.to change{item.reload.purchased}
    end

  end
end