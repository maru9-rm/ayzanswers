# == Schema Information
#
# Table name: answers
#
#  id         :bigint           not null, primary key
#  grade      :integer
#  memo       :text
#  subject    :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Answer < ApplicationRecord
    has_many_attached :images
end
