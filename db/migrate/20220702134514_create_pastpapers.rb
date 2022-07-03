class CreatePastpapers < ActiveRecord::Migration[6.0]
  def change
    create_table :pastpapers do |t|
      t.references :user, null: false
      t.integer :school_name, null: false
      t.integer :year, null: false
      t.text :memo
      t.integer :exam, null: false
      t.timestamps
    end
  end
end
