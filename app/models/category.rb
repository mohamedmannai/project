class Category < ApplicationRecord
  has_many :ads
  belongs_to :categorytype
      validates_uniqueness_of :label
end
