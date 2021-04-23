require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(name: 'Mickey') }

  describe 'Valid' do
    it { should validate_length_of(:name).is_at_most(24) }

    it { should_not allow_value('').for(:name) }

    it { should validate_length_of(:name).is_at_least(3) }

    too_long = 'a' * 25

    it { should_not allow_value(too_long).for(:name) }

    it { should allow_value(user.name).for(:name) }

  end

  describe 'User' do
    it { should have_many(:groups) }

    it { should have_many(:gifts) }
  end

end
