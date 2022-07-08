class CreateLessonAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :lesson_answers do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.string :student, null: false
      t.text :memo
      t.timestamps
    end
  end
end
