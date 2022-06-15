# == Schema Information
#
# Table name: answers
#
#  id         :bigint           not null, primary key
#  grade      :integer          not null
#  memo       :text
#  subject    :integer          not null
#  textbook   :integer
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_answers_on_user_id  (user_id)
#
require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
