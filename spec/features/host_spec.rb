require 'spec_helper'

feature 'Signup' do
  let!(:host) { FactoryGirl.create :host }
  context 'on landing page' do

    it "can create account with valid input" do
      visit root_path
      expect {
       fill_in 'host_email',   with: "blank@blank.com"
       fill_in 'host_password', with: "password123"
       click_button "Create Account"
       }.to change(Host, :count).by(1)
     end

     it "redirects to root page if incorrect sign up email info is passed" do
      visit root_path
      fill_in 'host_email',   with: ""
      fill_in 'host_password', with: "testing"
      click_button "Create Account"
      expect(page).to have_content("Email is invalid")
    end

    it "redirects to root page if incorrect sign up email info is passed" do
      visit root_path
      fill_in 'host_email',   with: "logan@gmail.com"
      fill_in 'host_password', with: "test"
      click_button "Create Account"
      expect(page).to have_content("Password is too short")
    end

  end



  describe 'Sign out' do
    before(:each) do
      web_login host
    end
    context 'events page' do

      it "can log user out" do
        click_link "Logout"
        uri = URI.parse(current_url)
        "#{uri.path}#{uri.query}".should == root_path

      end

    end
  end

  describe 'log in' do
    context 'on landing page' do
      it "can log in with valid input (testing url)" do
        current_host = Host.create name: 'guy', password: "password123", email: "a@b.com"
        web_login current_host
        uri = URI.parse(current_url)
        "#{uri.path}#{uri.query}".should == host_events_path(current_host)
      end

      it "can't log in with invalid input (testing url)" do
        current_host = Host.create name: 'guy', password: "password123", email: "a@b.com"
        visit root_path
        fill_in 'login_email',   with: "a@b.com"
        fill_in 'login_password', with: "wefwefwefwef"
        click_button "Log in"
        uri = URI.parse(current_url)
        "#{uri.path}#{uri.query}".should == root_path
      end

    end
  end
end