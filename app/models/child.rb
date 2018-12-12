class Child < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :familyChildren
  has_many :families, through: :familyChildren
  has_many :parents, through: :families, class_name: :User
  has_many :expenses
end
