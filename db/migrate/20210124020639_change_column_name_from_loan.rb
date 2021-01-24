class ChangeColumnNameFromLoan < ActiveRecord::Migration[6.1]
  def change
    rename_column :loans, :user_id, :client_id
  end
end
