class CreatePidols < ActiveRecord::Migration[5.1]
  def change
    create_table :pidols do |t|
      t.integer :modelid
      t.text :name

      t.timestamps
    end
  end
end
