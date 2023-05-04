# == Schema Information
#
# Table name: restaurants
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  address     :string
#  city        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Restaurant < ApplicationRecord
  validates :name, :description, :address, :city, presence: true
   validates :name, uniqueness: { case_sensitive: false }
end
