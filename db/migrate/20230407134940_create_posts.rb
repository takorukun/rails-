class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.date :startDate
      t.date :endDate
      t.string :allDay
      t.string :memo

      t.timestamps
    end
  end
end
