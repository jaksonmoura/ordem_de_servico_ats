class Category < ActiveRecord::Base
  has_many :services
  has_many :supplies
end
