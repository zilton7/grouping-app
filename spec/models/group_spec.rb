require 'rails_helper'

RSpec.describe Group, type: :model do
  subject(:group) { Group.new(name: 'Test Group', user: User.first) }

  describe 'Valid' do
    it { should validate_length_of(:name).is_at_most(24) }

    it { should_not allow_value('').for(:name) }

    it { should validate_length_of(:name).is_at_least(3) }

    too_long = 'a' * 25

    it { should_not allow_value(too_long).for(:name) }

    it { should allow_value(group.name).for(:name) }

  end

  describe 'Group' do
    it { should belong_to(:user) }

    it { should have_many(:gifts) }
  end
end
