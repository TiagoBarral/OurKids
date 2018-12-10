class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :child
  belongs_to :category
  monetize :amount_cents
  mount_uploader :receipt, PhotoUploader
end
