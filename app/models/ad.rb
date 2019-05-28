class Ad < ApplicationRecord
  validate :image_type
  belongs_to :user
  belongs_to :category
  has_many_attached :images
validates_presence_of :title, :price, :location

  scope :published, ->{where.not(publishing_at: nil)}
  scope :unpublished, ->{where(publishing_at: nil)}

  def self.search(search)
    where("title LIKE ?", "%#{search}%")
    where("description LIKE ?", "%#{search}%")
  end

  public
  def thumbnail input
  return self.images[input].variant(resize:'500x300!').processed
  end

  private
  def image_type
  if images.attached? == false
    errors.add(:images, "are missing!")
  end
  images.each do |image|
    if !image.content_type.in?(%(image/png image/jpeg))
      errors.add(:images, "needs to be JPEG or PNG")
    end
  end
 end
end
