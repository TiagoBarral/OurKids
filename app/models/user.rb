class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :photo, PhotoUploader
  has_many :parent_families, class_name: :Family, foreign_key: :parent_id
  has_many :coparent_families, class_name: :Family, foreign_key: :coparent_id
  has_many :parent_children, through: :parent_families, source: :children
  has_many :coparent_children, through: :coparent_families, source: :children

  def families
    parent_families + coparent_families
  end

  def children
    parent_children + coparent_children
  end
end
