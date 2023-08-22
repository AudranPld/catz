class AddUserToCats < ActiveRecord::Migration[7.0]
  def change
    add_reference :cats, :user, null: true, foreign_key: true
  end
end
