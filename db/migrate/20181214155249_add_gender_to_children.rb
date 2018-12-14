class AddGenderToChildren < ActiveRecord::Migration[5.2]
  def change
    add_column :children, :gender, :integer, default: 2
  end
end
