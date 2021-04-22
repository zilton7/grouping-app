class Gift < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :group

  validates :name, presence: true
  validates :amount, presence: true
end
