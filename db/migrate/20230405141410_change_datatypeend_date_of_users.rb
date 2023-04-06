class ChangeDatatypeendDateOfUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :endDate, :date
  end
end
