class AddCategoryIdToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :category_id, :integer
  end
end
