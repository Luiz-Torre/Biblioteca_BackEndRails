class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.date :expiry_date
      t.integer :delay_days
      t.float :fine, default: 0
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
