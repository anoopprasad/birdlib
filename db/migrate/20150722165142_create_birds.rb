class CreateBirds < ActiveRecord::Migration
  def change
    create_table :birds do |t|
      t.string :name
      t.string :family
      t.text :continents
      t.boolean :visible

      t.timestamps null: false
    end
  end
end
