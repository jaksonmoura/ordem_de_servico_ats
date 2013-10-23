class Service < ActiveRecord::Base
  belongs_to :category
  has_many :itens
  has_many :orders, through: :itens
end
