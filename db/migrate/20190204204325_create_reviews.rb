class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.belongs_to :user, null: false
      t.belongs_to :mountain, null: false

      t.timestamps null: false
    end
  end
end
