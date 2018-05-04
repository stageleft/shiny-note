class CreateChoices < ActiveRecord::Migration[5.1]
  def change
    create_table :choices do |t|
      t.integer :event
      t.text :name
      t.integer :Vo
      t.integer :Da
      t.integer :Vi
      t.integer :Me
      t.integer :Sp

      t.timestamps
    end
  end
end
