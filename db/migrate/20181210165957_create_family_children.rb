class CreateFamilyChildren < ActiveRecord::Migration[5.2]
  def change
    create_table :family_children do |t|
      t.references :family, foreign_key: true
      t.references :child, foreign_key: true

      t.timestamps
    end
  end
end
