# == Schema Information
#
# Table name: pastpapers
#
#  id          :bigint           not null, primary key
#  exam        :integer          not null
#  memo        :text
#  school_name :integer          not null
#  year        :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_pastpapers_on_user_id  (user_id)
#
require 'test_helper'

class PastpaperTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
