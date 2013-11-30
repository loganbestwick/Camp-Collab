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