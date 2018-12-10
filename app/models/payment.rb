class Payment < ApplicationRecord
  belongs_to :payer, class_name: :User
  belongs_to :payee, class_name: :User
  belongs_to :family
  monetize :amount_cents
end
