# == Schema Information
#
# Table name: lesson_answers
#
#  id         :bigint           not null, primary key
#  memo       :text
#  student    :string           not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_lesson_answers_on_user_id  (user_id)
#
class LessonAnswer < ApplicationRecord
    has_many_attached :image
    belongs_to :user
    validates :title, presence: true
end
