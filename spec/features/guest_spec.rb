require 'spec_helper'

feature 'Create Guest' do

  let!(:host) { FactoryGirl.create :host }
  let!(:event) { FactoryGirl.create :event }
  before(:each) do
    web_login host
  end

  context 'single event page' do
    it 'can add a guest to an event' do
      event = Event.create name: "Test Event #2", host_id: host.id, address: "717 California"
      visit host_events_path(host)
      click_link "Test Event #2"
      fill_in "guest_name", with: "Logan"
      fill_in "guest_email", with: "yougert2k@2gmail.com"
      click_button "Create Guest"
      expect(page).to have_content "Logan"
    end
  end
end