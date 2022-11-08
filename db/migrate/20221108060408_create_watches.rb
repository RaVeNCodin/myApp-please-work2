class CreateWatches < ActiveRecord::Migration[7.0]
  def change
    create_table :watches do |t|
      t.string :brand
      t.integer :price
      t.integer :year

      t.timestamps
    end
  end
end
