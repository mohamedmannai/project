class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/default_image.png"
     validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
     validates_presence_of :username, :first_name, :last_name
     validates_uniqueness_of :username
     validates :phone_number, length: { is: 8 }, numericality: true


  has_many :ads, dependent: :destroy
  has_many :favorites
end
