# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text             not null
#  image_url   :string
#  price       :decimal(8, 2)    not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# Product model
class Product < ApplicationRecord
end
