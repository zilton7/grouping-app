class RemoveGroupIdFromGifts < ActiveRecord::Migration[6.1]
  def change
    remove_reference :gifts, :group, null: false, foreign_key: true
  end
end
