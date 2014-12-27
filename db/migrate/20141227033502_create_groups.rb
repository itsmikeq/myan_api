class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :owner_id
      t.string :name
      t.integer :owner_type

      t.timestamps
    end
  end
end
