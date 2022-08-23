class AddColumnToSurfboards < ActiveRecord::Migration[7.0]
  def change
    add_column :surfboards, :description, :string
  end
end
