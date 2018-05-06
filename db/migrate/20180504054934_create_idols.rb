class CreateIdols < ActiveRecord::Migration[5.1]
  def change
    create_table :idols do |t|
      t.text :name

      t.timestamps
    end
  end
end
