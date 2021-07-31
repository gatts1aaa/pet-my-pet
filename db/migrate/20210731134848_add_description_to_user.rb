class AddDescriptionToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :decription, :text
  end
end
