class Family < ApplicationRecord
  belongs_to :parent, class_name: :User
  belongs_to :coparent, class_name: :User
  has_many :payments, dependent: :destroy
  has_many :familyChildren, dependent: :destroy
  has_many :children, through: :familyChildren, dependent: :destroy
  has_many :expenses, through: :children, dependent: :destroy
end
