require 'rails_helper'

RSpec.feature 'SignUpProcesses', type: :feature do
  it 'Returns success if new user created' do
    visit '/sign-up'
    fill_in 'Name', with: 'user'
    click_button 'Create User'
    expect(page).to have_content 'Welcome to the app!'
  end

  it 'Raises error if name has already been taken' do
    User.create(name: 'user')
    visit '/sign-up'
    fill_in 'Name', with: 'user'
    click_button 'Create User'
    expect(page).to have_content 'Name has already been taken'
  end

  it 'Raises error if name too short' do
    User.create(name: 'user')
    visit '/sign-up'
    fill_in 'Name', with: 'us'
    click_button 'Create User'
    expect(page).to have_content 'Name is too short (minimum is 3 characters)'
  end
end
