class AddTextbookToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :textbook, :integer
  end
end
