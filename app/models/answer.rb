# == Schema Information
#
# Table name: answers
#
#  id         :bigint           not null, primary key
#  grade      :integer          not null
#  memo       :text
#  subject    :integer          not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_answers_on_user_id  (user_id)
#
class Answer < ApplicationRecord
    has_many_attached :image
    belongs_to :user
    validates :title, presence: true

    enum subject: { japanese: 1, math: 2, science: 3, english: 4, history: 5, geography: 6, civics: 7 }
    enum grade: { j1: 1, j2: 2, j3: 3, e4: 4, e5: 5, e6: 6}
end
