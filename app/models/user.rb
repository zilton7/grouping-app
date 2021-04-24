class User < ApplicationRecord
  has_many :groups
  has_many :gifts

  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 24 }
end
