require 'rails_helper'

RSpec.feature "SignUpProccesses", type: :feature do
  it 'Return success if new user created' do
    visit '/sign-up'
    fill_in 'Name', with: 'user'
    click_button 'Create User'
    expect(page.status_code).to be(200)
    expect(page).to have_content 'Welcome to the app!'
  end

  it 'Raise error if name has already been taken' do
    User.create(name: 'user')
    visit '/sign-up'
    fill_in 'Name', with: 'user'
    click_button 'Create User'
    expect(page).to have_content 'Name has already been taken'
  end
end
