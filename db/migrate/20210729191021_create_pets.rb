class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.string :category
      t.text :description
      t.integer :pricing
      t.references :owner, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
