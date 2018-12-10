class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.references :family, foreign_key: true
      t.string :amount
      t.integer :payment_method

      t.timestamps
    end
  end
end
