class Categorytype < ApplicationRecord
  has_many :categories
    validates_uniqueness_of :label
end
