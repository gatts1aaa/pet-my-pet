class AddColumnsToPets < ActiveRecord::Migration[6.0]
  def change
    add_column :pets, :name, :string
    add_column :pets, :age, :integer
    add_column :pets, :category, :string
    add_column :pets, :description, :text
    add_column :pets, :pricing, :string
    add_reference :pets, :users
  end
end
