require 'rails_helper'

RSpec.feature 'CreateGroupProcesses', type: :feature do
  before(:each) do
    User.create(name: 'user')
    visit '/sign-in'
    fill_in 'session_name', with: 'user'
    click_button 'Sign in'
  end

  it 'Returns success if new group created' do
    click_on 'All Groups'
    click_on 'Create Group'
    fill_in 'group_name', with: 'test'
    click_button 'Create Group'
    expect(page.status_code).to be(200)
    expect(page).to have_content 'Group: test'
  end

  it 'Raises error if group name has already been taken' do
    Group.create(name: 'test', user: User.first, icon: '')
    click_on 'All Groups'
    click_on 'Create Group'
    fill_in 'group_name', with: 'test'
    click_button 'Create Group'
    expect(page).to have_content 'Name has already been taken'
  end

  it 'Raises error if name too short' do
    click_on 'All Groups'
    click_on 'Create Group'
    fill_in 'group_name', with: 'te'
    click_button 'Create Group'
    expect(page).to have_content 'Name is too short (minimum is 3 characters)'
  end
end
