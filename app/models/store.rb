# frozen_string_literal: true

# == Schema Information
#
# Table name: stores
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  address    :text             not null
#  phone      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Store model
class Store < ApplicationRecord
end
