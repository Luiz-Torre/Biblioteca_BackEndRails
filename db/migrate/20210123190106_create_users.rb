class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :cpf
      t.string :telephone
      t.integer :role, default: 0
      t.string :email

      t.timestamps
    end
  end
end
