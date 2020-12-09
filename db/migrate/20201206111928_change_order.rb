class ChangeOrder < ActiveRecord::Migration[5.2]
  #def change
#  end
  def up
    change_column :orders, :payment_method, :integer, default: 0
  end

  def down
    change_column :orders, :payment_method, :integer
  end
end
