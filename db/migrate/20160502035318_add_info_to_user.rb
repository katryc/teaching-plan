class AddInfoToUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :field_of_teaching, :string
    add_column :users, :city, :string
  end
end
