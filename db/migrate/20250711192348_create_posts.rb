class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :name, null: false
      t.text :description
      t.date :month_year, null: false
      t.timestamps
    end
  end
end
