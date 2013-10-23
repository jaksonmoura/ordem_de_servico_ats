class Supply < ActiveRecord::Base
  belongs_to :category
  has_many :items
  has_many :orders, through: :items
end
