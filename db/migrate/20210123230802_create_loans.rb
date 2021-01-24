class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.date :expiry_date
      t.integer :delay_days
      t.float :fine
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
