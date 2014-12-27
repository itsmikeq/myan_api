class CreateCustomRoutes < ActiveRecord::Migration
  def change
    create_table :custom_routes do |t|
      t.integer :owner_id
      t.string :name
      t.string :owner_type
      t.string :data
      t.integer :version

      t.timestamps
    end
  end
end
