class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.integer :user_id
      t.string :title
      t.integer :year

      t.timestamps
    end
  end
end
