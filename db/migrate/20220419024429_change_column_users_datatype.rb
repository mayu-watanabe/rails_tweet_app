class ChangeColumnUsersDatatype < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :name, :string
    change_column :users, :email, :string
    change_column :users, :image_name, :string
  end
end
