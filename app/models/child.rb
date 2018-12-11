class Child < ApplicationRecord
  has_many :familyChildren
  has_many :families, through: :familyChildren
  has_many :parents, through: :families, class_name: :User
end
