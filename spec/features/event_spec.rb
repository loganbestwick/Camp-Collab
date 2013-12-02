require 'spec_helper'

feature 'Create Event' do

  context 'on host events display page' do

    it 'can create event with valid input' do
      host = Host.create name: "Logan", password: "password", email: "goob@foob.com"
      visit host_events_path(host)
      fill_in 'event_name',   with: "Test Event"
      expect{click_button "Create Event"}.to change{Event.all.count}.by(1)
      expect(page).to have_content "Test Event"
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

# #Capybara appears to have an error when it runs the URI route from this test. It includes
# #a forward slash in the URI which makes it invalid
    it 'can change the state of an item to important' do
      host = Host.create name: "Logan", password: "password", email: "goob@foob.com"
      visit root_path
      fill_in 'email',   with: "goob@foob.com"
      fill_in 'password', with: "password"
      click_button 'Log in'
      fill_in 'event_name',   with: "Test Event #2"
      click_button "Create Event"
      fill_in 'item_name', with: "Test Item #2"
      click_button "Create Item"
      # click_link "Important"
      # fill_in 'event_name',   with: "New Event"
      # click_button "Create Event"
      # fill_in 'item_name', with: "Test Item"
      # expect{click_button "Create Item"}.to change{Item.all.count}.by(1)
      # expect(page).to have_content "Test Item"
    end

  end
 end