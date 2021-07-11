class AddUserToFoodModel < ActiveRecord::Migration[6.1]
  def change
    add_column :foodmodels, :user_id, :integer
  end
end
