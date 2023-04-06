class ChangeDatatypestartDateOfUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :startDate, :date
  end
end
