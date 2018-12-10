class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.references :user, foreign_key: true
      t.references :child, foreign_key: true
      t.string :title
      t.text :description
      t.date :date
      t.integer :percentage
      t.references :category, foreign_key: true
      t.string :receipt

      t.timestamps
    end
  end
end
