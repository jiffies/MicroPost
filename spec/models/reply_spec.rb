# == Schema Information
#
# Table name: replies
#
#  id           :integer         not null, primary key
#  content      :text
#  user_id      :integer
#  micropost_id :integer
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

require 'spec_helper'

describe Reply do
  pending "add some examples to (or delete) #{__FILE__}"
end
