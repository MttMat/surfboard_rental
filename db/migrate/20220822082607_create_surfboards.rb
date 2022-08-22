class CreateSurfboards < ActiveRecord::Migration[7.0]
  def change
    create_table :surfboards do |t|
      t.string :material_type
      t.string :brand
      t.float :price
      t.string :shape
      t.float :lenght
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
