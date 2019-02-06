class CreateMountains < ActiveRecord::Migration[5.2]
  def change
    create_table :mountains do |t|
      t.string :name, null: false
      t.string :city_or_town, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.text :description, null: false

      t.timestamps null: false
    end
  end
end
