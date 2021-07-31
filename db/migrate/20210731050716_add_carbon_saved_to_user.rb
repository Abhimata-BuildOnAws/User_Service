class AddCarbonSavedToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :carbon_saved, :float
  end
end
