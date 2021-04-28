class AddGroupToGifts < ActiveRecord::Migration[6.1]
  def change
    add_reference :gifts, :group, null: true, foreign_key: true
  end
end
