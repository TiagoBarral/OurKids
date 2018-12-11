class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :photo, PhotoUploader
  has_many :parentfamilies, class_name: :Family, foreign_key: :parent_id
  has_many :coparentfamilies, class_name: :Family, foreign_key: :coparent_id
end
