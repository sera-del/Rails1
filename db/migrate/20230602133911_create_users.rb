class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :title
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :is_all_day
      t.text :memo

      t.timestamps
    end
  end
end
