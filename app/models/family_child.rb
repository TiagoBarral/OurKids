class FamilyChild < ApplicationRecord
  has_many :families
  has_many :children
end
