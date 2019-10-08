class AddImageToImages < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :title, :string
    add_column :images, :image, :string
    add_column :images, :bytes, :integer
  end
end
