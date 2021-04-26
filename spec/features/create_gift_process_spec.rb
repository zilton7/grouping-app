# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.feature 'CreateGiftProcesses', type: :feature do
  before(:each) do
    user = User.create(name: 'user')
    Group.create(name: 'test-group', user: user, icon: '')
    visit '/sign-in'
    fill_in 'session_name', with: 'user'
    click_button 'Sign in'
  end

  it 'Returns success if new gift created' do
    click_on 'All Groups'
    click_on 'test-group'
    click_on 'Add Gift'
    fill_in 'gift_name', with: 'gift-test'
    fill_in 'gift_amount', with: 1
    click_on 'Create Gift'
    expect(page.status_code).to be(200)
    expect(page).to have_content 'Group: test-group'
  end

  it 'Raises error if gift amount not provided' do
    click_on 'All Groups'
    click_on 'test-group'
    click_on 'Add Gift'
    fill_in 'gift_name', with: 'gift-test'
    click_on 'Create Gift'
    expect(page).to have_content 'Amount can\'t be blank'
  end

  it 'Raises error if name too short' do
    click_on 'All Groups'
    click_on 'test-group'
    click_on 'Add Gift'
    click_on 'Create Gift'
    expect(page).to have_content 'Name can\'t be blank'
  end
end
# rubocop:enable Metrics/BlockLength
