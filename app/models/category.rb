class Category < ApplicationRecord
  has_many :ads
  belongs_to :categorytype
end
