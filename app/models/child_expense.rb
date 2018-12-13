class ChildExpense < ApplicationRecord
  belongs_to :expense
  belongs_to :child
end
