class ChangeGenre < ActiveRecord::Migration[5.2]
  # def change
  # end
  def up
    change_column :genres, :name, :string, null: false
  end

  def down
    change_column :genres, :name, :string
  end
end
