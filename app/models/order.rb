class Order < ActiveRecord::Base
  has_many :items
  has_many :services, through: :items
  has_many :supplies, through: :items
  validates_presence_of :refers_month
end
