class ChildExpense < ApplicationRecord
  after_save :update_balance

  belongs_to :expense
  belongs_to :child

  def update_balance
    if child.present?
      user_amount = expense.percentage * expense.amount / 100
      other_amount = expense.amount - user_amount
      if expense.user == child.families.first.parent
        parent_amount = child.families.first.outstanding_parent_balance. - other_amount.to_i
        coparent_amount = child.families.first.outstanding_coparent_balance. + other_amount.to_i

        child.families.first.update(outstanding_coparent_balance: coparent_amount, outstanding_parent_balance: parent_amount)
      elsif expense.user == child.families.first.coparent
        coparent_amount = child.families.first.outstanding_parent_balance. - other_amount.to_i
        parent_amount = child.families.first.outstanding_coparent_balance. + other_amount.to_i

        child.families.first.update(outstanding_coparent_balance: coparent_amount, outstanding_parent_balance: parent_amount)
      end
    end
  end
end
