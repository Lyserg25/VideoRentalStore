class Product < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :genre, optional: true
end
