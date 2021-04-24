require 'rails_helper'

RSpec.feature "SignInProcesses", type: :feature do
  before(:each) do
    User.create(name: 'user')
  end

  it 'Sign existing user in' do
    visit '/sign-in'
    fill_in 'session_name', with: 'user'
    click_button 'Sign in'
    expect(page).to have_content('Signed in successfully')
  end

  it 'Response 200 when visits sign in page' do
    visit 'sign-in'
    expect(page.status_code).to be(200)
  end
end
