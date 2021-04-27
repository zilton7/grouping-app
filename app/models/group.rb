class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :gifts

  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 24 }
end
