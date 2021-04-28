class CreateGifts < ActiveRecord::Migration[6.1]
  def change
    create_table :gifts do |t|
      t.string :name
      t.integer :amount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
