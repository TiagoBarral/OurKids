class CreateChildExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :child_expenses do |t|
      t.references :expense, foreign_key: true
      t.references :child, foreign_key: true

      t.timestamps
    end
  end
end
