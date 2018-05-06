class CreateEventLists < ActiveRecord::Migration[5.1]
  def change
    create_table :event_lists do |t|
      t.text :model
      t.integer :modelid
      t.text :name

      t.timestamps
    end
  end
end
