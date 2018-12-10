class AddPayeeAndPayerIdsToPayments < ActiveRecord::Migration[5.2]
  def change
    add_reference :payments, :payer
    add_reference :payments, :payee
  end
end
