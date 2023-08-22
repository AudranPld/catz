class AddImageToCats < ActiveRecord::Migration[7.0]
  def change
    add_column :cats, :image, :string
  end
end
