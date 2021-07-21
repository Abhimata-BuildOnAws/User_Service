class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, id: :uuid do |t|
      enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
      t.string :name
      t.string :street
      t.string :email
      t.string :state
      t.string :country
      t.integer :tree_points
      t.float :latitude
      t.float :longitude
      t.float :pollution

      t.timestamps
    end
  end
end