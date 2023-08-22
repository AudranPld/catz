class ChangeSexColumnToGenderInCat < ActiveRecord::Migration[7.0]
  def change
    rename_column :cats, :sex, :gender
  end
end
