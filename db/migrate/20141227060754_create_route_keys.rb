class CreateRouteKeys < ActiveRecord::Migration
  def change
    create_table :route_keys do |t|
      t.string :key
      t.references :custom_route, index: true

      t.timestamps
    end
  end
end
