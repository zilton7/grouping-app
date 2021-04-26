require 'rails_helper'

RSpec.describe Gift, type: :model do
  subject(:gift) { Gift.new(name: 'Test Gift', author: User.first) }

  describe 'Valid' do
    it { should validate_length_of(:name).is_at_most(24) }

    it { should validate_length_of(:name).is_at_least(3) }

    it { should allow_value(gift.name).for(:name) }

    it { should allow_value(gift.name).for(:name) }

    it { should_not allow_value('a' * 25).for(:name) }

    it { should allow_value(1.99).for(:amount) }

    it { should allow_value(1).for(:amount) }

    it { should_not allow_value('aa').for(:amount) }
  end

  describe 'Gift' do
    it { should belong_to(:author) }

    it { should belong_to(:group).optional }
  end
end
