class RenameAdressToAddressInCats < ActiveRecord::Migration[7.0]
  def change
    rename_column :cats, :adress, :address
  end
end
