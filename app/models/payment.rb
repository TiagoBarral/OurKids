class Payment < ApplicationRecord
  after_create :update_balance

  belongs_to :payer, class_name: :User
  belongs_to :payee, class_name: :User
  belongs_to :family

  enum payment_method: [:Cash, "Bank Transfer".to_sym, :Check, :Other]

  def update_balance
    parent = self.family.parent
    coparent = self.family.coparent
    if parent == payee
      family.outstanding_parent_balance = family.outstanding_parent_balance.to_i + self.amount.to_i
      family.outstanding_coparent_balance = family.outstanding_coparent_balance.to_i - self.amount.to_i
      family.save
    elsif parent == payer
      family.outstanding_parent_balance = family.outstanding_parent_balance.to_i - self.amount.to_i
      family.outstanding_coparent_balance = family.outstanding_coparent_balance.to_i + self.amount.to_i
      family.save
    end
  end
end
