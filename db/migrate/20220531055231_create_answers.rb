class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.references :user, null: false
      t.string :title
      t.text :memo
      t.integer :subject
      t.integer :grade
      t.timestamps
    end
  end
end
