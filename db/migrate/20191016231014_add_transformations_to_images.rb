class AddTransformationsToImages < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :transformations, :string
  end
end
