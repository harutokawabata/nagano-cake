class ChangeOrder2 < ActiveRecord::Migration[5.2]
#   def change
#   end
  def up
    change_column :orders, :status, :integer, default: 0
  end

  def down
    change_column :orders, :status, :integer
  end
end
