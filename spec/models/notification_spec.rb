# == Schema Information
#
# Table name: notifications
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  source     :string(255)
#  source_id  :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  read       :boolean         default(FALSE)
#

require 'spec_helper'

describe Notification do
  pending "add some examples to (or delete) #{__FILE__}"
end
