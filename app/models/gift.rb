class Gift < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :group

  validates :name, presence: true, length: { minimum: 3, maximum: 24 }
  validates :amount, presence: true, numericality: { only_float: true } 
end
