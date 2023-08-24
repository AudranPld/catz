class CreateCats < ActiveRecord::Migration[7.0]
  def change
    create_table :cats do |t|
      t.string :address
      t.string :sex
      t.string :breed
      t.integer :price

      t.timestamps
    end
  end
end
