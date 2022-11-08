class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
