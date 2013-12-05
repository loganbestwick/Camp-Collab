module CapybaraHelpers
  def web_login host
    visit root_path
    fill_in 'login_email',   with: host.email
    fill_in 'login_password', with: host.password
    click_button "Log in"
  end
end