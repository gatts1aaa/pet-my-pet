class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :date
      t.boolean :archived
      t.references :customer, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
