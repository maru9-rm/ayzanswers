class AddAnswerToStorages < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :storage, :boolean, default: false
  end
end
