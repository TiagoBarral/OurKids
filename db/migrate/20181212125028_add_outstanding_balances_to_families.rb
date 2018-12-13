class AddOutstandingBalancesToFamilies < ActiveRecord::Migration[5.2]
  def change
    add_column :families, :outstanding_parent_balance, :integer, default: 0
    add_column :families, :outstanding_coparent_balance, :integer, default: 0
  end
end
