class User < ApplicationRecord
  before_create :check_avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :photo, PhotoUploader
  has_many :parent_families, class_name: :Family, foreign_key: :parent_id
  has_many :coparent_families, class_name: :Family, foreign_key: :coparent_id
  has_many :parent_children, through: :parent_families, source: :children
  has_many :coparent_children, through: :coparent_families, source: :children
  has_many :expenses

  def families
    parent_families + coparent_families
  end

  def children
    parent_children + coparent_children
  end

  def check_avatar
    self.remote_photo_url = 'https://res.cloudinary.com/drpwozhzg/image/upload/v1544626317/default-avatar.png' if self.remote_photo_url.nil?
  end
end
