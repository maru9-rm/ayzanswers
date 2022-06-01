class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.text :memo
      t.integer :subject, null: false
      t.integer :grade, null: false
      t.timestamps
    end
  end
end
