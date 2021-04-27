class CreateGiftsGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :gifts_groups do |t|
      t.references :group, null: false, foreign_key: true
      t.references :gift, null: false, foreign_key: true

      t.timestamps
    end
  end
end
