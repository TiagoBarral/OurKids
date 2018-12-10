class Family < ApplicationRecord
  belongs_to :parent, class_name: :User
  belongs_to :coparent, class_name: :User
  has_many :payments
  has_many :children, through: :familychild
end
