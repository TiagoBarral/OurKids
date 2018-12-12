class Payment < ApplicationRecord
  belongs_to :payer, class_name: :User
  belongs_to :payee, class_name: :User
  belongs_to :family

  enum payment_method: [:cash, :bank_transfer, :cheque, :other]
end
