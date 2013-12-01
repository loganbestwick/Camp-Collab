require 'spec_helper'

feature 'Signup' do

  context 'on landing page' do

    it "can create account with valid input" do
      visit root_path
      expect {
       fill_in 'host_email',   with: "blank@blank.com"
       fill_in 'host_password', with: "password123"
       click_button "Create Host"
       }.to change(Host, :count).by(1)
     end

   end
 end

 feature 'Sign out' do

  context 'events page' do

    it "can log user out" do
      current_user = Host.create name: 'guy', password: "password123", email: "a@b.com"
      visit root_path
      fill_in 'email',   with: "a@b.com"
      fill_in 'password', with: "password123"
      click_button "Log in"
      click_link "Logout"
      uri = URI.parse(current_url)
      "#{uri.path}#{uri.query}".should == root_path

     end

   end
 end


 feature 'log in' do
  context 'on landing page' do
    it "can log in with valid input (testing url)" do
      visit root_path
      current_host = Host.create name: 'guy', password: "password123", email: "a@b.com"
      fill_in 'email',   with: "a@b.com"
      fill_in 'password', with: "password123"
      click_button "Log in"
      uri = URI.parse(current_url)
      "#{uri.path}#{uri.query}".should == host_events_path(current_host)
    end

    it "can't log in with invalid input (testing url)" do
      visit root_path
      current_host = Host.create name: 'guy', password: "password123", email: "a@b.com"
      fill_in 'email',   with: "wrong@email.com"
      fill_in 'password', with: "wrongpassword"
      click_button "Log in"
      uri = URI.parse(current_url)
      "#{uri.path}#{uri.query}".should == root_path
    end

  end
end