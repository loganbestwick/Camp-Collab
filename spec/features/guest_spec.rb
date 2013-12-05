require 'spec_helper'

feature 'Create Guest' do

  let!(:host) { FactoryGirl.create :host }
  let!(:event) { FactoryGirl.create :event }
  before(:each) do
    web_login host
  end

  context 'single event page' do
    it 'can add a guest to an event' do
      visit host_event_path(host, event)
      click_link "logan"
      fill_in "guest_name", with: "Logan"
      fill_in "guest_email", with: "yougert2k@2gmail.com"
      expect{click_button "Create Guest"}.to

    end
  end
end