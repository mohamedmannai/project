class Ad < ApplicationRecord
  belongs_to :user
  belongs_to :category

  scope :published, ->{where.not(publishing_at: nil)}
  scope :unpublished, ->{where(publishing_at: nil)}
end
