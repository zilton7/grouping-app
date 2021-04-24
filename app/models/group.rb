class Group < ApplicationRecord
  belongs_to :user
  has_many :gifts

  validates :name, presence: true, uniqueness: true
end
