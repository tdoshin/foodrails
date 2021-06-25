class CreateFoodmodels < ActiveRecord::Migration[6.1]
  def change
    create_table :foodmodels do |t|
      t.string :name
      t.string :image
      t.string :recipe

      t.timestamps
    end
  end
end
