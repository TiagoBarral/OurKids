class Expense < ApplicationRecord
  belongs_to :user
  has_many :childExpenses
  has_many :children, through: :childExpenses
  belongs_to :category
  monetize :amount_cents
  mount_uploader :receipt, PhotoUploader
end
